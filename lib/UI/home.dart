// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tu_hoc_flutter/constant/app_data.dart';
import 'package:http/http.dart' as http;

import '../model/model_macbook.dart';

class Home extends StatefulWidget {
  const Home({
    Key? key,
  }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final auth = AppData.auth;
  Mac? mac;

  Future<void> getDataMacbook({required int id}) async {
    String url = "https://api.restful-api.dev/objects/$id";
    try {
      var res = await http.get(Uri.parse(url));
      if (res.statusCode == 200) {
        final result = Mac.fromJson(jsonDecode(res.body));
        setState(() {
          mac = result;
        });
        print("====> $result");
      }
    } catch (e) {
      print('== lỗi: $e');
    }
  }

  @override
  void initState() {
    getDataMacbook(id: 7);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(child: Text('Xin chào ${auth.username}')),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Tên Macbook: ${mac!.name ?? ''}',
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
            Text('Năm sản xuất: ${mac!.data?.year ?? 1}',
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
            Text('Giá: ${mac!.data?.price ?? 1}',
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
