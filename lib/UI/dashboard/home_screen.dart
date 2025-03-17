import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart'; // Import for charts
import 'package:hygienic_tank/UI/dashboard/completed_tasks.dart';
import 'package:hygienic_tank/UI/dashboard/pending_tasks.dart';
import 'package:hygienic_tank/UI/dashboard/todays_work_list.dart';
import 'package:hygienic_tank/models/home_page_response.dart' as homePage;
import 'package:hygienic_tank/models/new_enquiry_response_model.dart'
    as enquiry;

import 'package:hygienic_tank/network/api_service.dart';
import 'package:intl/intl.dart';
import 'package:geolocator/geolocator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<homePage.HomePageResponse?> dashboardData;
  DateTime ourDateExample = DateTime.now();
  @override
  void initState() {
    super.initState();
    ApiService apiService = ApiService();
    dashboardData = apiService.getDashboard();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(title: const Text('Dashboard')),
      body: FutureBuilder<homePage.HomePageResponse?>(
        future: dashboardData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError || snapshot.data == null) {
            return const Center(child: Text("Failed to load data"));
          } else {
            homePage.OData oData = snapshot.data!.oData;
            int completedWorks = int.tryParse(oData.completedWorks) ?? 0;
            int pendingWorks = int.tryParse(oData.pendingWorks) ?? 0;

            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Work Summary",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        child: _buildInfoCard(
                            "Completed", oData.completedWorks, Colors.green),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const ScreenCompletedTask()),
                          );
                        },
                      ),
                      GestureDetector(
                        child: _buildInfoCard(
                            "Pending", oData.pendingWorks, Colors.orange),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const ScreenPendingTask()),
                          );
                        },
                      ),
                      GestureDetector(
                        child: _buildInfoCard(
                            "Today's", oData.todaysWorks, Colors.blue),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const TodaysWorkListScreen()),
                          );
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  _buildPieChart(
                      completedWorks, pendingWorks), // Pie Chart Widget
                ],
              ),
            );
          }
        },
      ),
      drawer: mydrawer(context),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddEnquiryDialog(context);
        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
    );
  }

  Widget _buildInfoCard(String title, String value, Color color) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        width: 100,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: color.withOpacity(0.2),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              value,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
            const SizedBox(height: 8),
            Text(title, style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }

  Widget _buildPieChart(int completed, int pending) {
    return Column(
      children: [
        const Text(
          "Work Distribution",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 200,
          child: PieChart(
            PieChartData(
              sections: [
                PieChartSectionData(
                  value: completed.toDouble(),
                  title: "$completed\nCompleted",
                  color: Colors.green,
                  radius: 60,
                  titleStyle: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                PieChartSectionData(
                  value: pending.toDouble(),
                  title: "$pending\nPending",
                  color: Colors.orange,
                  radius: 60,
                  titleStyle: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
              sectionsSpace: 2,
              centerSpaceRadius: 40,
            ),
          ),
        ),
      ],
    );
  }

  void _showAddEnquiryDialog(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController mobileController = TextEditingController();
    final TextEditingController serviceTypeController = TextEditingController();
    final TextEditingController locationController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          // Use Dialog instead of AlertDialog for better flexibility
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0), // Add padding
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "New Enquiry",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: nameController,
                    decoration: const InputDecoration(labelText: "Name"),
                  ),
                  TextField(
                    controller: mobileController,
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(labelText: "Mobile"),
                  ),
                  TextField(
                    controller: serviceTypeController,
                    decoration: const InputDecoration(
                        labelText: "Service Type", hintText: "* cleaning"),
                  ),
                  // TextField(
                  //   controller: locationController,
                  //   decoration: const InputDecoration(labelText: "Location"),
                  // ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text("Cancel"),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          if (nameController.text.isEmpty ||
                              mobileController.text.isEmpty ||
                              serviceTypeController.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("All fields are required"),
                                backgroundColor: Colors.red,
                              ),
                            );
                            return;
                          }

                          // Get current location
                          Position position = await _determinePosition();
                          double latitude = position.latitude;
                          double longitude = position.longitude;

                          ApiService apiService = ApiService();
                          String formattedDate =
                              DateFormat('yyyy/MM/dd').format(ourDateExample);
                          print(formattedDate);
                          enquiry.AddEnquiryResponseModel? response =
                              await apiService.addEnquiry(
                                  name: nameController.text,
                                  mobile: mobileController.text,
                                  serviceType: serviceTypeController.text,
                                  latitude: latitude.toString(),
                                  longitude: longitude.toString(),
                                  date: formattedDate);
                          Navigator.pop(context);
                          if (response != null && response.status == "1") {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Enquiry submitted successfully"),
                                backgroundColor: Colors.green,
                              ),
                            );
                          } else {
                            print(response);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(response?.error ??
                                    "Failed to submit enquiry"),
                                backgroundColor: Colors.red,
                              ),
                            );
                          }
                        },
                        child: const Text("Submit"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Check if location services are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception("Location services are disabled.");
    }

    // Check permission status
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception("Location permissions are denied.");
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw Exception(
          "Location permissions are permanently denied, we cannot request permissions.");
    }

    // Get the current position
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  Drawer mydrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 30,
                  child: Icon(Icons.person, size: 40),
                ),
                SizedBox(height: 10),
                Text("User Name",
                    style: TextStyle(color: Colors.white, fontSize: 18)),
                Text("user@example.com",
                    style: TextStyle(color: Colors.white70)),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text("New Enquiry"),
            onTap: () {
              Navigator.pop(context);
              _showAddEnquiryDialog(context);
            },
          ),
        ],
      ),
    );
  }
}
