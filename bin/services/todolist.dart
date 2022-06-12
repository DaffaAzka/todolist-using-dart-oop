
import '../data/backups.dart';
import '../data/todos.dart';
import '../validation/validations.dart';
import 'restore_data.dart';

class Todolist {
  var todos = Todos();


  void create(String s1) {
    try {
      Validations.todoIsEmpty(s1);
      todos.add(s1);
      print(todos.data);
    } on ValidationException catch(e) {
      print(e.message);
    }
  }

  void remove(int i1) {
    int lengthAllData = todos.data.length;
    try {
      Validations.todoCantBeDeleted(i1, lengthAllData);
      todos.remove(i1);
    } on ValidationException catch(e) {
      print(e.message);
    }
  }

  void seeTodos(List<String> restore) {
    for(var rest in restore) {
      todos.add(rest);
    }

    if(todos.data.isNotEmpty) {
      for(var i = 0; i < todos.data.length; i++) {
        print("${i + 1}. ${todos.data[i]}");
      }
    }
  }

  void reset() {
    todos.removeAll();
  }
}