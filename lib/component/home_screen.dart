import 'package:flutter/material.dart';
import 'package:flutter_so_component/connection_client.dart';
import 'package:so_flutter/so_flutter.dart';

class HomeScreen extends StatefulScreen {
  @override
  Scaffold build(BuildContext context) {
    if(ConnectionClient.get().client == null) {
      print("Client is null");
    } else {
      print(ConnectionClient.get().client!.username);
    }
    return const Scaffold(
      body: Placeholder(),
    );
  }
}