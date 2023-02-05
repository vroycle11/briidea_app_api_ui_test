


import 'package:briidea_app_api_ui_test/models/user.model.dart';
import 'package:briidea_app_api_ui_test/screens/1_message_and%20_group.dart';
import 'package:flutter/foundation.dart';

class GroupDataProvider with ChangeNotifier {
  User post = User();
  bool loading = false;

  getPostData(context) async {
    loading = true;
    post = await fetchUsers(context);
    loading = false;

    notifyListeners();
  }
}
