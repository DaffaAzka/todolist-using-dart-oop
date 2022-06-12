
import 'users.dart';

class Backups {
  final _data = <String, List<String>> {};
  void add(String s1, List<String> list) => _data[s1] = list;

  Map<String, List<String>?> getData(String s1) {
    var data = <String, List<String>?> {};
    if (_data[s1] != null) {
      data[s1] = _data[s1];
    }
    return data;
  }
}