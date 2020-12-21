import 'package:crud/data/dammy_user.dart';
import 'package:crud/models/user.dart';
import 'package:flutter/material.dart';

class UsersProvider with ChangeNotifier {
  final Map<String, User> _items = {...DUMMY_USERS};

  List<User> get all {
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }

  User byIndex(int index) {
    return _items.values.elementAt(index);
  }
}
