class DataResults<Type> {
  Type? data;
  String? errorMessage;
  int? status;

  DataResults({
    this.data,
    this.errorMessage,
    this.status,
  });
}