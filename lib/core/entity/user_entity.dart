class UserEntity {
  String? userName;
  String? profileImage;
  String? password;

  String? phoneNumber;

  UserEntity({
    this.userName,
    this.profileImage,
    this.password,
    this.phoneNumber,
  });

  Map<String, dynamic> toJson() {
    var map = {
      "user": 1,
    };
    return map;
  }
}
