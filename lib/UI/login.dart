// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tu_hoc_flutter/constant/app_data.dart';
import 'package:tu_hoc_flutter/model/login.dart';
import 'package:tu_hoc_flutter/model/model.dart';
import 'home.dart';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isCheck = false;
  String name = '';
  String pass = '';
  String? errorTextUser;
  String? errorTextPass;

  Future<BaseResponseApi?> login(BuildContext context) async {
    String url = "https://admin.baobibigstar.com/api/User/Login";

    try {
      var res = await http.post(
        Uri.parse(url),
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode(
          <String, dynamic>{
            "username": usernameController.text,
            "password": passwordController.text,
          },
        ),
      );
      final Map<String, dynamic> jsonResponse = jsonDecode(res.body);
      var result = BaseResponseApi.fromJson(jsonResponse);

      if (result.success ?? false) {
        AppData.auth = LoginModel.fromJson(result.data);

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Home(),
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(result.messages.toString()),
            backgroundColor: Colors.green,
          ),
        );
      } else if (usernameController.text.isEmpty &&
          passwordController.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Bạn chưa nhập username hoặc password'),
            backgroundColor: Colors.red,
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(result.messages.toString()),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {
      print(e);
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        //Khắc phục lỗi tràn viền
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                width: 60, // Đường kính khung tròn
                height: 70,
                decoration: BoxDecoration(
                  color: Colors.blue, // Màu nền của khung tròn
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.blue, width: 2), // Viền xanh
                ),
                alignment: Alignment.center,
                child: Text(
                  'M',
                  style: TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Container(
              width: 300,
              alignment: Alignment.center,
              child: Text(
                'Macca App',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              width: 300,
              child: TextField(
                keyboardType: TextInputType.text,
                controller: usernameController,
                decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () {
                        usernameController.clear();
                      },
                      icon: Icon(Icons.clear),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Nhập Username',
                    hintStyle: TextStyle(color: Colors.black),
                    prefixIcon: Icon(Icons.person),
                    prefixIconColor: Colors.blue,
                    labelText: 'Số di động hoặc email',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(
                          color: const Color.fromARGB(255, 213, 9, 9)),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                        borderRadius: BorderRadius.all(Radius.circular(20)))),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              width: 300,
              child: TextField(
                obscureText: !isCheck,
                keyboardType: TextInputType.text,
                controller: passwordController,
                decoration: InputDecoration(
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isCheck = !isCheck;
                          });
                        },
                        icon: isCheck
                            ? Icon(Icons.visibility)
                            : Icon(Icons.visibility_off)),
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Nhập Password',
                    hintStyle: TextStyle(color: Colors.black),
                    prefixIcon: Icon(Icons.lock),
                    prefixIconColor: Colors.blue,
                    labelText: 'Mật khẩu',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(
                          color: const Color.fromARGB(255, 213, 9, 9)),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                        borderRadius: BorderRadius.all(Radius.circular(20)))),
              ),
            ),
            SizedBox(
              height: 7,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // Đặt màu nền là màu xanh
              ),
              onPressed: () {
                login(context);
              },
              child: Container(
                alignment: Alignment.center,
                width: 250,
                height: 35,
                child: Text(
                  'Đăng nhập',
                  style: TextStyle(
                    fontSize: 19,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 7,
            ),
            SizedBox(
              width: 300,
              child: Center(
                child: Text(
                  'Bạn quên mật khẩu à?',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Text('Tài khoản là: $name'),
            Text('Mật khẩu là: $pass'),
            SizedBox(
              height: 240,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white, // Đặt màu nền là màu xanh
              ),
              onPressed: () {},
              child: Container(
                alignment: Alignment.center,
                width: 250,
                height: 35,
                child: const Text(
                  'Tạo tài khoản mới',
                  style: TextStyle(
                    fontSize: 19,
                    color: Colors.blue,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 7,
            ),
            SizedBox(
              width: 300,
              child: Center(
                child: Text(
                  '∞ Macca',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
