import 'package:flutter/material.dart';
import 'dart:core';

import 'package:wallet_story_v2/models/page_list.dart';
import 'package:wallet_story_v2/pages/conclusion_page.dart';
import 'package:wallet_story_v2/pages/info_page.dart';
import 'package:wallet_story_v2/pages/home_page.dart';
import 'package:wallet_story_v2/pages/menu_page.dart';
import 'package:wallet_story_v2/models/listpage_summary_data.dart';
import 'input_list_page.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  bool isEachDay = false;
  PageList menu = PageList();
  int nowMenu = 1;
  StreamBuilder bodyInListpage = buildbodysummary();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(110),
          child: AppBar(
            // automaticallyImplyLeading: false,
            flexibleSpace: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 65, 0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: Icon(Icons.search_rounded,
                          color: Colors.white,
                          size: 27,
                        ),
                        onPressed: ( ){
                          dataListPageSummaryService.clear( );
                        },
                      ),
                      Text('รายการของฉัน',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.list_rounded,
                          color: Colors.white,
                          size: 27,
                        ),
                        onPressed: (){

                        },
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                      color: Colors.grey[200],
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(4, 0, 4, 0),
                            child: ButtonTheme(
                              minWidth: 170,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                              child: RaisedButton(
                                elevation: 0,
                                color: isEachDay? Colors.grey[200]:Colors.orange[800],
                                onPressed: (){
                                  setState(() {
                                    isEachDay = false;
                                    bodyInListpage = buildbodysummary();                                    
                                  });
                                },
                                child: Text('รวม',
                                  style: TextStyle(
                                    color: isEachDay?Colors.grey[800]:Colors.white,
                                    // fontWeight: FontWeight.bold,
                                    fontSize: 18
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(4, 0, 4, 0),
                            child: ButtonTheme(
                              minWidth: 170,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                              child: RaisedButton(
                                elevation: 0,
                                color: isEachDay? Colors.orange[800]:Colors.grey[200],
                                onPressed: (){
                                  setState(() {
                                    isEachDay = true; 
                                    bodyInListpage = buildbodyeachday();                                   
                                  });
                                },
                                child: Text('รายวัน',
                                  style: TextStyle(
                                    color: isEachDay? Colors.white : Colors.grey[800],
                                    // fontWeight: FontWeight.bold,
                                    fontSize: 18
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            )
        ),
      ),
      body: bodyInListpage,
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ButtonTheme(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        child: FloatingActionButton.extended(
          backgroundColor: Colors.green[400],
          icon: Icon(Icons.add,color: Colors.white,),
          onPressed: (){
            Navigator.push(context,MaterialPageRoute(builder: (BuildContext context)=>InputListPage()));
          },
          label: Text('เพิ่มรายการ',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color:Colors.white,
              fontSize: 18,
            ),
          ),
        ),
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


StreamBuilder buildbodysummary(){
  return StreamBuilder(
    stream: dataListPageSummaryService.stream,
    builder: (context,snapshot){
      return ListView(
        children: cardBuilder(dataListPageSummaryService.current),
      );
    },
  );
}
StreamBuilder buildbodyeachday(){
  return StreamBuilder(
    stream: dataListPageSummaryService.stream,
    builder: (context,snapshot){
      return Row(

      );
    },
  );
}

List<Padding> cardBuilder(List<DataStruct> data){
  List<Padding> result = [];
  data.forEach((element) {
    result.add(Padding(
      padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 5,
        child: Column(
          children: [
            Row(
              children: [
                element.icon,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    element.category,
                    Card(
                      elevation: 0,
                      color: (element.value.isNegative)?Colors.red[100]:Colors.green[100],
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 12, 0),
                        child: Row(
                          children: [
                          (element.value.isNegative)?Icon(Icons.arrow_drop_down_rounded):Icon(Icons.arrow_drop_up_rounded),
                          Text('${addKsimbal(element.value.toString())} THB'),
                          ],                       
                        ),
                      ),
                    )
                  ],
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ButtonTheme(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    child: RaisedButton(
                      elevation: 0,
                      color: Colors.amber[100],
                      onPressed: (){
                        dataListPageSummaryService.delete(element);
                      },
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                              child: Icon(Icons.more_horiz,color: Colors.orange[600],),
                            ),
                            Text('เพิ่มเติม',
                              style: TextStyle(
                                color: Colors.orange[600],
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 0, 0, 4),
                  child: element.discribe,
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 0, 0, 4),
                  child: Text(element.str_category,
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 8, 4),
                  child: Text('รายรับค้างรับ',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    ));
  });
  return result;
}

String addKsimbal(String input){
  String result ="";
  bool ispassdot = false;
  int numdigitpass = 0;
  for(int i = input.length-1; i>=0;i-=1){
    if(input[i]=='-' && i==0) break;
    if(ispassdot){
      numdigitpass+=1;
      if(numdigitpass == 4) {
        numdigitpass=0;
        i +=1;
        result +=',';
      }else result +=input[i];
    }
    else result += input[i];
    if(input[i] == '.') ispassdot = true;
  }
  return result.split('').reversed.join();
}