
import 'dart:async';


import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:quizapp_quizzapp/firstpage.dart';
import 'package:quizapp_quizzapp/quizscreen.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});
  @override
  State<Splashscreen> createState()=> _SplashscreenState();
}
class _SplashscreenState extends State<Splashscreen>{
  void initState(){
    Timer(const Duration(seconds: 5),(){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>  Firstpage(),));
    });
    super.initState();
  }
  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      
      body: Container(
        
        
        child: Center(
          child: Lottie.asset("assets/images/ann.json",
          width: 250,
          height: 250,
          fit: BoxFit.fill),
          
        ) ,
      )
     
    );
  }
}