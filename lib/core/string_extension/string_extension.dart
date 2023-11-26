extension FileName on String {
  String  get fileName {
   return  this.split('/').last;

  }
}
