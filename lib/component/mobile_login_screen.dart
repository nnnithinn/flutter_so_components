import 'package:flutter/material.dart';
import 'package:flutter_so_component/component/login_form.dart';
import 'package:so/so.dart';
import 'package:so_flutter/so_flutter.dart';

class MobileLoginScreen extends StatelessScreen {
  final Client client;
  final VoidCallback successAction;
  final VoidCallback failureAction;
  const MobileLoginScreen({
    super.key,
    required this.client,
    required this.successAction,
    required this.failureAction
  });

  @override
  Scaffold build(BuildContext context) {
    return Scaffold(
      body: LoginForm(
          client: client,
          logicSuccessAction: successAction,
          loginFailedAction:  failureAction
      ),
    );
  }
}
