import 'package:dio/dio.dart';
import 'package:hygienic_tank/models/login_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/home_page_response.dart';

class ApiService {
  final String baseUrl = "https://hygienictank.sanluigibhavan.com/webservices/";

  // Login Function
  Future<LoginResponse?> login(String username, String password) async {
    try {
      var headers = {
        'x-api-key': 'HN2vhNiKFnOLQD19b0bY',
        //'Cookie': 'ci_session=ccaae084df11f9a9cff18f256ee7c34ab05c1259'
      };
      var data = FormData.fromMap({
        'user_name': username,
        'password': password,
        'lattitude': '',
        'longitude': ''
      });

      var dio = Dio();
      var response = await dio.request(
        '${baseUrl}User/login',
        options: Options(
          method: 'POST',
          headers: headers,
        ),
        data: data,
      );

      if (response.statusCode == 200) {
        LoginResponse loginResponse = LoginResponse.fromJson(response.data);
        await saveAccessToken(loginResponse.accessToken);
        return loginResponse;
      } else {
        print(response.statusMessage);
      }
    } catch (e) {
      print("Login Error: $e");
      return null;
    }
  }

  // Save Access Token in SharedPreferences
  Future<void> saveAccessToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("access_token", token);
  }

  // Get Access Token
  Future<String?> getAccessToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("access_token");
  }

  // Check if User is Logged In
  Future<bool> isLoggedIn() async {
    String? token = await getAccessToken();
    return token != null;
  }

  // Logout - Clear Access Token
  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove("access_token");
  }

  //homescreen

  Future<HomePageResponse?> getDashboard() async {
    String? token = await getAccessToken();
    try {
      var headers = {
        'x-api-key': 'HN2vhNiKFnOLQD19b0bY',
        //'Cookie': 'ci_session=ccaae084df11f9a9cff18f256ee7c34ab05c1259'
      };
      var data = FormData.fromMap({'access_token': token});

      var dio = Dio();
      var response = await dio.request(
        '${baseUrl}User/home',
        options: Options(
          method: 'POST',
          headers: headers,
        ),
        data: data,
      );

      if (response.statusCode == 200) {
        HomePageResponse homePageResponse =
            HomePageResponse.fromJson(response.data);
        print('hom${homePageResponse}');
        return homePageResponse;
      } else {
        print(response.statusMessage);
      }
    } catch (e) {
      print("Login Error: $e");
      return null;
    }
  }
}
