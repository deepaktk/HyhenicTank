import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:hygienic_tank/UI/dashboard/pending_tasks.dart';
import 'package:hygienic_tank/models/home_page_response.dart';
import 'package:hygienic_tank/network/api_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<HomePageResponse?> dashboardData;

  @override
  void initState() {
    super.initState();
    ApiService apiService = ApiService();
    dashboardData = apiService.getDashboard();
  }

  // Future<HomePageResponse?> getDashboard() async {
  //   try {
  //     var headers = {
  //       'x-api-key': 'HN2vhNiKFnOLQD19b0bY',
  //     };
  //     var data = FormData.fromMap({'access_token': getAccessToken()});

  //     var dio = Dio();
  //     var response = await dio.request(
  //       '${baseUrl}User/home',
  //       options: Options(
  //         method: 'POST',
  //         headers: headers,
  //       ),
  //       data: data,
  //     );

  //     if (response.statusCode == 200) {
  //       return HomePageResponse.fromJson(response.data);
  //     } else {
  //       print(response.statusMessage);
  //       return null;
  //     }
  //   } catch (e) {
  //     print("API Error: $e");
  //     return null;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      body: FutureBuilder<HomePageResponse?>(
        future: dashboardData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
                child: CircularProgressIndicator()); // Loading indicator
          } else if (snapshot.hasError || snapshot.data == null) {
            return const Center(child: Text("Failed to load data"));
          } else {
            // Extract data
            OData oData = snapshot.data!.oData;

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
                      _buildInfoCard(
                          "Completed", oData.completedWorks, Colors.green),
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
                      _buildInfoCard("Today's", oData.todaysWorks, Colors.blue),
                    ],
                  ),
                ],
              ),
            );
          }
        },
      ),
      drawer: mydrawer(context),
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
            leading: const Icon(Icons.home),
            title: const Text("Home"),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text("Settings"),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text("Logout"),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
