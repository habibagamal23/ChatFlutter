import 'package:chatflutter/main.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';

class RisisterScreen extends StatefulWidget {
  static final String RouteName = "Risister";

  @override
  _RisisterScreenState createState() => _RisisterScreenState();
}

class _RisisterScreenState extends State<RisisterScreen> {
  var _Rigisterkey = GlobalKey<FormState>();

  String username = '';

  String email = '';

  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myTheme.babywhite,
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/images/icon.PNG'),
              maxRadius: 40,
            ),
          ),
        ],
        toolbarHeight: 120,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        )),
        elevation: 3,
        centerTitle: true,
        title: Text(
          "Rigister Screen",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: myTheme.babywhite,
          ),
        ),
        backgroundColor: myTheme.olive,
      ),
      body: Center(
        child: Container(

          width: 420,
          height: 350,
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
                  key: _Rigisterkey,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        onChanged: (txtvalu) {
                          username = txtvalu;
                        },
                        decoration: InputDecoration(
                          icon: Icon(
                            Icons.account_circle_outlined,
                            color: myTheme.olive,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(20.0),
                          ),
                          labelText: 'UserName',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Username';
                          }

                          return null;
                        },
                      ),
                      SizedBox(
                        height: 20.0,
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
                        height: 20.0,
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
                        height: 15.0,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),

                isloading
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : ElevatedButton(

                        style: ElevatedButton.styleFrom(primary: myTheme.olive
                        
                        ),
                        onPressed: () => creatacont(),
                        child: Row(
                          children: [
                            Expanded(child: Text('Create Acount')),
                            Icon(Icons.arrow_forward)
                          ],
                        ),
                      ),

              ],
            ),
          ),
        ),
      ),
    );
  }

  void creatacont() {
    if (_Rigisterkey.currentState!.validate() == true) {
      RigisterUser();
    }
  }

  bool isloading = false;

  void RigisterUser() async {
    try {
      setState(() {
        isloading = true;
      });
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
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
                  child: Text("Ok"))
            ],
          );
        });
  }
}
