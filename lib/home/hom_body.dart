import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../model/profile_model.dart';

class ScreenHomeBody extends StatefulWidget {
  const ScreenHomeBody({super.key});

  @override
  State<ScreenHomeBody> createState() => _ScreenHomeBodyState();
}

class _ScreenHomeBodyState extends State<ScreenHomeBody> {
  @override
  void initState() {
    getDataApi();
    super.initState();
  }

  List<ProfileModel> listData = [];

  Future<void> getDataApi() async {
    final url = 'https://jsonplaceholder.typicode.com/users';
    try {
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        List<ProfileModel> listProfile = (data as List)
            .map(
              (e) => ProfileModel.fromJson(e),
            )
            .toList();

        setState(() {
          listData = listProfile;
        });
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: List.generate(
              listData.length,
              (index) {
                return SizedBox(
                  width: 500,
                  height: 100,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                            color: Colors.red,
                            child: Text('Tên: ${listData[index].name}')),
                        Text('Phone: ${listData[index].phone}'),
                        Text('Email: ${listData[index].email}'),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
