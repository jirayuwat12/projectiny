import 'package:flutter/material.dart';
import 'pages/login_page.dart';
main(){
  runApp(MyApp( ));
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title : 'wallet story V.2',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: LoginPage( ),
    );
  }
}