import 'package:flutter/material.dart';
import 'pages/home_page.dart';
main(){
  runApp(MakeHomePage( ));
}

class MakeHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:'Wallet story V.2',
      theme: ThemeData(
        primaryColor: Colors.green[400],
        canvasColor: Colors.grey[200],
      ),
      home:HomePage( ),
    );
  }
}