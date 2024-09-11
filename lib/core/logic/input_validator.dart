class InputValidator {
  static String? phone(String? value) {
    if(value!.isEmpty){
      return "must be not empty";
    }
  }

  static String? password(String? value) {
    if(value!.isEmpty){
      return "must be not empty";
    }else if(value.length < 7){
      return "password must be at least 7";
    }
  }
}