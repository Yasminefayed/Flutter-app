import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled3/dummy.dart';
import 'package:untitled3/firebase_auth_services.dart';
import 'package:untitled3/login&signup.dart';
import 'package:untitled3/login.dart';
import 'package:untitled3/toast.dart';

class  Register extends  StatefulWidget{


  @override
  State<Register> createState()=> Register2();

  TextEditingController _genderController = TextEditingController();
}

class Register2 extends State<Register>{
  final FirebaseAuthService _auth= FirebaseAuthService();
  CollectionReference users= FirebaseFirestore.instance.collection('users');
  late String name;



  TextEditingController _usernameController = TextEditingController();
  //TextEditingController _ageController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  //TextEditingController _genderController = TextEditingController();

  bool passToggle=true;
  //int _value=0;
  bool isSigningUp=false;

  @override

  void dispose(){
    _usernameController.dispose();
    // _ageController.dispose();
    //_genderController.dispose();
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
                child: Image.asset("images/logo1-modified.png",scale: 0.8),
              ),
              SizedBox(height:10),

              Padding(padding: EdgeInsets.symmetric(vertical: 8,horizontal: 15),
                  child: TextField( onChanged: (value){
                     name=value;
                  },
                    controller: _usernameController,
                    decoration: InputDecoration(
                        labelText: "Full Name",
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.person)
                    ),
                  ),
              ),
              //Padding(padding: EdgeInsets.symmetric(vertical: 8,horizontal: 15),
              //child: TextField(
              //controller: _ageController,
              //decoration: InputDecoration(
              //labelText: "Age",
              //border: OutlineInputBorder(),
              // prefixIcon: Icon(Icons.calendar_month,

              //),
              //)
              //),
              // ),

              //Padding(
              //padding: const EdgeInsets.only(left: 15),
              //child: Row(
              //children: [
              //Radio(
              //value: 1,
              //groupValue: _value,
              //onChanged: (value) {
              //setState(() {
              //_value = value!;
              //widget._genderController.text = 'Male'; // Update the controller value
              //});
              // },
              //),
              // GestureDetector(
              //onTap: () {
              // setState(() {
              // _value = 1;
              // widget._genderController.text = 'Male'; // Update the controller value
              // });
              // },
              //child: Row(
              //children: [
              //],
              //),
              // ),
              //SizedBox(width: 20),
              //Radio(
              //  value: 2,
              //groupValue: _value,
              // onChanged: (value) {
              // setState(() {
              //_value = value!;
              //widget._genderController.text = 'Female'; // Update the controller value
              //});
              //},
              //),
              //GestureDetector(
              //onTap: () {
              // setState(() {
              //  _value = 2;
              // widget._genderController.text = 'Female'; // Update the controller value
              // });
              // },
              // ),
              //]
              //),
              // ),

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
                  ),

              ),

              SizedBox(height: 60),
              Material(
                color: Color(0xffb11226),
                borderRadius:BorderRadius.circular(10),
                child: InkWell(
                  onTap: () async{
                    await users.add({
                      'name':name,

                    }).then((value) => print('addeduser'));
                    _signUp();
                    showToast(message: "User is successfully created");
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 15,horizontal: 80),
                    child: isSigningUp? CircularProgressIndicator(color: Colors.white,):
                    Text("Submit",style: TextStyle(
                      color:Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,

                    ),),
                  ),
                ),
              )

            ],
          ),
        ),
      ),

    );
  }
  void _signUp() async{

    setState(() {
      isSigningUp=true;
    });

    String username= _usernameController.text;
    String email=_emailController.text;
    String password=_passwordController.text;
    //String age= _ageController.text;
    //String gender=_genderController.text;

    User? user= await _auth.signUpWithEmailAndPassword(email, password);
    setState(() {
      isSigningUp=false;
    });

    if(user!=null){
      showToast(message: "User is succefully created");
      Navigator.push(context, MaterialPageRoute(builder: (context) => pagelogin()));
    } else{
      showToast(message: 'Some error happened');
    }
  }

}




