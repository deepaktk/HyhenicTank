import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hygienic_tank/UI/dashboard/work_detail_screen.dart';
import 'package:hygienic_tank/appConstants.dart';
import 'package:hygienic_tank/models/list_of_pending_work_response.dart';
import 'package:hygienic_tank/network/api_service.dart';

class ScreenPendingTask extends StatefulWidget {
  const ScreenPendingTask({super.key});

  @override
  State<ScreenPendingTask> createState() => _ScreenPendingTaskState();
}

class _ScreenPendingTaskState extends State<ScreenPendingTask> {
  List<CompletedWork> pendingWorks = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchPendingWorks();
  }

  Future<void> fetchPendingWorks() async {
    ApiService apiService = ApiService();
    String? token = await apiService.getAccessToken();
    try {
      var headers = {'x-api-key': x_api_key};
      var data = FormData.fromMap({'access_token': token});
      var dio = Dio();
      var response = await dio.post(
        'https://hygienictank.sanluigibhavan.com/webservices/Employee/list_of_pending_work',
        options: Options(headers: headers),
        data: data,
      );

      if (response.statusCode == 200) {
        ListOfPendingWorkResponse data =
            ListOfPendingWorkResponse.fromJson(response.data);
        setState(() {
          pendingWorks = data.oData.completedWorks;
          isLoading = false;
        });
      } else {
        print(response.statusMessage);
      }
    } catch (e) {
      print("API Error: $e");
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pending task'),
      ),
      drawer: mydrawer(context),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: pendingWorks.length,
              itemBuilder: (context, index) {
                CompletedWork work = pendingWorks[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WorkDetailScreen(work: work),
                      ),
                    );
                  },
                  child: Card(
                    margin: const EdgeInsets.all(10),
                    child: ListTile(
                      title: Text(work.clientName.toString()),
                      subtitle: Text("Status: ${work.status.toString()}"),
                      trailing: const Icon(Icons.arrow_forward),
                    ),
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

// class WorkDetailScreen extends StatelessWidget {
//   final CompletedWork work;

//   WorkDetailScreen({required this.work});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Work Details")),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text("Client Name: ${work.clientName}",
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//             SizedBox(height: 10),
//             Text("Tank Name: ${work.tankName}"),
//             Text("Tank Volume: ${work.tankVolume}"),
//             Text("Status: ${work.status}"),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () => Navigator.pop(context),
//               child: Text("Back"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
