// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tu_hoc_flutter/UI/product_detail.dart';
import 'package:tu_hoc_flutter/constant/app_data.dart';
import 'package:http/http.dart' as http;
import 'package:tu_hoc_flutter/model/model_list_data.dart';

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
  List<ProductModel> product = [];

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

  Future<void> getProduct() async {
    String url = "https://api.restful-api.dev/objects";
    try {
      var res = await http.get(Uri.parse(url));
      if (res.statusCode == 200) {
        List<dynamic> bodyjson = jsonDecode(res.body);
        List<ProductModel> data = bodyjson
            .map((e) => ProductModel.fromJson(e))
            .cast<ProductModel>()
            .toList();
        print('==>>> $data');
        setState(() {
          product = data;
        });
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    getDataMacbook(id: 7);
    getProduct();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(child: Text('Xin chào ${auth.username}')),
      ),
      body: Column(
        children: [
          const Center(
            child: Text(
              'Danh sách các sản phẩm',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: product.length,
              itemBuilder: (context, index) {
                var item = product[index];
                var items = item.data;
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetailScreen(
                          name: item.name,
                          color: items?.color ?? 'Chưa có dữ liệu',
                          price: items?.price?.toDouble() ?? 0,
                          generation: items?.generation ?? ' Chưa có dữ liệu',
                          year: items?.year?.toInt() ?? 1,
                          cpuModel: items?.cpuModel ?? 'Chưa có dữ liệu',
                          hardDiskSize:
                              items?.hardDiskSize ?? 'Chưa có dữ liệu',
                          strapColour: items?.strapColour ?? 'Chưa có dữ liệu',
                          caseSize: items?.caseSize ?? 'Chưa có dữ liệu',
                          description: items?.description ?? 'Chưa có dữ liệu',
                          screenSize: items?.screenSize?.toDouble() ?? 1,
                          capacityGB: items?.capacityGB?.toInt() ?? 1,
                        ),
                      ),
                    );
                    setState(() {});
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    margin:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                    width: size.width,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 219, 177, 51),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.blue),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 2),
                            blurRadius: 6,
                          ),
                        ]),
                    height: 80,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(item.name),
                        Text('Màu sắc: ${items?.color ?? 'Chưa có dữ liệu'}'),
                        Text('Giá: ${items?.price ?? 'Chưa có dữ liệu'}'),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
