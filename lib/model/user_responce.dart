class UserResponse {
  String? email;
  String? password;

  UserResponse({
    this.email,
    this.password,
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) => UserResponse(
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
      };
}
