import 'package:flutter/material.dart';
import 'package:untitled3/Registerpage.dart';
import 'package:untitled3/diary.dart';
import 'package:untitled3/login&signup.dart';
import 'package:untitled3/signout.dart';
import 'package:google_fonts/google_fonts.dart';

import 'login&signup.dart';



class Welcomepage extends StatelessWidget{
  @override
  Widget build(BuildContext context)
  {
    return Material(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Stack(children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height /1.6,
                decoration: BoxDecoration(
                  color: Colors.white,

                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height /1.6,
                decoration: BoxDecoration(
                  color: Color(0xffe3b836),
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(70)),

                ),

                child: Center(child: Image.asset("images/logo1-modified.png",scale: 0.8)

              ),
              ),],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height /2.666,
                decoration: BoxDecoration(
                  color: Color(0xffe3b836),

                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height /2.666,
                padding: EdgeInsets.only(top: 40, bottom: 30),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(70),
                    )

                ),
                child: SingleChildScrollView(
                  child: Column(children: [
                    Text("Welcome To Helpie", style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1,
                      wordSpacing: 2,
                    ),
                    ),
                    SizedBox(height: 3),
                    Padding(padding: EdgeInsets.symmetric(horizontal: 40),
                      child: Text("You Are Low So You Are Rising",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          color: Color(0xffb11226),
                          fontWeight: FontWeight.bold,

                        ),),
                    ),
                    SizedBox(height: 60),
                    Material(
                      color: Color(0xffb11226),
                      borderRadius:BorderRadius.circular(10),
                      child: InkWell(
                        onTap: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>login1()
                              )
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 10,horizontal: 80),
                          child: Text("Get Started",style: TextStyle(
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
            )
          ],
        ),
      ),
    );
  }
}