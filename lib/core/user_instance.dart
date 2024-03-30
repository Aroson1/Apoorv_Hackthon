import 'dart:convert';

import 'package:localstorage/localstorage.dart';
import './backend_manager.dart';
import 'package:http/http.dart' as http;

class UsrInstance {
  // UID of the user
  String getuid() {
    final LocalStorage storage = LocalStorage('user');
    return storage.getItem('uid');
  }

  bool checkuid() {
    final LocalStorage storage = LocalStorage('user');
    return storage.getItem('uid') != null;
  }

  void setuid(String email) async {
    final LocalStorage storage = LocalStorage('user');

    // ...

    http.Response response = await BackendManager(uid: "None").Login(email);
    Map<String, dynamic> uid = jsonDecode(response.body);
    storage.setItem('uid', uid['uid'] as String);
  }

  void removeuid() {
    final LocalStorage storage = LocalStorage('user');
    storage.deleteItem('uid');
  }

  // Check if the user is logged in
  bool getLoggedIn() {
    final LocalStorage storage = LocalStorage('user');
    return storage.getItem('loggedIn') ?? false;
  }

  void setLoggedIn() {
    final LocalStorage storage = LocalStorage('user');
    storage.setItem('loggedIn', true);
  }

  void setLoggedOut() {
    final LocalStorage storage = LocalStorage('user');
    storage.setItem('loggedIn', false);
  }
}
