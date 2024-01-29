import 'package:flutter/material.dart';
import 'package:untitled3/Registerpage.dart';
import 'package:untitled3/dummy.dart';
import 'package:untitled3/login.dart';
import 'package:untitled3/navbar_roots.dart';

class login1 extends StatefulWidget{
  @override
  State<login1> createState()=> login2();
}

class login2 extends State<login1>{
  @override
  Widget build(BuildContext context){
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

              ),
            ],
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                        child: Padding(padding: EdgeInsets.symmetric(vertical: 15,horizontal: 40),
                          child: Text('Login',style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),),

                        ),
                      ),
                    ),
                    Material(
                      color: Color(0xffb11226),
                      borderRadius:BorderRadius.circular(10),
                      child: InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => Register()
                          )
                          );
                        },
                        child: Padding(padding: EdgeInsets.symmetric(vertical: 15,horizontal: 40),
                          child: Text('Sign Up',style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),),

                        ),
                      ),
                    )
                  ],

                ),

              ),
            ),
          ],

        ),
      ),
    );
  }
}