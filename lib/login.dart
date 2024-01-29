import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:untitled3/dummy.dart';
import 'package:untitled3/Registerpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:untitled3/navbar_roots.dart';
import 'package:untitled3/toast.dart';

import 'firebase_auth_services.dart';


class  pagelogin extends  StatefulWidget{
  @override
  State<pagelogin> createState()=> pagelog();
}

class pagelog extends State<pagelogin>{

  final FirebaseAuthService _auth= FirebaseAuthService();
  final FirebaseAuth _firebaseAuth=FirebaseAuth.instance;

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  bool passToggle=true;
  //int _value=0;
  bool isSigning=false;

  @override

  void dispose(){

    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();

  }
  Widget build (BuildContext context){
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(height: 10),
              Padding(padding: EdgeInsets.all(20),
                child: Image.asset("images/logo1-modified.png"),


              ),
              SizedBox(height:10),

              Padding(padding: EdgeInsets.symmetric(vertical: 8,horizontal: 15),
                  child: TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: "Email",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.email),

                    ),
                  )
              ),
              Padding(padding: EdgeInsets.symmetric(vertical: 8,horizontal: 15),
                  child: TextField(
                    controller: _passwordController,
                    obscureText: passToggle ? true : false,
                    decoration: InputDecoration(
                      labelText: "Your Password",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.person),
                      suffixIcon: InkWell(onTap: (){
                        if(passToggle== true){
                          passToggle= false;
                        }
                        else{
                          passToggle= true;
                        }
                        setState(() {});
                      },
                        child: passToggle ? Icon(CupertinoIcons.eye_slash_fill) : Icon(CupertinoIcons.eye_fill),
                      ),

                    ),
                  )
              ),

              SizedBox(height: 40),
              Material(
                color: Color(0xffb11226),
                borderRadius:BorderRadius.circular(10),
                child: InkWell(
                  onTap: _signIn,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 15,horizontal: 80),
                    child: isSigning? CircularProgressIndicator(color: Colors.white,):
                    Text("Login",style: TextStyle(
                      color:Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,

                    ),),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Material(
                color: Colors.amberAccent,
                borderRadius:BorderRadius.circular(50),
                child: InkWell(
                  onTap: (){
                    _signInWithGoogle();
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 15,horizontal: 50),
                    child:
                    Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(FontAwesomeIcons.google,color: Colors.white,),
                        SizedBox(width: 5,),
                        Text("Sign In with Google",style: TextStyle(
                          color:Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,

                        ),),
                      ],
                    ),
                  ),
                ),
              ),

             SizedBox(height: 20,),
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Dont Have An Account?'),
                  SizedBox(width: 5,),
                  GestureDetector(
                    onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => NavBarRoots()));
                    },
                    child: Text("Signup", style: TextStyle(
                      color: Colors.red,fontWeight: FontWeight.bold
                    ),),
                  )
                ],
              )
            ],
          ),
        ),
      ),

    );
  }
  void _signIn() async{
    setState(() {
      isSigning=true;
    });

    String email=_emailController.text;
    String password=_passwordController.text;


    User? user= await _auth.signInWithEmailAndPassword(email, password);
    setState(() {
      isSigning=false;
    });
    if(user!=null){
      showToast(message: "User is succefully signed in");
      Navigator.push(context, MaterialPageRoute(builder: (context) => NavBarRoots()));
    } else{
      showToast(message: "Some error occured");
    }
  }

  _signInWithGoogle() async{
    final GoogleSignIn _googleSignIn= GoogleSignIn();

    try{
      final GoogleSignInAccount? googleSignInAccount =await _googleSignIn.signIn();

      if(googleSignInAccount != null){
        final GoogleSignInAuthentication googleSignInAuthentication= await
            googleSignInAccount.authentication;

        final AuthCredential credential= GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken,
        );
        await _firebaseAuth.signInWithCredential(credential);
        Navigator.push(context, MaterialPageRoute(builder: (context) => dummy()));
      }


    }catch (e){
      showToast(message: "some error occured $e");
    }

  }
}