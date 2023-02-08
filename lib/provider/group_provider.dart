





import 'package:briidea_app_api_ui_test/models/group.model.dart';
import 'package:briidea_app_api_ui_test/screens/message_and_group/message_and%20_group.dart';
import 'package:flutter/foundation.dart';

class GroupDataProvider with ChangeNotifier {
  Group group = Group();
  bool groupLoading = false;

  getGroupData(context) async {
    groupLoading = true;
    group = await fetchGroups(context);
    groupLoading = false;

    notifyListeners();
  }
}
