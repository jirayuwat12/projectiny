import 'package:flutter/material.dart';
import 'package:wallet_story_v2/pages/home_page.dart';
import 'package:wallet_story_v2/pages/info_page.dart';
import 'package:wallet_story_v2/pages/list_page.dart';
import 'package:wallet_story_v2/pages/menu_page.dart';
import 'package:wallet_story_v2/models/page_list.dart';

class ConclusionPage extends StatefulWidget {
  @override
  _ConclusionPageState createState() => _ConclusionPageState();
}

class _ConclusionPageState extends State<ConclusionPage> {
  PageList menu = PageList( );
  int nowMenu = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

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