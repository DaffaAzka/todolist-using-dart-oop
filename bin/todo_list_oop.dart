
import 'data/backups.dart';
import 'services/restore_data.dart';
import 'services/todolist.dart';
import 'services/verification.dart';
import 'dart:io';

var vef = Verification();
var to = Todolist();
var restore = RestoreData();

void main() {

  showSignUp();

}

// Interface

void showSignUp() {

  print("=============================================================");
  print("SIGN UP");
  print("=============================================================");

  stdout.write("Id : ");
  String? id = stdin.readLineSync();

  stdout.write("Password : ");
  String? password = stdin.readLineSync();

  vef.signUp(id!, password!);

  showSignIn();

}

void showSignIn() {

  print("=============================================================");
  print("SIGN IN");
  print("=============================================================");

  stdout.write("Id : ");
  String? id = stdin.readLineSync();

  stdout.write("Password : ");
  String? password = stdin.readLineSync();

  var result = vef.signIn(id!, password!);

  if(result) {
    print("Welcome $id!");
    showHomepage();
  } else {
    print("Failed to login...");
    showSignUp();
  }

}

void showHomepage() {

  while(true) {
    print("=============================================================");
    print("HOMEPAGE");
    print("=============================================================");

    to.seeTodos(restore.restore());

    print("=============================================================");

    print("c. Create Todo");
    print("d. Delete Todo");
    print("x. Sign Out");

    print("=============================================================");

    stdout.write("Option : ");
    String option = stdin.readLineSync()!;

    switch(option) {
      case "c" :
        showCreate();
        break;
      case "d" :
        showRemove();
        break;
      case "x" :
        restore.backup(to.todos.data);
        to.reset();
        vef.signOut();
        showSignUp();
        break;
    }
  }

}

void showCreate() {
  print("=============================================================");
  print("CREATE TODO");
  print("=============================================================");
  stdout.write("Todo : ");
  String todo = stdin.readLineSync()!;
  to.create(todo);
  showHomepage();
}

void showRemove() {
  print("=============================================================");
  print("REMOVE TODO");
  print("=============================================================");
  stdout.write("ID : ");
  int id = int.parse(stdin.readLineSync()!);
  to.remove(id);
  showHomepage();
}
