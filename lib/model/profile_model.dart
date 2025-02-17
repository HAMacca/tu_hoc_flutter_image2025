class ProfileModel {
  int? id;
  String? name;
  String? email;
  String? phone;
  ProfileModel({
    this.id,
    this.name,
    this.email,
    this.phone,
  });
// lấy key của mình gán vào key của api
  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? "",
      email: json['email'] ?? "",
      phone: json['phone'] ?? "",
    );
  }
// gửi dữ liệu lên server
  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'email': email, 'phone': phone};
  }
}
