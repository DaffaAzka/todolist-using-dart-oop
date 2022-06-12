
import '../data/users.dart';
import '../validation/validations.dart';

class Verification  {

  static String myID = "";
  static Users users = Users();

  bool signUp(String username, String password) {
    try {
      Validations.usernameAndPasswordIsEmpty(username, password);
      users.add(username, password);
      return true;
    } on ValidationException catch(e) {
      print(e.message);
      return false;
    }
  }

  bool signIn(String username, String password) {
    try {
      Validations.usernameAndPasswordIsEmpty(username, password);
      var data = users.getData(username);
      if (data["ID-$username"] == password) {
        myID = "ID-$username";
        return true;
      }
      return false;
    } on ValidationException catch(e) {
      print(e.message);
      return false;
    }

  }

  void signOut() {
    myID = "";
  }

}