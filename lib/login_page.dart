import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final RxBool showPassword = false.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 2),
                child: Image.asset(
                  'assets/images/logo_getx.png',
                  width: 300,
                  height: 300,
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextFormField(
                      controller: usernameController,
                      decoration: InputDecoration(
                        hintText: 'Username',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Obx(() {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: TextFormField(
                        controller: passwordController,
                        obscureText: !showPassword.value,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          border: InputBorder.none,
                          suffixIcon: IconButton(
                            icon: Icon(showPassword.value ? Icons.visibility : Icons.visibility_off),
                            onPressed: () => showPassword.toggle(),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }),
              SizedBox(height: 20),
              Container(
                width: 150, // Atur lebar sesuai kebutuhan
                child: ElevatedButton(
                  onPressed: () {
                    if (usernameController.text.isNotEmpty && passwordController.text.isNotEmpty) {
                      Get.toNamed('/profile', arguments: {
                        'username': usernameController.text,
                        // Kirim data lain yang diperlukan ke page profil
                      });
                    } else {
                      Get.snackbar('Error', 'Harap isi semua data');
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    child: Text('Login', style: TextStyle(fontSize: 18)),
                  ),
                ),
              ),
              SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  Get.toNamed('/register');
                },
                child: Text('Belum memiliki akun? Buat akun disini', style: TextStyle(color: Colors.blue)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
