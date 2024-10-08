class User {
  final String phone;
  final String username;
  final String email;
  final String password;

  User({
    required this.phone,
    required this.username,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'phone': phone,
      'username': username,
      'email': email,
      'password': password,
    };
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      phone: json['phone'],
      username: json['username'],
      email: json['email'],
      password: json['password'],
    );
  }
}
