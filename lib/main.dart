import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_profile/login_page.dart';
import 'package:getx_profile/profile_page.dart';
import 'package:getx_profile/register_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'My Profile',
      initialRoute: '/login', // Set halaman awal ke Login Page
      getPages: [
        GetPage(name: '/login', page: () => LoginPage()),
        GetPage(name: '/register', page: () => RegisterPage()),
        GetPage(
          name: '/profile',
          page: () {
            // Parse data yang dikirimkan dari halaman sebelumnya (RegisterPage)
            final args = Get.arguments as Map<String, dynamic>;
            return ProfilePage(userData: args);
          },
        ),
      ],
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
