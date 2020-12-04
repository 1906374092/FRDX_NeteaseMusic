class Validator {
  static bool checkPhone(String phone) {
    RegExp rule = RegExp(r"^[1][3,4,5,6,7,8,9][0-9]{9}$");
    return rule.hasMatch(phone);
  }

  static checkPassword(String password) {
    RegExp regnum = RegExp(r"\d+");
    RegExp regStr = RegExp(r"[a-zA-Z]+");
    return regnum.hasMatch(password) &&
        regStr.hasMatch(password) &&
        password.length >= 8 &&
        password.length <= 20;
  }
}
