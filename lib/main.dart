
import 'package:flutter_so_component/component/login_screen.dart';
import 'package:flutter_so_component/component/home_screen.dart';
import 'package:so/so.dart';
import 'package:so_flutter/so_flutter.dart';

main() async {
  App app = App(debugMode: false);
  app.home = LoginScreen(
    client: Client('emqim12.engravsystems.com', 'emqimtest'),
    successAction: () {
      App.goTo(HomeScreen());
    },
    failureAction: () {
      print("Login Failed");
    },
  );
  app.run();
}