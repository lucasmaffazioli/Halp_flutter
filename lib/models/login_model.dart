import 'package:flutter/foundation.dart';

class LoginModel extends ChangeNotifier {
  String _user = 'loggedTestTemp';

  void setLoggedUser(String newUser) {
    _user = newUser;
    notifyListeners();
  }

  String getCurrentUser() {
    return _user;
  }

  // Future<bool> login(String userIdText) async {
  //   setState(ViewState.Busy);
  //   var userId = int.tryParse(userIdText);
  //   var success = await _authenticationService.login(userId);
  //   setState(ViewState.Idle);
  //   return success;
  // }
}
