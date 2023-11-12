import 'package:flutter_so_component/component/login_screen.dart';
import 'package:flutter_so_component/component/home_screen.dart';
import 'package:so_flutter/so_flutter.dart';

main() async {
  App app = App(debugMode: false);
  app.home = LoginScreen(
    successAction: () {
      App.goTo(HomeScreen());
    },
    failureAction: () {
      App.message("Login Failed");
    },
    backgroundImagePath: 'assets/images/login_bg.svg'
  );
  app.run();
}