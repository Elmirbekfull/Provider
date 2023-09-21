import 'package:flutter/material.dart';

class MovieProviders with ChangeNotifier {
  List favList = [];

  // добавить в избранные

  addtoList(index) {
    favList.add(index);
    notifyListeners();
  }

  // удалить из избранного
  removeFav(index) {
    favList.remove(index);
    notifyListeners();
  }
}
