import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RisisterScreen extends StatefulWidget {
 static final String RouteName= "Risister";

  @override
  _RisisterScreenState createState() => _RisisterScreenState();
}

class _RisisterScreenState extends State<RisisterScreen> {
  var _Rigisterkey=GlobalKey<FormState>();

  String username ='';

 String email ='';

 String password='';

  @override
  Widget build(BuildContext context) {
    return Stack(

      children: [
        Container(
decoration: BoxDecoration(
  color:  Colors.white
),

            child: Image(
                image: AssetImage('assets/images/chaw.png'),
              fit: BoxFit.fill,

              height: 250,width: 700,)

        ),

        Scaffold(
backgroundColor: Colors.transparent,
          appBar: AppBar(
elevation: 0,
            centerTitle: true,
            title: Text("Rigister Screen",style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color:  Colors.white

            ),),
            backgroundColor: Colors.transparent,

          ),
body: Container(
color: Color.fromRGBO(135, 208, 246, 0.8823529411764706),
padding: EdgeInsets.all(12),
  child:   Column(
    mainAxisAlignment: MainAxisAlignment.center, //Center Column contents vertically,

    crossAxisAlignment : CrossAxisAlignment.stretch,
    children: [
      Form(

        key: _Rigisterkey,

        child: Column(


          children: <Widget>[


            TextFormField(
              onChanged:(txtvalu) {
                username=txtvalu;
              },

              obscureText: true,

      decoration:InputDecoration(

        border: OutlineInputBorder(),

        labelText: 'UserName',

      ),

              validator: (value) {

                if (value == null || value.isEmpty) {

                  return 'Please enter Username';

                }

                return null;

              },

            ),

            TextFormField(
              onChanged:(txtvalu) {
               email=txtvalu;
              },





              obscureText: true,

              decoration:InputDecoration(

                border: OutlineInputBorder(),

                labelText: 'Email',

              ),

              validator: (value) {

                if (value == null || value.isEmpty) {

                  return 'Please enter Email';

                }

                return null;

              },

            ),

            TextFormField(

              onChanged:(txtvalu) {
                password=txtvalu;
              },

              obscureText: true,

              decoration:InputDecoration(

                border: OutlineInputBorder(),

                labelText: 'Password',

              ),

              validator: (value) {

                if (value == null || value.isEmpty) {

                  return 'Please enter Password';

                } else if (value.length <6){
    return 'Please enter Password at least 6';

    }

                return null;

              },

            ),


          ],

        ),

      ),



     isloading?Center(child: CircularProgressIndicator(),)
         : ElevatedButton(

        style: ElevatedButton.styleFrom(

            primary: Color.fromRGBO(104, 191, 238, 1.0)





        ),

        onPressed: () =>creatacont()

        ,

        child: Row(

          children: [

            Text('Create Acount'),

            Icon( Icons.arrow_forward)

          ],

        ),

      ),




    ],
  ),
),
        ),
      ],
    );
  }

  void creatacont(){
    if (_Rigisterkey.currentState!.validate()==true) {
      RigisterUser ();
  }

}
bool isloading=false;
 void RigisterUser ()async{
  try {
    setState(() {
      isloading= true;
    });
    UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email:email,
        password: password

    );
    showDilogmassege("succefuly data");
  } on FirebaseAuthException catch (e) {
    showDilogmassege(e.message??"Some thing wrong");
  } catch (e) {
    print(e);
  }
setState(() {
  isloading= false;
});
}

 void  showDilogmassege(String massge){
    showDialog(context: context, builder: (buildercontext){
return AlertDialog(
    content:  Text(massge),
  actions: [
    TextButton(onPressed: (){
Navigator.pop(context);
    }, child: Text("Ok"))


  ],

);


  });

 }
}