import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_so_component/component/login_form.dart';
import 'package:so/so.dart';

class DesktopLogin extends StatelessWidget {
  final Client client;
  final VoidCallback successAction;
  final VoidCallback failureAction;
  final String? backgroundImagePath;

  const DesktopLogin({
    super.key,
    required this.client,
    required this.successAction,
    required this.failureAction,
    this.backgroundImagePath
  });

  @override
  Widget build(BuildContext context) {
    Expanded leftComponent;
    if(backgroundImagePath != null) {
      leftComponent = Expanded(
          flex: 5, child: SvgPicture.asset(backgroundImagePath!));
    } else {
      leftComponent = const Expanded(flex: 5, child: Text('Welcome'));
    }
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          leftComponent,
          Expanded(
            flex: 5,
            child: LoginForm(
              client: client,
              logicSuccessAction: successAction,
              loginFailedAction: failureAction,
              //client: client,
            ),
          )
        ],
      ),
    );
  }
}
