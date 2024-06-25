import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sampleapp/screen_home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScreenTwo extends StatelessWidget {
   

  const ScreenTwo({super.key});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(" Logged IN "),
        backgroundColor: Colors.brown,
      
      
      ),
      body: SafeArea(
        child:Column(
          children: [
            
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(onPressed: (){ signout(context);}, child: Text(" signout"))
              ],
            )
,
            Text(" logged IN"),

          
          ],
        )
      ),
    );
  }


  void signout( BuildContext context) async{
    final sharedpref =  await SharedPreferences.getInstance();
    sharedpref.clear();

    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder:(ctx)=>ScreenHome()),(Route route)=>false);


   }
  
}