
import '../validation/validations.dart';

class Users {
  final _data = <String, String> {};

  void add(String s1, String s2) {
    try {
      if (_data["ID-$s1"] == null) {
        _data["ID-$s1"] = s2;
      } else {
        Validations.usernameHasBeenUsed();
      }
    } on ValidationException catch (e) {
      print(e.message);
    }
  }

  Map<String, String?> getData(String s1) {
    var data = <String, String?> {};
    if (_data["ID-$s1"] != null) {
      data["ID-$s1"] = _data["ID-$s1"];
    }
    return data;
  }



}