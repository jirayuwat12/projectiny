import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:wallet_story_v2/models/page_list.dart';
import 'package:wallet_story_v2/pages/conclusion_page.dart';
import 'package:wallet_story_v2/pages/info_page.dart';
import 'package:wallet_story_v2/pages/list_page.dart';
import 'package:wallet_story_v2/pages/menu_page.dart';


class HomePage extends StatefulWidget {
   
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageList menu = PageList();
  int nowMenu = 0;
  @override
  Widget build(BuildContext context) {
    return summaryPage();
  }

  Scaffold summaryPage() {
    return Scaffold(
    appBar: AppBar(
      leading: IconButton(
        onPressed: () {

        },
        icon: Icon(Icons.notifications,color: Colors.white,size:25,),
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.book,color: Colors.white,), 
          onPressed: (){

          }),
      ],
      title: Center(
        child: Text(menu.names[nowMenu],
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
    ),
    body: ListView(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
          child: Card(
            elevation: 5,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                      child: Icon(
                        Icons.account_balance_wallet_outlined,
                        size: 50,
                        color: Colors.green,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('My Account 1',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[700],
                            ),
                          ),
                          Text('My expanse and income.',
                            style: TextStyle(
                              color: Colors.grey[700],
                              fontSize: 10,
                            ),
                          )
                        ],
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RaisedButton(
                        elevation: 0,
                        onPressed: ( ){

                        },
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        color: Colors.amber[100],
                        child: Row(
                          children: [
                            Icon(Icons.apps_rounded,color: Colors.orange[600],),
                            Text('แก้ไข',
                              style: TextStyle(
                                color: Colors.orange[600],
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                  ],
                ),
                Row(
                  children: [
                    Card(
                      elevation: 0,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(13, 2, 13, 4),
                        child: Text('3 วัน',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                          ),
                        ),
                      ),
                      color: Colors.blueGrey[900],
                    ),
                    Card(
                      elevation: 0,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(13, 2, 13, 4),
                        child: Text('9 รายการ',
                          style: TextStyle(                              
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      color: Colors.lightGreen[600],
                    ),
                  ],
                ),
                buildfirstRow(Icon(Icons.money_rounded,size: 30,),'เงินสด',400),
                buildfirstRow(Icon(Icons.credit_card_rounded,size: 30,),'บัญชีธนาคาร',1503),
                buildfirstRow(Icon(Icons.shopping_bag_rounded,size: 30,),'รายรับค้างรับ',320),
                buildfirstRow(Icon(Icons.shopping_bag_rounded,size: 30,),'หนี้สิน',1000),
                buildfirstRow(Icon(Icons.credit_card_rounded,size: 30,),'บัตรเครดิต',1234),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
          child: Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            elevation: 5,
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.calendar_today,size: 30,),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8, 4, 0, 0),
                              child: Text('วันนี้',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Card(
                              elevation: 0,
                              color: Colors.grey[400],
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(13,1,13,3),
                                child: Text('0 รายการ',
                                  style: TextStyle(
                                    color: Colors.grey[800],
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14
                                  ),
                                ),
                              ),
                            ),
                            //Spacer(),
                            Card(
                              elevation: 0,
                              color: Colors.lightGreen[100],
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(13,4,13,4),
                                child: Text('0 THB',
                                  style: TextStyle(
                                    color: Colors.lightGreen[800],
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Spacer( ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('21 มี.ค. 2021',textAlign: TextAlign.right,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.grey[600],
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(5, 0, 5, 8),
                  child: Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    color: Colors.green[100],
                    child: Row(
                      mainAxisAlignment:MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8, 4, 0, 7),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('รายรับ',textAlign: TextAlign.start,
                                style: TextStyle(
                                  color: Colors.green[700],
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text('จำนวน 0 รายการ',
                                style: TextStyle(
                                  color: Colors.green[400],
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0,8,14,8),
                          child: Text('0 THB',
                            style: TextStyle(
                              color: Colors.green[700],
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(5, 0, 5, 8),
                  child: Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    color: Colors.red[100],
                    child: Row(
                      mainAxisAlignment:MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8, 4, 0, 7),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('รายจ่าย',textAlign: TextAlign.start,
                                style: TextStyle(
                                  color: Colors.red[700],
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text('จำนวน 0 รายการ',
                                style: TextStyle(
                                  color: Colors.red[400],
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0,8,14,8),
                          child: Text('0 THB',
                            style: TextStyle(
                              color: Colors.red[700],
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],  
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
          child: Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            elevation: 5,
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.calendar_today,size: 30,),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8, 4, 0, 0),
                              child: Text('เดือนนี้',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Card(
                              elevation: 0,
                              color: Colors.grey[400],
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(13,1,13,3),
                                child: Text('9 รายการ',
                                  style: TextStyle(
                                    color: Colors.grey[800],
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14
                                  ),
                                ),
                              ),
                            ),
                            //Spacer(),
                            Card(
                              elevation: 0,
                              color: Colors.red[200],
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(13,4,13,4),
                                child: Text('-735 THB',
                                  style: TextStyle(
                                    color: Colors.red[800],
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Spacer( ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('มี.ค. 2021',textAlign: TextAlign.right,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.grey[600],
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(5, 0, 5, 8),
                  child: Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    color: Colors.green[100],
                    child: Row(
                      mainAxisAlignment:MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8, 4, 0, 7),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('รายรับ',textAlign: TextAlign.start,
                                style: TextStyle(
                                  color: Colors.green[700],
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text('จำนวน 4 รายการ',
                                style: TextStyle(
                                  color: Colors.green[400],
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0,8,14,8),
                          child: Text('375 THB',
                            style: TextStyle(
                              color: Colors.green[700],
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(5, 0, 5, 8),
                  child: Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    color: Colors.red[100],
                    child: Row(
                      mainAxisAlignment:MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8, 4, 0, 7),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('รายจ่าย',textAlign: TextAlign.start,
                                style: TextStyle(
                                  color: Colors.red[700],
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text('จำนวน 5 รายการ',
                                style: TextStyle(
                                  color: Colors.red[400],
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0,8,14,8),
                          child: Text('1,110 THB',
                            style: TextStyle(
                              color: Colors.red[700],
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],  
            ),
          ),
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
              child: ButtonTheme(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                minWidth: 150,
                child: RaisedButton(  
                  onPressed: () {

                  },
                  color: Colors.green,
                  child: Text('ปรับแต่ง',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    ),
    bottomNavigationBar: BottomNavigationBar(
        items: buildBottomNavigationBarItem(),          
        type: BottomNavigationBarType.fixed,
        currentIndex: nowMenu,
        selectedItemColor: Colors.green,
        onTap: (int index){ 
          setState(() {
            if(index == 0) Navigator.pushReplacement(context, PageRouteBuilder(
              transitionDuration: Duration(seconds: 0),
              pageBuilder: (context,animation1,animation2)=> HomePage()
            ));
            else if(index == 1) Navigator.pushReplacement(context, PageRouteBuilder(
              transitionDuration: Duration(seconds: 0),
              pageBuilder: (context,animation1,animation2)=> ListPage()
            ));
            else if(index == 2) Navigator.pushReplacement(context, PageRouteBuilder(
              transitionDuration: Duration(seconds: 0),
              pageBuilder: (context,animation1,animation2)=> ConclusionPage()
            ));
            else if(index == 3) Navigator.pushReplacement(context, PageRouteBuilder(
              transitionDuration: Duration(seconds: 0),
              pageBuilder: (context,animation1,animation2)=> InfoPage()
            ));
            else if(index == 4) Navigator.pushReplacement(context,  PageRouteBuilder(
              transitionDuration: Duration(seconds: 0),
              pageBuilder: (context,animation1,animation2)=> MenuPage()
            ));
          });
        },
      ),
  );
  }

  Row buildfirstRow(Icon firstIcon,String name,int value) {
    return Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                child: firstIcon,
              ),
              Text(name,
                style: TextStyle(
                  color: Colors.grey[700],
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacer( ),
              Text(value.toString() + ' THB',
                style: TextStyle(
                  color: Colors.grey[700],
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                child: ButtonTheme(
                  height: 30,
                  minWidth: 0,
                  child: RaisedButton(
                    elevation: 0,
                    color: Colors.grey,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    onPressed: (){

                    },
                    child: Icon(Icons.edit_outlined,color: Colors.white,),
                  ),
                ),
              ),
            ],
          );
  }

  List<BottomNavigationBarItem> buildBottomNavigationBarItem() {
    List<BottomNavigationBarItem> ans = [];
    for(int i = 0 ;i < menu.icons.length ;i+=1){
      ans.add(BottomNavigationBarItem(
        icon : menu.icons[i],
        title: Text(menu.names[i],
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.grey[600],
            
          ),
        ),
      ));
    }
    return ans;
  }
}