import 'package:flutter/cupertino.dart';

class MainProvider with ChangeNotifier {
  var _selectedNavId = 0;
  var _title = '';

  int get selectedNavId {
    return _selectedNavId;
  }

  String get title {
    return _title;
  }

  void setSelectedNavId(int id) {
    _selectedNavId = id;
    notifyListeners();
  }

  void setTitle(String title) {
    _title = title;
    notifyListeners();
  }
}
