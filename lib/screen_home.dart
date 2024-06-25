
import 'package:flutter/material.dart';
import 'package:sampleapp/main.dart';
import 'package:sampleapp/screen_two.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScreenHome extends StatelessWidget {
   ScreenHome({super.key});
  final usernamecontroller = TextEditingController();
  final passwordcontroller = TextEditingController(); 

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      appBar: AppBar(
        title: Text(" Login page"),
        backgroundColor: Colors.blueGrey,
      ),
      body: SafeArea(child:
       Padding(
         padding: const EdgeInsets.all(8.0),
         child: Column(
          children: [
            TextField(
              controller: usernamecontroller,
              decoration: const  InputDecoration(
              border: OutlineInputBorder(),
              labelText: " UserName",
              hintText: "Enter the UserName",
              
            ),
            ),
            const  SizedBox( height: 10,),
         
         
            TextField( 
              controller: passwordcontroller,
              obscureText: true,

              decoration: const  InputDecoration(
                hintText: " Enter Password",
                border: OutlineInputBorder(),
                labelText: " password"
              )
         
            ),
             const SizedBox(height: 10,),
            
            ElevatedButton(onPressed: (){ valuecheck( context);}, child:Text("Login"),
            )  ,
            
          ],
               ),
       )),
    );
  }
   void valuecheck(  BuildContext context )  async {
    final _checkpassword = passwordcontroller.text;
    final _checkusername = usernamecontroller.text;
    if (_checkusername.isNotEmpty && _checkpassword.isNotEmpty) {
      final sharedpref = await  SharedPreferences.getInstance();
      sharedpref.setBool(Shared_Key,true);
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (ctx) {
            return ScreenTwo();
          },
        ),
      );
    } 

     else{
      showDialog(context: context, barrierDismissible: false, builder:(ctx1){
        return AlertDialog(
          title:  const Text(" Alert "),
          content: SingleChildScrollView(
            child:  ListBody(
              children: [
                Text(" The  username or password is empty")
              ],
            ),
          ),
          actions: [
            TextButton(onPressed: (){ Navigator.of(context).pop();}
            , child:Text("data"))
          ],
        );

      });
     }
    
   }
}




