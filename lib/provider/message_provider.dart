


import 'package:briidea_app_api_ui_test/models/user.model.dart';
import 'package:briidea_app_api_ui_test/screens/message_and_group/message_and%20_group.dart';
import 'package:flutter/foundation.dart';

class UserDataProvider with ChangeNotifier {
  User post = User();
  bool loading = false;
  bool selected = false;

  getUserData(context) async {
    loading = true;
    bool selected = false;
    post = await fetchUsers(context);
    loading = false;
    selected = true;

    notifyListeners();
  }
}
