class Todos {
  var _data = <String> [];

  void add(String s1) => _data.add(s1);

  void remove(int i1) => _data.removeAt(i1 - 1);

  void removeAll() => _data = [];

  get data => _data;
}