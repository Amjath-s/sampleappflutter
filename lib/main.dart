// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:sampleapp/splashscreen.dart';
const Shared_Key = " userloggin";
void main(List<String> args) {
  runApp(Myapp());
}
class Myapp extends StatelessWidget {
  const Myapp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Splashscreen(),
      theme: ThemeData(
        primaryColor: Colors.indigoAccent
      ),
    );
  }
}


