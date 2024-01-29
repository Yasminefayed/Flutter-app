import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Firstscreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState()=> InitState();

}

class InitState extends State<Firstscreen>
    with SingleTickerProviderStateMixin

{
  @override
  void initState(){
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  }
  @override
  Widget build(BuildContext context){
    return initWidget();
  }
  Widget  initWidget(){
    return Scaffold(
      body: Stack(

        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
                color: new Color(0xffb11226),
                gradient: LinearGradient(
                    colors:[(new Color(0xffb11226)),(new Color(0xffa12232))],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter
                )

            ),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const[
                Icon(
                  Icons.medical_services,
                  size: 80,
                  color: Colors.red,
                ),
                SizedBox(height: 20),
                Text(' Welcome to Helpie',style: TextStyle(
                  fontStyle: FontStyle.italic,
                  color: Colors.white,
                  fontSize: 32,
                ),
                ),
                Text('Your Low So You Are Raising',style: TextStyle(
                  fontStyle: FontStyle.italic,
                  color: Colors.white,
                  fontSize: 28,
                ),
                ),

              ],
            ),
          ),

        ],
      ),
    );
  }
}