import 'package:flutter/material.dart';
import 'package:flutter_so_component/connection_client.dart';
import 'package:flutter_so_component/src/component/sign_up_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:so/so.dart';
import 'package:so_flutter/so_flutter.dart';

class LoginScreen extends DataScreen {
  final VoidCallback successAction;
  final VoidCallback failureAction;
  final Color? loginFormColor;
  final Color? loginScreenColor;
  final String? backgroundImagePath;
  final String host;
  final String database;

  LoginScreen(
      {
        required this.host,
        required this.database,
        required this.successAction,
        required this.failureAction,
        this.loginFormColor,
        this.loginScreenColor,
        this.backgroundImagePath
      });

  @override
  Scaffold build(BuildContext context) {
    Map<String, Screen> screenMap = {};

    /* Case 1 -> Screen size > 650 then have split screen with
    a picture on one side and a login form on the other

      Case 2 -> Screen size <= 650 then only display the login form
    */
    return Scaffold(body: LayoutBuilder(builder: (context, constraint) {
      if (constraint.maxWidth > 650) {
        Expanded leftComponent;
        if (backgroundImagePath != null) {
          leftComponent =
              Expanded(flex: 5, child: SvgPicture.asset(backgroundImagePath!));
        } else {
          leftComponent = const Expanded(flex: 5, child: Text('Welcome'));
        }

        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            leftComponent,
            Expanded(
              flex: 5,
              child: _fetchLoginForm(),
            )
          ],
        );
      } else {
        return _fetchLoginForm();
      }
    }));
  }

  Widget _fetchLoginForm() {
    Field<String> usernameField = getField('Username', false);
    Field<String> passwordField = getField('Password', true);
    Client client;

    return Material(
      color: loginFormColor ?? const Color.fromARGB(1000, 245, 245, 245),
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              usernameField,
              const SizedBox(height: 10),
              passwordField,
              const SizedBox(height: 10),
              ElevatedButton(
                  onPressed: () =>
                      {_login(usernameField.value!, passwordField.value!)},
                  child: const Text('Login')
              ),

              const SizedBox(height: 10),

              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () => App.goTo(SignUpScreen()),
                      child: const Text('Sign Up')
                  ),

                  const VerticalDivider(thickness: 10),

                  TextButton(
                      onPressed: ()=>{
                        client = ConnectionClient.createClient()
                      },
                      child: const Text('Forgot password')
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Field<String> getField(String label, bool obscureText) {
    return textField(
        decoration: InputDecoration(
            labelText: label,
            border:
                const OutlineInputBorder(borderSide: BorderSide(width: 10))),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        obscureText: obscureText,
        validator: (value) => value == null || value.isEmpty ? 'Please enter $label' : null
    );
  }

  void _login(String username, String password) async {
    if (isValid) {
      Client client = Client(host, database);
      String status = await client.login(username, password);
      if (status == '') {
        ConnectionClient(client: client);
        successAction.call();
      } else {
        App.alert("Unable to login.\nAlert from server : $status");
      }
    } else {
      App.message("Please enter username and password to login");
    }
  }
}
