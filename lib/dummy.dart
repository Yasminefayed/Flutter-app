/*import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled3/login&signup.dart';
import 'package:untitled3/login.dart';
import 'package:untitled3/toast.dart';



class dummy extends StatefulWidget{
  @override
  State<dummy> createState()=> dum();
}

class dum extends State<dummy>{
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

           child:Padding(
             padding: const EdgeInsets.only(top: 40),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Padding(padding: const EdgeInsets.symmetric(horizontal: 8),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                 child: Text('Login',style: TextStyle(
                   color: Colors.white,
                   fontSize: 22,
                   fontWeight: FontWeight.bold,
                 ),),

               ),
             ),
           ),


                     ],
                   ),
                 ),

               ],
             ),
           )
         ),

         ),
       );


  }

}*/
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled3/ADHD.dart';
import 'package:untitled3/PTSD.dart';
import 'package:untitled3/anxietyquiz.dart';
import 'package:untitled3/bipolar.dart';
import 'package:untitled3/depression.dart';
import 'package:untitled3/eating.dart';
import 'package:untitled3/idk.dart';
import 'package:untitled3/navbar_roots.dart';
import 'package:untitled3/schizoph.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dashboard',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
    );
  }
}

class dummy extends StatefulWidget {
  const dummy({super.key});

  @override
  State<dummy> createState() => dum();
}

class dum extends State<dummy> {
 // late String name='';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Color(0xffffbf00),
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(50),
              ),
            ),
            child: Column(
              children: [
                const SizedBox(height: 50),
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 30),
                  title: Text('Welcome to Helpie', style: Theme
                      .of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(
                      color: Color(0xffb11226),
                    fontSize: 45,
                  )),
                  subtitle: Text('Choose Your Disorder', style: Theme
                      .of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(
                      color: Color(0xffb11226),
                    fontSize: 20,
                  )),

                ),
                const SizedBox(height: 30)
              ],
            ),
          ),
          Container(
            color: Color(0xffffbf00),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(90)
                  )
              ),
              child: GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 40,
                mainAxisSpacing: 30,
                children: [
                  itemDashboard(
                      'Anxiety', CupertinoIcons.bandage_fill, Colors.deepOrange,
                      context, QuizPage()),
                  itemDashboard(
                      'Depression', CupertinoIcons.bandage_fill, Colors.green,
                      context, depquiz()),
                  itemDashboard(
                      'PTSD', CupertinoIcons.bandage_fill, Colors.purple,
                      context, ptsd()),
                  itemDashboard(
                      'Bipolar', CupertinoIcons.bandage_fill, Colors.brown,
                      context, bipolar1()),
                  itemDashboard('Schizophrenia', CupertinoIcons.bandage_fill,
                      Colors.indigo, context, schz()),
                  itemDashboard(
                      'ADHD', CupertinoIcons.bandage_fill, Colors.teal, context,
                      adhd()),
                  itemDashboard('Eating Disorder', CupertinoIcons.bandage_fill,
                      Colors.yellowAccent, context, eats()),
                  itemDashboard('I Dont Know', CupertinoIcons.question_square,
                      Colors.pinkAccent, context, idk1()),

                ],


              ),

            ),

          ),

          const SizedBox(height: 20)

        ],
      ),
    );
  }

  Widget itemDashboard(String title, IconData iconData, Color background,
      BuildContext context, Widget nextPage) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => nextPage),
        );
      },

      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                offset: const Offset(0, 5),
                color: Theme
                    .of(context)
                    .primaryColor
                    .withOpacity(.2),
                spreadRadius: 2,
                blurRadius: 5
            )
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: background,
                  shape: BoxShape.circle,
                ),
                child: Icon(iconData, color: Colors.white)
            ),
            const SizedBox(height: 8),
            Text(title.toUpperCase(), style: Theme
                .of(context)
                .textTheme
                .titleMedium)
          ],

        ),
      ),);
  }
 /* Future<void> fetchUserData() async {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      try {
        DocumentSnapshot documentSnapshot =
        await FirebaseFirestore.instance.collection('users').doc(user.uid).get();

        if (documentSnapshot.exists) {
          // Access fields in the document
          String username = documentSnapshot['name'];


          // Do something with the data, e.g., store it in a variable
          name = username;

          // Print or use the data as needed
          print('Username: $name');
        } else {
          print('User document does not exist in Firestore.');
        }
      } catch (e) {
        print('Error fetching user data: $e');
      }
    } else {
      print('User not authenticated.');
    }
  }*/


}

