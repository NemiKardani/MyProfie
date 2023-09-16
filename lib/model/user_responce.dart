class UserResponse {
  String? email;
  String? password;
  String? userName;
  String? userImagePath;
  List<String>? skills;
  String? workExpirience;

  UserResponse({
    this.email,
    this.password,
    this.userName,
    this.userImagePath,
    this.skills,
    this.workExpirience,
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) => UserResponse(
        email: json["email"],
        password: json["password"],
        userName: json["userName"],
        userImagePath: json["userImagePath"],
        skills: json["skills"].cast<String>(),
        workExpirience: json["workExpirience"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
        "userName": userName,
        "userImagePath": userImagePath,
        "skills": skills,
        "workExpirience": workExpirience,
      };
}
