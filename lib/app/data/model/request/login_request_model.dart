class LoginRequestModel {
  final String? email;
  final String? password;

  LoginRequestModel({
    this.email,
    this.password,
  });

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
      };
  LoginRequestModel copyWith({
    String? email,
    String? password,
  }) {
    return LoginRequestModel(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}
