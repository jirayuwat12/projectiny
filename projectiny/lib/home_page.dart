import 'package:flutter/material.dart';
import 'package:projectiny/index.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.monetization_on_rounded,color: Colors.white,),
          onPressed: (){

          },
        ),
        backgroundColor: ColorForm().PrimaryColor,
        title: Center(child: Text('PROJECTINY',style: TextForm().mainHeader,)),
        actions: [
          IconButton(
            icon: Icon(Icons.warning_amber_rounded,color: ColorForm().AlertColor,),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (builder)=>ReportPage()));
            },
          ),
        ],
      ),
    );
  }
}