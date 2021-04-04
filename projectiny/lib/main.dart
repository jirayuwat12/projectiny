import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projectiny/index.dart';

main(){
  return runApp(StartPage());
}

class StartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:HomePage()
    );
  }
}