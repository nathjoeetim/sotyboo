import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';

import '../../modules/authentication/network_service.dart';
import '../../unils/utils.dart';

class NotificationProvider extends ChangeNotifier{

  Future<void> setupToken(String? authToken) async {
    // Get the token each time the application loads
    String? token = await FirebaseMessaging.instance.getToken();

    // Save the initial token to the database
    await _saveTokenToDatabase(token!, authToken);

    // Any time the token refreshes, store this in the database too.
    FirebaseMessaging.instance.onTokenRefresh.listen((deviceId){
      _saveTokenToDatabase(deviceId, authToken);
    });
  }

}

Future<void> _saveTokenToDatabase(String deviceId, String? authToken) async {

  // call the end point to save the token
  var authenticationService = AuthenticationService();

  // try to log the user
  var response = await authenticationService.saveDeviceToken(deviceId, authToken);

  if (response.isError) {
    // handle error
    showSportbooSnackBar(response.message, (id) => () {});
    return;
  }

  // handle success
  showSportbooSnackBar(response.message, (id) => () {});
  return;

}
