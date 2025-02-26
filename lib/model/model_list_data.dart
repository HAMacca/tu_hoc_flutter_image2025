// ignore_for_file: public_member_api_docs, sort_constructors_first
class ProductModel {
  final String id;
  final String name;
  final ProductData? data;

  ProductModel({required this.id, required this.name, this.data});

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] as String,
      name: json['name'] as String,
      data: json['data'] != null ? ProductData.fromJson(json['data']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'data': data?.toJson(),
    };
  }

  @override
  String toString() => 'ProductModel(id: $id, name: $name, data: $data)';
}

class ProductData {
  final String? color;
  final String? capacity;
  final int? capacityGB;
  final double? price;
  final String? generation;
  final int? year;
  final String? cpuModel;
  final String? hardDiskSize;
  final String? strapColour;
  final String? caseSize;
  final String? description;
  final double? screenSize;

  ProductData({
    this.color,
    this.capacity,
    this.capacityGB,
    this.price,
    this.generation,
    this.year,
    this.cpuModel,
    this.hardDiskSize,
    this.strapColour,
    this.caseSize,
    this.description,
    this.screenSize,
  });

  factory ProductData.fromJson(Map<String, dynamic> json) {
    return ProductData(
      color: json['color'] ?? json['Color'],
      capacity: json['capacity'] ?? json['Capacity'],
      capacityGB: json['capacity GB'] as int?,
      price: (json['price'] is int) ? (json['price'] as int).toDouble() : json['price'] as double?,
      generation: json['generation'] ?? json['Generation'],
      year: json['year'] as int?,
      cpuModel: json['CPU model'] as String?,
      hardDiskSize: json['Hard disk size'] as String?,
      strapColour: json['Strap Colour'] as String?,
      caseSize: json['Case Size'] as String?,
      description: json['Description'] as String?,
      screenSize: json['Screen size'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'color': color,
      'capacity': capacity,
      'capacity GB': capacityGB,
      'price': price,
      'generation': generation,
      'year': year,
      'CPU model': cpuModel,
      'Hard disk size': hardDiskSize,
      'Strap Colour': strapColour,
      'Case Size': caseSize,
      'Description': description,
      'Screen size': screenSize,
    };
  }

  @override
  String toString() {
    return 'ProductData(color: $color, capacity: $capacity, capacityGB: $capacityGB, price: $price, generation: $generation, year: $year, cpuModel: $cpuModel, hardDiskSize: $hardDiskSize, strapColour: $strapColour, caseSize: $caseSize, description: $description, screenSize: $screenSize)';
  }
}
