import 'package:flutter/material.dart';
import 'package:hygienic_tank/UI/dashboard/completed_task_details_screen.dart';
import 'package:hygienic_tank/appConstants.dart';
import 'package:hygienic_tank/network/api_service.dart';
import 'package:intl/intl.dart';
import 'package:hygienic_tank/models/list_of_pending_work_response.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ScreenCompletedTask extends StatefulWidget {
  const ScreenCompletedTask({super.key});

  @override
  State<ScreenCompletedTask> createState() => _ScreenCompletedTaskState();
}

class _ScreenCompletedTaskState extends State<ScreenCompletedTask> {
  List<CompletedWork> completedWorks = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchCompletedWorks();
  }

  Future<void> fetchCompletedWorks() async {
    final url = Uri.parse(
        'https://hygienictank.sanluigibhavan.com/webservices/Employee/list_of_completed_work');
    ApiService apiService = ApiService();
    String? token = await apiService.getAccessToken();
    var headers = {'x-api-key': x_api_key};
    var body = {'access_token': token};
    try {
      final response = await http.post(
        url,
        headers: headers,
        body: body,
      );
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          completedWorks = (data['oData']['completed_works'] as List)
              .map((e) => CompletedWork.fromJson(e))
              .toList();
          isLoading = false;
        });
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Completed Tasks'),
      ),
      drawer: mydrawer(context),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : completedWorks.isEmpty
              ? const Center(child: Text("No completed tasks available"))
              : ListView.builder(
                  padding: const EdgeInsets.all(10.0),
                  itemCount: completedWorks.length,
                  itemBuilder: (context, index) {
                    final work = completedWorks[index];
                    return Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 4,
                      child: ListTile(
                        title: Text("Work ID: ${work.workId}"),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                "Work Date: ${DateFormat('yyyy-MM-dd').format(work.workDate)}"),
                            Text("Total Amount: \₹ ${work.totalAmount}"),
                            Text(
                              "Payment Status: ${work.paymentStatus}",
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text("Tank Type: ${work.tankType}"),
                            Text("Location: ${work.location}"),
                          ],
                        ),
                        trailing: const Icon(Icons.arrow_forward_ios),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  CompletedWorkDetailScreen(work: work),
                            ),
                          );
                        },
                      ),
                    );
                  },
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
