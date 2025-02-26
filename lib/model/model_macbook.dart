class Mac {
  String? id;
  String? name;
  Data? data;
  Mac({
    this.id,
    this.name,
    this.data,
  });
  factory Mac.fromJson(Map<String, dynamic> json) {
    return Mac(
      id: json['id'],
      name: json['name'],
      data: json['data'] != null
          ? Data.fromJson(json['data'] as Map<String, dynamic>)
          : null,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "data": data,
    };
  }

  @override
  String toString() => 'Mac(id: $id, name: $name, data: $data)';
}

class Data {
  int? year;
  double? price;

  Data({
    this.year,
    this.price,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      year: json['year'],
      price: json['price'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "year": year,
      "price": price,
    };
  }
}
