import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:so_flutter/so_flutter.dart';

class Home extends StatefulScreen {
  late final String? title;
  final Map<String, Screen> screenMap;

  Home({this.title, required this.screenMap});

  @override
  Scaffold build(BuildContext context) {
    String label = '';
    if(title != null) {
      label = title!;
    }
    return Scaffold(
      appBar: AppBar(title: Text(label)),
      drawer: ListView(
          children: _fetchMenus(),
      ),
    );
  }

  List<Widget> _fetchMenus() {
    List<Widget> navigations = [];
    DrawerHeader header = const DrawerHeader(
      child: Text(
        "Stored Object",
        style: TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
    navigations.add(header);
    screenMap.forEach((key, value) {
      navigations.add(
          ListTile(
            title: Text(key),
            onTap: App.goTo(value),
          ));
    });
    return navigations;
  }
}