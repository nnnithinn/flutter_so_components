import 'package:flutter_so_component/src/component/home.dart';
import 'package:flutter_so_component/src/component/login_screen.dart';
import 'package:so_flutter/so_flutter.dart';

main() async {
  App app = App(debugMode: false);
  app.home = LoginScreen(
    host: 'emqim12.engravsystems.com',
    database: 'emqimtest',
    successAction: () {
      App.goTo(Home(screenMap: {}));
    },
    failureAction: () {
      App.message("Login Failed");
    },
    backgroundImagePath: 'assets/images/login_bg.svg'
  );
  app.run();
}