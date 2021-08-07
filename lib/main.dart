import 'package:chatflutter/Rooms/RoomsGatogery.dart';
import 'package:flutter/material.dart';

import 'LoginScree.dart';
import 'Rigister_screen.dart';
import 'package:firebase_core/firebase_core.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}
class myTheme{
  static var olive = Color.fromRGBO(102, 204, 0, 1.0);
  static var babywhite =Color.fromRGBO(250, 248, 244, 1.0);

}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   return MaterialApp(
     debugShowCheckedModeBanner: false,
     routes:{
       RisisterScreen.RouteName : (context)=> RisisterScreen(),
       LoginScreen.RouteName:(context)=>LoginScreen(),
       RoomsGat.RouteName : (context)=>RoomsGat()
     } ,
     initialRoute:  LoginScreen.RouteName ,
   );
  }

}
