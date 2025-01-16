import 'package:flutter/material.dart';

class ScreeHomeImage extends StatelessWidget {
  ScreeHomeImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.asset(
            'assets/images/ang.jpg',
            // width: 30,
            // height: 30,
          ),
          const SizedBox(
            height: 50,
          ),
          const Text(
            'Ảnh vừa sửa',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
            'cảnh sửa ở đây',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          )
        ],
      ),
      //ang
    );
  }
}
