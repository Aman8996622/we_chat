class User {
  String? userName;
  String? profileImage;
  String? phoneNumber;
  String? password;
  int? isOnline;
  String? lastSeen;
  String? userStatus;
  User({
    this.userName,
    this.profileImage,
    this.phoneNumber,
    this.password,
    this.isOnline,
    this.lastSeen,
  });

  Map<String, dynamic> toJson() {
    return {
      "user_name": userName,
      "password": password,
      "phone_number": phoneNumber,
      "profile_image": profileImage,
      "status": userStatus,
      "isOnline": isOnline,
    };
  }
}
