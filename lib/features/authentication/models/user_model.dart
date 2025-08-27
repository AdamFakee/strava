class SUserModel {
  final String id;
  final String username;
  final String email;

  SUserModel({required this.id, required this.username, required this.email});

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "email": email,
      "username": username
    };
  }
}