
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';

import 'package:wallet_story_v2/models/listpage_summary_data.dart';
import 'package:wallet_story_v2/models/data_info.dart';


class InputListPage extends StatefulWidget {
  @override
  _InputListPageState createState() => _InputListPageState();
}

class _InputListPageState extends State<InputListPage> {
  var value = TextEditingController();
  var textdescribe = TextEditingController();
  var money_color = Colors.grey[400];
  var money_boarding_color = Colors.grey[400];
  bool isIncome = true;
  String error = "";
  String dateTime = to_date_format(DateTime.now( ));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white
        ),
        title: Center(
          child: Text('เพิ่มรายการ',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        actions: [
          IconButton(
            icon:Icon(Icons.settings,color: Colors.white,),
            onPressed: (){

            },
          ),
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                        child: Icon(Icons.calendar_today_rounded,size: 50,),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('วันที่และเวลา',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text('วันที่ของรายการ',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[400],
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                    child: ButtonTheme(
                      height: 40,
                      minWidth: MediaQuery.of(context).size.width*0.9,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      child: MaterialButton(
                        child: Text(dateTime,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                        color: Colors.green[500],
                        onPressed: (){
                          showModalBottomSheet(
                            context: context,
                            builder: (BuildContext context){
                              return Container(
                                height: MediaQuery.of(context).copyWith().size.height / 3,
                                child: CupertinoDatePicker(
                                  initialDateTime: DateTime.now(),
                                  onDateTimeChanged: (DateTime newdate){
                                    print(newdate);
                                    setState(() {
                                      dateTime = to_date_format(newdate);
                                    });
                                  },
                                  use24hFormat: true,
                                  minuteInterval: 1,
                                  mode: CupertinoDatePickerMode.dateAndTime,
                                ),
                              );
                            }
                          );
                        },
                        
                      ),
                    ),
                  ),
                  
                ], 
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                        child: Icon(Icons.category_rounded,size: 50,),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('หมวดหมู่',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text('รายรับหรือรายจ่าย?',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[400],
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                        child: ButtonTheme(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          minWidth: MediaQuery.of(context).size.width*0.40,
                          child: RaisedButton(
                            color: isIncome?Colors.green[200]:Colors.grey[200],
                            onPressed: (){
                              setState(() {
                              isIncome = true;
                              });
                            },
                            child: Text('รายรับ',
                              style: TextStyle(
                                color: Colors.grey[1000],
                                fontWeight: FontWeight.bold,
                                fontSize: 18, 
                              ),
                            ),
                          ), 
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                        child: ButtonTheme(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          minWidth: MediaQuery.of(context).size.width*0.40,
                          child: RaisedButton(
                            color: isIncome?Colors.grey[200]:Colors.red[200],
                            onPressed: (){
                              setState(() {
                                isIncome = false;
                              });
                            },
                            child: Text('รายจ่าย',
                              style: TextStyle(
                                color: Colors.grey[1000],
                                fontWeight: FontWeight.bold,
                                fontSize: 18, 
                              ),
                            ),
                          ), 
                        ),
                      ),
                    ],
                  ),
                ], 
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                        child: Icon(Icons.money_rounded,size: 50,),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('จำนวน',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text('จำนวนเงิน?',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[400],
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      IconButton(
                        icon: Icon(Icons.calculate_rounded,size :30,color: Colors.amber[400],),
                        onPressed: (){

                        },
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                    child: TextField(
                      controller: value,
                      keyboardType: TextInputType.number,
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      autofocus: true,
                      cursorColor: Colors.grey[800],
                      decoration: InputDecoration(
                        suffixText: 'THB',
                        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15),borderSide: BorderSide(color: money_boarding_color)),
                        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15),borderSide: BorderSide(color: money_boarding_color)),
                        filled: true,
                        hintText: '0',
                        fillColor: money_color,
                      ),
                    ),
                  ),
                  Text(error,style: TextStyle(
                    color: Colors.red,
                  ),),
                  
                ], 
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                        child: Icon(Icons.description_rounded,size: 50,),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('รายละเอียด',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text('เขียนรายละเอียดเพิ่มเติม',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[400],
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                    child: TextField(
                      controller: textdescribe,
                      keyboardType: TextInputType.text,
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      autofocus: true,
                      cursorColor: Colors.grey[800],
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15),borderSide: BorderSide(color: Colors.grey[200])),
                        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15),borderSide: BorderSide(color: Colors.grey[200])),
                        filled: true,
                        hintText: '-',
                        fillColor: Colors.grey[200],
                      ),
                    ),
                  ),
                ], 
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: (){
          if(value.text == ""){
            setState(() {
              money_color = Colors.red[100];
              money_boarding_color = Colors.red[100];
              error = "จำเป็นต้องกำหนดจำนวน";
            });
          }
          dataListPageSummaryService.add(DataStruct(isIncome?'รายรับ':'รายจ่าย',(isIncome?1:-1) * double.parse(value.text),textdescribe.text==""?"no describe":textdescribe.text, dateTime, 'เงินสด'));
          if(isIncome){
            walletService.deposit_cash(double.parse(value.text));
          }else{
            walletService.withdraw_cash(double.parse(value.text));
          }
          Navigator.pop(context);
        },
        backgroundColor: Colors.green[400],
        icon: Icon(Icons.save),
        label: Text('บันทึก',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
String to_date_format(DateTime newdate){
  String toThaimonth(int inp){
    List<String>month = ['ม.ค.','ก.พ.','มี.ค.','เม.ย.','พ.ค.','มิ.ย.','ก.ค.','ส.ค.','ก.ย.','ต.ค.','พ.ย.','ธ.ค.',];
    return month[inp-1];
  }
  return (newdate.day.toString().length==1?'0'+newdate.day.toString():newdate.day.toString()) + '  ' +toThaimonth(newdate.month.toInt()) +  '  '+newdate.year.toString() + "    "+(newdate.hour.toString().length==1?'0'+newdate.hour.toString():newdate.hour.toString()) + ':' + (newdate.minute.toString().length==1?'0'+newdate.minute.toString():newdate.minute.toString());
}