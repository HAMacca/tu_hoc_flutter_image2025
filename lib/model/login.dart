class LoginModel {
  String? token;
  int? userId;
  String? username;
  String? phoneNumber;
  String? email;

  LoginModel(
      {this.token, this.userId, this.username, this.phoneNumber, this.email});

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      token: json['token'],
      userId: json['userId'],
      username: json['username'],
      phoneNumber: json['phoneNumber'],
      email: json['email'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'token': token,
      'userId': userId,
      'username': username,
      'phoneNumber': phoneNumber,
      'email': email,
    };
  }
}
