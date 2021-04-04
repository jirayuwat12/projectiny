import 'dart:core';
import 'package:rxdart/rxdart.dart';
import 'package:flutter/material.dart';

class DataListPageSummary{
  var _info = BehaviorSubject<List<DataStruct>>.seeded([]);
  Stream get stream => _info.stream;
  List<DataStruct> get current => _info.value;

  void add(DataStruct dtst){
    List<String>month = ['ม.ค.','ก.พ.','มี.ค.','เม.ย.','พ.ค.','มิ.ย.','ก.ค.','ส.ค.','ก.ย.','ต.ค.','พ.ย.','ธ.ค.',];
    List<DataStruct> temp = _info.value;
    temp.insert(0,dtst);
    List<String> extractString(i)=>(temp[i].date.toStringShallow().split(', ')[1].split('"')[1].split('  ')..removeAt(3));
    bool isless(List<String> a ,List<String> b){
      if(int.parse(a[2]) < int.parse(b[2])) return true;
      else if (int.parse(a[2]) == int.parse(b[2])){
        if(month.indexWhere((element) => element == a[1]) < month.indexWhere((element) => element == b[1])) return true;
        else if(month.indexWhere((element) => element == a[1])==month.indexWhere((element) => element == b[1])){
          if(int.parse(a[0]) < int.parse(b[0])) return true;
          else if(int.parse(a[0]) == int.parse(b[0])){
            return true;
          }else return false;
        }else return false;
      }else return false;
    }
    for(int i = 0;i<temp.length-1;i++){
      if(isless(extractString(temp[i]),extractString(temp[i+1]))){
        DataStruct a = temp[i];
        temp[i] = temp[i+1];
        temp[i+1] = a;
      }else break;
    }
    _info.add(temp);
  }
  void delete(DataStruct target){
    List<DataStruct> temp = current;
    temp.remove(target);
    _info.add(temp);
  }

  clear()=> _info.add([]);
}
class DataStruct{
  Padding icon;
  Text category;
  String str_category;
  double value;
  Text discribe;
  Text date;
  Text type;

  DataStruct(String cate,double value,String desc,String date,String type){
    this.icon = Padding(
      padding: const EdgeInsets.all(8.0),
      child: Icon(Icons.money_rounded,size: 50,),
    );
    this.str_category = cate;
    this.category = Text(cate,
      style: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
    );
    this.value = value;
    this.discribe = Text('(' +desc+')',
      style: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.bold
      ),
    );
    this.date = Text(date);
    this.type = Text(type);
  }
}

DataListPageSummary dataListPageSummaryService = DataListPageSummary();