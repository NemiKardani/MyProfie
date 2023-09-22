class UserResponse {
  String? email;
  String? password;
  String? userName;
  String? userImagePath;
  List<String>? skills;
  String? workExpirience;
  String? education;
  String? dateOfBirth;
  List<Map<String, dynamic>>? competedProjects;
  String? gender;
  String? location;

  UserResponse({
    this.email,
    this.password,
    this.userName,
    this.userImagePath,
    this.skills,
    this.workExpirience,
    this.education,
    this.dateOfBirth,
    this.competedProjects,
    this.gender,
    this.location,
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) => UserResponse(
        email: json["email"],
        password: json["password"],
        userName: json["userName"],
        userImagePath: json["userImagePath"],
        skills: json["skills"].cast<String>(),
        workExpirience: json["workExpirience"],
        education: json["study"],
        dateOfBirth: json["dateOfBirth"],
        competedProjects: json["competedProjects"],
        gender: json["gender"],
        location: json["location"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
        "userName": userName,
        "userImagePath": userImagePath,
        "skills": skills,
        "workExpirience": workExpirience,
        "education": education,
        "dateOfBirth": dateOfBirth,
        "competedProjects": competedProjects,
        "gender": gender,
        "location": location,
      };
}
