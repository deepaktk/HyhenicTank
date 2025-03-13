import 'package:flutter/material.dart';
import 'package:hygienic_tank/UI/dashboard/home_screen.dart';
import 'package:hygienic_tank/UI/login/login_screen.dart';
import 'package:hygienic_tank/network/api_service.dart';

import 'UI/splash_screen.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   ApiService apiService = ApiService();

//   bool isLoggedIn = await apiService.isLoggedIn();
//   runApp(MaterialApp(
//     debugShowCheckedModeBanner: false,
//     home: isLoggedIn ? const HomeScreen() : const LoginScreen(),
//   ),);
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Hygienic Tank',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: const SplashScreen(),
//     );
//   }
// }
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  ApiService apiService = ApiService();
  bool isLoggedIn = await apiService.isLoggedIn();

  runApp(MyApp(isLoggedIn: isLoggedIn));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;

  const MyApp({super.key, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hygienic Tank',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: isLoggedIn ? const HomeScreen() : const LoginScreen(),
    );
  }
}
