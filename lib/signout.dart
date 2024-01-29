import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled3/login&signup.dart';
import 'package:untitled3/login.dart';
import 'package:untitled3/toast.dart';



class signout extends StatefulWidget{
  @override
  State<signout> createState()=> signo();
}

class signo extends State<signout>{
  @override
  Widget build(BuildContext context) {
     return Scaffold(
       body: Center(
         child: GestureDetector(
           onTap: (){
             FirebaseAuth.instance.signOut();
             Navigator.push(context, MaterialPageRoute(builder: (context) => pagelogin()));
             showToast(message: 'Successfully signed out');
           },
           child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [

           Padding(padding: const EdgeInsets.only(top: 400),

           child: Row(
               mainAxisAlignment: MainAxisAlignment.center,

               children: [
               Material(
               color: Color(0xffb11226),
           borderRadius:BorderRadius.circular(10),
           child: InkWell(
             onTap: (){
               Navigator.push(context, MaterialPageRoute(
                   builder: (context) => pagelogin()
               ));
             },

             child: Padding(padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
               child: Text('Sign Out',style: TextStyle(
                 color: Colors.white,
                 fontSize: 22,
                 fontWeight: FontWeight.bold,
               ),),

             ),
           ),

         ),


         ],),
    ),
       ],

        ),),)
    );


  }

}