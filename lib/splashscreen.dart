import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sampleapp/main.dart';
import 'package:sampleapp/screen_home.dart';
import 'package:sampleapp/screen_two.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> 
{
  @override
   void initState()
    {
      
    super.initState();
    prefcheck();
    
    }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Column(children: [
        Text(" hi "),
        SizedBox(
          child:ColoredBox(color: Colors.black),
          height: 100,
          
        )
        
      ],)),

    );
  }
void prefcheck() async{
  final sharedpref =  await SharedPreferences.getInstance();
  final prefvalue =sharedpref.getBool(Shared_Key);

  if (prefvalue != null &&  prefvalue ==true)
  {
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx){
      return ScreenTwo();
    }));
  }
  else{
       Future.delayed(const Duration( seconds:2), ()=>
       Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(ctx)=> ScreenHome()
       )
       )
       
       );
  }

}
}