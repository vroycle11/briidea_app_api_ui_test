





import 'package:briidea_app_api_ui_test/models/group.model.dart';
import 'package:briidea_app_api_ui_test/screens/1_message_and%20_group.dart';
import 'package:flutter/foundation.dart';

class PostDataProvider with ChangeNotifier {
  Group post = Group();
  bool loading = false;

  getPostData(context) async {
    loading = true;
    post = await fetchGroups(context);
    loading = false;

    notifyListeners();
  }
}
