
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'BmiApp.dart';

class SplashScreenbmi extends StatefulWidget{
  @override
  State<SplashScreenbmi> createState() => _SplashScreenbmiState();
}
class _SplashScreenbmiState extends State<SplashScreenbmi> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3),(){
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context)=>MyBmiPage(),));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Color(0xffffecd2),Color(0xfffcb69f)
                  ]
              )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(21)),
               child: Image.asset('assets/images/BmiLogo.png', width: 100, height: 100,),
          ),
               // SizedBox(height: 9,),
               // Text('BMI',style: TextStyle(fontSize: 21,fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ) 
    );
  }
}


// Container(
// color: Color(0xfffcb69f),
// child: Center(
// child: Text('BMI',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold))),
// ),