import 'package:flutter/material.dart';
import 'package:chatflutter/main.dart';
class RoomsGat extends StatelessWidget {
  const RoomsGat({Key? key}) : super(key: key);
  static final String RouteName = "Rooms";
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/icon/chs.PNG'),
              maxRadius: 50,
            ),
          ),
        ],
        toolbarHeight: 120,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            )),
        elevation: 0,
        // centerTitle: true,
        title: Text(
          "Login Screen",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: myTheme.babywhite,
          ),
        ),
        backgroundColor: myTheme.babywhite,
      ),

    );
  }
}
