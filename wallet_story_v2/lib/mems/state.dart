import 'dart:ffi';

import 'package:rxdart/rxdart.dart';

class Money{
  var _cash = BehaviorSubject<Double>();
  
  Stream get stream => _cash.stream;
  Double get current => _cash.value;

  setvalue(Double newValue){
    _cash.add(newValue);
  }
}