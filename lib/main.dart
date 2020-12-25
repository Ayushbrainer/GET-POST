import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
// import 'package:path_provider/path_provider.dart';
import 'package:silent_hill_intern/UI/Reading_posts.dart';
import 'package:silent_hill_intern/UI/Write%20Post.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // Directory directory = await getApplicationDocumentsDirectory();
  // Hive.init(directory.path);
  // await Hive.openBox<Post>("posts");
  runApp(MaterialApp(
    home: main_page(),
  ));
}

class main_page extends StatefulWidget {
  @override
  _main_pageState createState() => _main_pageState();
}

class _main_pageState extends State<main_page> {
  Color bakgroundColor = Colors.deepPurple;
  int _currentIndex = 0;
  bool page = true;
  String appTitle = "Read Posts Written By Everyone";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          title: Center(
              child: Text(
            appTitle,
            textAlign: TextAlign.center,
          )),
          backgroundColor: bakgroundColor,
        ),
        body: (page)
            ? Center(child: reading_posts())
            : Center(child: writePost()),
        bottomNavigationBar: BottomNavigationBar(
          elevation: 0.0,
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.shifting,
          items: [
            BottomNavigationBarItem(
                icon: Icon(MdiIcons.book),
                title: Text(""),
                backgroundColor: Colors.deepPurple),
            BottomNavigationBarItem(
                icon: Icon(MdiIcons.typewriter),
                title: Text(""),
                backgroundColor: Colors.redAccent)
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
              if (_currentIndex == 0) {
                appTitle = "Read Posts Written By Everyone";
                page = true;
                bakgroundColor = Colors.deepPurple;
              } else {
                appTitle = "Write Posts So Others Can Read Them";
                page = false;
                bakgroundColor = Colors.redAccent;
              }
            });
          },
        ));
  }
}
