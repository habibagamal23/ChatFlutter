import 'package:chatflutter/main.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'Rooms/RoomsGatogery.dart';
class LoginScreen extends StatefulWidget {

  static final String RouteName = "Login";

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var _loginKey = GlobalKey<FormState>();
  String email = '';

  String password = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
              'https://i.pinimg.com/originals/fa/64/25/fa6425fe2c4d91672ce62ecb2c48abe3.jpg'),
          fit: BoxFit.cover,
        )

      ),
      child: Scaffold(
        backgroundColor:Colors.transparent,
        appBar: AppBar(
          titleSpacing: 30,
centerTitle: true,
         // actions: [
           // Padding(
             // padding: const EdgeInsets.all(8.0),
              //child: CircleAvatar(
                //backgroundImage: AssetImage('assets/images/icon.PNG'),
                //maxRadius: 50,
              //),
            //),
          //],
          toolbarHeight: 60,
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
              fontSize: 35,
              fontWeight: FontWeight.bold,
              color: myTheme.olive,
            ),
          ),
          backgroundColor: Colors.transparent,
        ),
        body: Center(
          child: Container(

            width: 350,
            height: 310,
            decoration: BoxDecoration(
              color: myTheme.babywhite,
              border: Border.all(
                color: myTheme.olive,
                width: 3,
              ),
              boxShadow: [
                BoxShadow(
                  color: myTheme.olive,
                  offset: const Offset(
                    5.0,
                    5.0,
                  ), //Offset
                  blurRadius: 10.0,
                  spreadRadius: 2.0,
                ), //BoxShadow
                BoxShadow(
                  color: Colors.white,
                  offset: const Offset(0.0, 0.0),
                  blurRadius: 0.0,
                  spreadRadius: 0.0,
                ), //BoxShadow
              ],
              borderRadius: BorderRadius.circular(25),
            ),
            padding: EdgeInsets.all(15),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                //Center Column contents vertically,

                crossAxisAlignment: CrossAxisAlignment.stretch,

                children: [
                  Form(
                    key: _loginKey,
                    child: Column(
                      children: <Widget>[

                        SizedBox(
                          height: 30.0,
                        ),
                        TextFormField(

                          onChanged: (txtvalu) {
                            email = txtvalu;
                          },
                          decoration: InputDecoration(
                            icon: Icon(
                              Icons.email_outlined,
                              color: myTheme.olive,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(20.0),
                            ),
                            labelText: 'Email',
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter Email';
                            }

                            return null;
                          },
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        TextFormField(
                          onChanged: (txtvalu) {
                            password = txtvalu;
                          },
                          obscureText: true,
                          decoration: InputDecoration(
                            icon: Icon(
                              Icons.lock_outline_rounded,
                              color: myTheme.olive,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(20.0),
                            ),
                            labelText: 'Password',
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter Password';
                            } else if (value.length < 6) {
                              return 'Please enter Password at least 6';
                            }

                            return null;
                          },
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 25.0,
                  ),

                  isloading
                      ? Center(
                    child: CircularProgressIndicator(),
                  )
                      : ElevatedButton(

                    style: ElevatedButton.styleFrom(primary: myTheme.olive

                    ),
                    onPressed: () => signin(),
                    child: Row(
                      children: [
                        Expanded(child: Text('  Start Chats  ',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: myTheme.babywhite,
                          ),
                        )),
                        Icon(Icons.arrow_forward)
                      ],
                    ),
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  void signin() {
    if (_loginKey.currentState!.validate() == true) {
      LoginUser();
    }
  }
  bool isloading = false;
  void LoginUser() async {
    try {
      setState(() {
        isloading = true;
      });
      UserCredential userCredential =
      await FirebaseAuth.instance.signInWithEmailAndPassword
        (email: email, password: password);
      Navigator.pushNamed(context,  RoomsGat.RouteName);
      showDilogmassege("succefuly data");


    } on FirebaseAuthException catch (e) {
      showDilogmassege(e.message ?? "Some thing wrong");
    } catch (e) {
      print(e);
    }
    setState(() {
      isloading = false;
    });
  }
  void showDilogmassege(String massge) {
    showDialog(
        context: context,
        builder: (buildercontext) {
          return AlertDialog(
            content: Text(massge),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Ok", style: TextStyle(
                color: myTheme.olive
              ),))
            ],
          );
        });
  }
}
