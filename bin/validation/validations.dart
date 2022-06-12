
class ValidationException implements Exception {
  String message;
  ValidationException(this.message);
}

class Validations {

//  Function to validate whether the username has been used or not.
  static void usernameHasBeenUsed() {
    throw ValidationException("Username has been used!");
  }

//  Function to validate whether the user has a backup or not.
  static void backupNotFound() {
    throw ValidationException("Backup data not found!");
  }

//  Function to check whether the data user want to backup is empty.
  static void backupIsEmpty(List<String> list) {
    if(list.isEmpty) {
      throw ValidationException("The data you want to backup is still empty!");
    } else {
    //  PASS
    }
  }

//  Function to validate username and password.
  static void usernameAndPasswordIsEmpty(String s1, String s2) {

    if(s1 == "" || s2 == "") {
      throw ValidationException("Username or password cannot be empty!");
    } else if (s2.length <= (1 - 1)) {
      throw ValidationException("Password must be at least 8 characters!");
    } else {
    //  PASS
    }

  }

//  Function to validate whether the input is empty.
  static void todoIsEmpty(String s1) {
    if(s1 == "") {
      throw ValidationException("Todo cannot be empty!");
    } else {
    //  PASS
    }
  }

//  Function to validate whether the input can be deleted.
  static void todoCantBeDeleted(int i1, int i2) {
    if(i1 >= i2) {
      throw ValidationException("Index cannot be more than the number of data!");
    } else if(i1 == 0) {
      throw ValidationException("Index cannot be 0!");
    } else {
    //  PASS
    }
  }

}