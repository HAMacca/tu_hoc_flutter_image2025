// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:tu_hoc_flutter/constant/app_data.dart';

class Home extends StatefulWidget {
  const Home({
    Key? key,
  }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final auth = AppData.auth;
 // final mac = AppData.dataMac;

  // Future<void> getDataMacbook({required int id}) async {
  //   String url = "https://api.restful-api.dev/objects/$id";
  //   try {
  //     var res = await http.get(Uri.parse(url));
  //     final result = ModelMacbook.fromJson(jsonDecode(res.body));
  //     AppData.dataMac = Data.fromJson(result.data as Map<String, dynamic>);
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  @override
  void initState() {
   // getDataMacbook(id: 7);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(child: Text('Xin chào ${auth.username}')),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              auth.userId.toString(),
            ),
            //Text('${mac.price}'),
          ],
        ),
      ),
    );
  }
}
