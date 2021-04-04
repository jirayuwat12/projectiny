import 'package:flutter/material.dart';
import 'index.dart';

import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';

class ReportPage extends StatefulWidget {
  @override
  _ReportPageState createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  bool isFix = false;
  var desckey = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorForm().AlertColor,
        title: Text('รายงาน',style: TextForm().mainHeader,),
      ),
      body: Column(
        children: [
          buildTypeSelect(context),
          buildDescriptionBox(),
          buildContactOption(),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: ColorForm().AlertColor,
        label: Text('ส่งรายงาน'),
        icon: Icon(Icons.send),
        onPressed: ()async{
          final Email email = Email(
            body: desckey.text,
            subject: 'Report from PROJECTINY app.'+(isFix?'ASAP':''),
            recipients: ['jirayuwat12@gmail.com'],
            attachmentPaths: [],
            isHTML: false,
          );
          await FlutterEmailSender.send(email);
          Navigator.pop(context);
        },
      ),
    );
  }

  Padding buildContactOption() {
    return Padding(
          padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
          child: Card(
            color: ColorForm().AlertColor,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('ช่องทางการติดต่ออื่นๆ',style: TextForm().normalHeaderOnDark,),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      icon:Transform.scale(
                        scale: 1,
                        child: Image.asset("assets/image/facebook.png")
                      ),
                      onPressed: (){
                        _launchFacebook();
                      },
                    ),
                    IconButton(
                      icon:Transform.scale(
                        scale: 1,
                        child: Image.asset("assets/image/instagram.png")
                      ),
                      onPressed: (){
                        _launchInstragram();
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
  }

  _launchFacebook()async{
    var url ='https://www.facebook.com/people/Jirayuwat-Boonchan/100007474157942/';
    await launch(url);
  }
  _launchInstragram()async{
    var url = 'https://www.instagram.com/_p_pp_pp/';
    await launch(url);
  }

  Padding buildDescriptionBox() {
    return Padding(
          padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
          child: Card(
            color: Colors.red[50],
            child: Column(
              children: [
                Center(
                  child: Text('คำอธิบาย',style: TextForm().normalHeader,),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Theme(
                    data: ThemeData(
                      primaryColor: Colors.white
                    ),
                    child: TextField(
                      controller: desckey,
                      decoration: InputDecoration(
                        labelStyle: TextForm().normalParagraph,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey[200],
                            width: 2
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey[200],
                            width: 2
                          ),
                        ),
                        fillColor: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
  }

  Padding buildTypeSelect(BuildContext context) {
    return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            color: Colors.red[50],
            child: Column(
              children: [
                Center(child: Text('ประเภท',style: TextForm().normalHeader,),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                      child: ButtonTheme(
                        minWidth: MediaQuery.of(context).size.width*0.4,
                        child: RaisedButton(
                          color: isFix?Colors.grey[100]:Colors.green[200],
                          onPressed: (){
                            setState(() {
                              isFix = false;
                            });
                          },
                          
                          child: Text('ปรับปรุง',style: TextForm().normalParagraph,),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                      child: ButtonTheme(
                        minWidth: MediaQuery.of(context).size.width*0.4,
                        child: RaisedButton(
                          color: isFix?Colors.yellow[200]:Colors.grey[100],
                          onPressed: (){
                            setState(() {
                              isFix = true;
                            });
                          },
                          child: Text('แก้ไข',style: TextForm().normalParagraph,),
                        ),
                      ),
                    ),
                    
                  ],
                ),
              ],
            ),
          ),
        );
  }
}