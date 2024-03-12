import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:sportboo_mobile_client/unils/utils.dart';

import '../../../components/base_viewmodel.dart';
import '../../../core/home/home_page.dart';
import '../../../core/home/sportboo_user_provider.dart';
import '../../../models/network_response.dart';
import '../../../models/sportboo_user/sportboo_user.dart';
import '../network_service.dart';

class LoginViewModel extends BaseViewModel {
  final AuthenticationService _authenticationService = AuthenticationService();

  final BuildContext context;

  LoginViewModel(this.context);

  bool _showHidePassword = false;

  bool get showHidePassword => _showHidePassword;

  final form = FormGroup(
    {
      'email': FormControl<String>(
          validators: [Validators.required, Validators.email]),
      'password': FormControl<String>(validators: [
        Validators.required,
        Validators.minLength(8),
        Validators.maxLength(20)
      ]),
    },
  );

  Future<void> onLoginUser() async {
    if (form.valid) {
      // show progressbar
      showSportbooLoader();

      // try to log the user
      var response = await _authenticationService.loginWithEmail(
          email: form.control('email').value,
          password: form.control('password').value);

      if (response.isError) {
        // handle error
        showSportbooSnackBar(response.message, (id) => () {});
        // stop loading bar
        closeSportbooLoader();
        return;
      }

      // stop loading bar
      closeSportbooLoader();

      // update and navigate
      updateAndNavigate(response);


    } else {
      form.markAllAsTouched();
    }

    return;
  }

  void toggleShowHidePassword() {
    _showHidePassword = !_showHidePassword;
    notifyListeners();
  }

  void updateAndNavigate(NetworkResponse response) {
    // try to log the user in (ie navigate to home view)
    Provider.of<SportbooUserProvider>(context, listen: false).sportbooUser =
        response.data;

    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => const HomePage()),
          (Route<dynamic> route) =>
      false, // This prevents any previous routes from being kept
    );
  }

}
