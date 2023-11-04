import 'package:flutter/material.dart';
import 'package:flutter_so_component/component/desktop_login_screen.dart';
import 'package:flutter_so_component/component/mobile_login_screen.dart';
import 'package:so/so.dart';
import 'package:so_flutter/so_flutter.dart';

class LoginScreen extends StatelessScreen {
  final Client client;
  final VoidCallback successAction;
  final VoidCallback failureAction;

  const LoginScreen({
      super.key,
      required this.client,
      required this.successAction,
      required this.failureAction
  });

  @override
  Scaffold build(BuildContext context) {
    return Scaffold(body: LayoutBuilder(builder: (context, constraint) {
      if (constraint.maxWidth > 650) {
        return DesktopLogin(
            client: client,
            successAction: successAction,
            failureAction: failureAction);
      } else {
        return MobileLoginScreen(
            client: client,
            successAction: successAction,
            failureAction: failureAction,
        );
      }
    }));
  }
}
