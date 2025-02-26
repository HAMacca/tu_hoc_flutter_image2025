// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ProductDetailScreen extends StatefulWidget {
  final String name;
  final String color;
  final double price;
  final String generation;
  final int year;
  final String cpuModel;
  final String hardDiskSize;
  final String strapColour;
  final String caseSize;
  final String description;
  final double screenSize;
  final int capacityGB;
  const ProductDetailScreen({
    super.key,
    required this.name,
    required this.color,
    required this.price,
    required this.generation,
    required this.year,
    required this.cpuModel,
    required this.hardDiskSize,
    required this.strapColour,
    required this.caseSize,
    required this.description,
    required this.screenSize,
    required this.capacityGB,
  });

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Màn chi tiết '),
      ),
      body: Center(
        child: Column(
          children: [
            Text(widget.name),
            Text('Giá: ${widget.price} \$'),
            Text(widget.caseSize),
            Text(widget.color),
            Text(widget.cpuModel),
            Text(widget.generation),
            Text(widget.hardDiskSize),
            Text('${widget.capacityGB}'),
            Text(widget.year.toString()),
          ],
        ),
      ),
    );
  }
}
