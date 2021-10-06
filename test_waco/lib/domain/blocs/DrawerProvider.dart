import 'package:flutter/material.dart';

class DrawerProvider with ChangeNotifier {
  bool _open = false;
  bool get open => _open;

  set open(open) {
    this._open = open;
    notifyListeners();
  }

  toggleOpen(){
    this._open = !this._open;
    notifyListeners();
  }
}
