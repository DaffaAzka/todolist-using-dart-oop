
import '../data/backups.dart';
import '../data/users.dart';
import '../validation/validations.dart';
import 'verification.dart';

class RestoreData {

  var id = Verification.myID;
  var backups = Backups();

  void backup(List<String> data) {
    try {
      Validations.backupIsEmpty(data);
      backups.add(id, data);
      data = <String>[];
      id = "";
    } on ValidationException catch(e) {
      print(e.message);
    }
  }

  List<String> restore() {
    id = Verification.myID;
    var data = backups.getData(id);
    if (data[id] == null) {
      try {
        Validations.backupNotFound();
      } on ValidationException catch(e) {
        print(e.message);
      }
      return <String>[];
    }
    return data[id] as List<String>;
  }

}