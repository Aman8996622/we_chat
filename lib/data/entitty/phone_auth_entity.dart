class PhoneAuthEntity {
  int? phoneNumber;

  PhoneAuthEntity({
    this.phoneNumber,
  });
}

sealed class Man {
  String name;

  String lo;

  Man({
    required this.name,
    required this.lo,
  });
}
