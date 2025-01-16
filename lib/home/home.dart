// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ScreeHome extends StatefulWidget {
  const ScreeHome({super.key});

  @override
  State<ScreeHome> createState() => _ScreeHomeState();
}

class _ScreeHomeState extends State<ScreeHome> {
  List<Product> listProduct = [
    // sp tra sua có tên, giá, size
    // sp cafe có tên, giá, size
  ];
  // list body có tên, giá, size
  // 1sp sẽ có 3 thuộc tính là tên, giá, kích thước
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController sizeController = TextEditingController();
  String? error;

  int selected = -1;

  @override
  void dispose() {
    nameController.dispose();
    priceController.dispose();
    sizeController.dispose();
    super.dispose();
  }

  /// hàm thêm sp
  void addProduct() {
    var name = nameController.text;
    var price = priceController.text;
    var size = sizeController.text;

    setState(() {
      bool checkNameProduct =
          listProduct.any((e) => e.name == nameController.text);
      if (name.isNotEmpty && price.isNotEmpty && size.isNotEmpty) {
        if (checkNameProduct) {
          //
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Thông Báo'),
                content: Text('Sản phẩm đã tồn tại'),
              );
            },
          );
        } else {
          listProduct.add(Product(
            name: name,
            price: double.parse(price),
            size: size,
          ));
          print('listProduct: ==== $listProduct');
        }
      } else {
        setState(() {
          error = 'Không được để trống';
        });
      }

      nameController.clear();
      priceController.clear();
      sizeController.clear();
    });
  }

  // hàm xóa sp
  void delete(int index) {
    setState(() {
      listProduct.removeAt(index);
    });
  }

  // hàm lưu index tạm thời
  void selectedProduct(int index) {
    setState(() {
      selected = index; // Lưu lại index
      nameController.text = listProduct[selected].name;
      priceController.text = listProduct[selected].price.toString();
      sizeController.text = listProduct[selected].size;
    });
  }

  /// put sp
  void putProduct() {
    setState(() {
      var name = nameController.text;
      var price = priceController.text;
      var size = sizeController.text;

      if (selected != -1) {
        nameController.text = listProduct[selected].name;
        priceController.text = listProduct[selected].price.toString();
        sizeController.text = listProduct[selected].size;
      }

      // Cập nhật thông tin sản phẩm khi người dùng chỉnh sửa
      if (name.isNotEmpty && price.isNotEmpty && size.isNotEmpty) {
        listProduct[selected] = Product(
          name: name,
          price: double.parse(price),
          size: size,
        );
        print(listProduct);

        // Xóa nội dung của các TextField sau khi sửa
        nameController.clear();
        priceController.clear();
        sizeController.clear();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      appBar: AppBar(
        title: Text("Todo List"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 350,
              child: TextField(
                keyboardType: TextInputType.text,
                controller: nameController,
                decoration: InputDecoration(
                    errorText: error,
                    suffixIcon: IconButton(
                        onPressed: () {
                          nameController.clear();
                        },
                        icon: Icon(Icons.clear)),
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Nhập tên sản phẩm',
                    hintStyle: TextStyle(color: Colors.black),
                    prefixIcon: Icon(Icons.search),
                    prefixIconColor: Colors.blue,
                    labelText: 'tên sản phẩm',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(
                          color: const Color.fromARGB(255, 9, 213, 176)),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                        borderRadius: BorderRadius.all(Radius.circular(20)))),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              width: 350,
              child: TextField(
                keyboardType: TextInputType.text,
                controller: priceController,
                decoration: InputDecoration(
                    errorText: error,
                    suffixIcon: IconButton(
                        onPressed: () {
                          priceController.clear();
                        },
                        icon: Icon(Icons.clear)),
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Nhập giá sản phẩm',
                    hintStyle: TextStyle(color: Colors.black),
                    prefixIcon: Icon(Icons.search),
                    prefixIconColor: Colors.blue,
                    labelText: 'Giá sản phẩm',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(
                          color: const Color.fromARGB(255, 9, 213, 176)),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: const Color.fromARGB(255, 76, 104, 175)),
                        borderRadius: BorderRadius.all(Radius.circular(20)))),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              width: 350,
              child: TextField(
                keyboardType: TextInputType.text,
                controller: sizeController,
                decoration: InputDecoration(
                    errorText: error,
                    suffixIcon: IconButton(
                        onPressed: () {
                          sizeController.clear();
                        },
                        icon: Icon(Icons.clear)),
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Nhập Size sản phẩm',
                    hintStyle: TextStyle(color: Colors.black),
                    prefixIcon: Icon(Icons.search),
                    prefixIconColor: Colors.blue,
                    labelText: 'Kích thước sản phẩm',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(
                          color: const Color.fromARGB(255, 9, 213, 176)),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: const Color.fromARGB(255, 76, 175, 165)),
                        borderRadius: BorderRadius.all(Radius.circular(20)))),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      addProduct();
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color(0xff2E5077),
                        borderRadius: BorderRadius.circular(20)),
                    width: 170,
                    height: 50,
                    child: Center(
                      child: Text(
                        'Thêm sản phẩm',
                        style: TextStyle(
                            color: Color(0xffF6F4F0),
                            fontSize: 16,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    putProduct();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color(0xff2E5077),
                        borderRadius: BorderRadius.circular(20)),
                    width: 170,
                    height: 50,
                    child: Center(
                      child: Text(
                        'Sửa sản phẩm',
                        style: TextStyle(
                            color: Color(0xffF6F4F0),
                            fontSize: 16,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Danh sách sản phẩm",
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
            SizedBox(
              height: 500,
              child: listProduct.isEmpty
                  ? Center(child: Text('Danh đang sách trống'))
                  : ListView.builder(
                      itemCount: listProduct.length,
                      itemBuilder: (BuildContext context, int index) {
                        var product = listProduct.elementAt(index);
                        return InkWell(
                          onTap: () {
                            print('sản phẩm được chọn: $index');
                          },
                          child: Container(
                            height: 80,
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 8),
                            margin: EdgeInsets.only(
                                left: 20, right: 20, bottom: 10, top: 10),
                            decoration: BoxDecoration(
                                color: Color(0xff2E5077),
                                borderRadius: BorderRadius.circular(15)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Tên sản phẩm: ${product.name}',
                                      style: TextStyle(
                                        color: Color(0xffF6F4F0),
                                        fontSize: 15,
                                      ),
                                    ),
                                    Text(
                                      'Giá sản phẩm: ${product.price}',
                                      style: TextStyle(
                                        color: Color(0xffF6F4F0),
                                        fontSize: 15,
                                      ),
                                    ),
                                    Text(
                                      'Kích thước: ${product.size}',
                                      style: TextStyle(
                                        color: Color(0xffF6F4F0),
                                        fontSize: 15,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        selectedProduct(index);
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                              title: Text('Thông Báo'),
                                              content: Text(
                                                  'Bạn có muốn sửa sản phẩm không?'),
                                            );
                                          },
                                        );
                                      },
                                      child: Icon(
                                        Icons.edit,
                                        color: Color(0xffF6F4F0),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        delete(index);
                                      },
                                      child: Icon(
                                        Icons.delete,
                                        color: Color(0xffF6F4F0),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      }),
            )
          ],
        ),
      ),
    );
  }
}

class Product {
  String name;
  double price;
  String size;
  Product({
    required this.name,
    required this.price,
    required this.size,
  });
  @override
  String toString() {
    return 'name: $name, giá: $price, kích thước: $size';
  }
}
