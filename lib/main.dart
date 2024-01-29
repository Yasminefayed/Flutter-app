import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:untitled3/First_screen.dart';
import 'package:untitled3/Welcome_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';



import 'Welcome_page.dart';


void main() async  {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp( MyApp()
  );
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false ,
      theme:ThemeData(
        scaffoldBackgroundColor:Colors.white,

      ),
      home: Welcomepage(),
      //home: Firstscreen(),
    );
  }
}

