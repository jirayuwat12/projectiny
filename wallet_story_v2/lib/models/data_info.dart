import 'dart:core';
import 'dart:math';
import 'package:rxdart/rxdart.dart';

class wallet{
  var _info = BehaviorSubject<walletdetail>.seeded(walletdetail());
  Stream get stream => _info.stream;
  walletdetail get current => _info.value;

  deposit_cash(double v){
    var now = current;
    now.cash += v;
    _info.add(now);
  }
  withdraw_cash(double v){
    var now = current;
    now.cash -= v;
    _info.add(now);
  
  }
  deposit_account(String name,double value){
    var now = current;
    now.sum_account +=value;
    int ind = now.account_string.indexWhere((element) => element==name);
    if(ind == -1){
      now.account_string.insert(0, name);
      now.account_value.insert(0,value);
    }else{
      now.account_value[ind] += value; 
    }
    _info.add(now);
  }
  withdraw_account(String name,double value){
    var now = current;
    now.sum_account -=value;
    int ind = now.account_string.indexWhere((element) => element==name);
    if(ind == -1){
      now.account_string.insert(0, name);
      now.account_value.insert(0, -1 * value);
    }else{
      now.account_value[ind] -= value; 
    }
    _info.add(now);
  }
  add_loan(String name,double value){
    var now = current;
    now.sum_loan += value;
    int ind = now.loan_string.indexWhere((element) => element==name);
    if(ind == -1){
      now.loan_string.insert(0, name);
      now.loan_value.insert(0,  value);
    }else{
      now.loan_value[ind] += value; 
    }
    _info.add(now);
  }
  paid_loan(String name,double value){
    var now = current;
    now.sum_loan -=value;
    int ind = now.loan_string.indexWhere((element) => element==name);
    if(ind == -1){
      now.loan_string.insert(0, name);
      now.loan_value.insert(0, -1 * value);
    }else{
      now.loan_value[ind] -= value; 
    }
    _info.add(now);
  }
  paid_debt(String name,double value){
    var now = current;
    now.sum_debt -= value;
    int ind = now.debt_string.indexWhere((element) => element==name);
    if(ind == -1){
      now.debt_string.insert(0, name);
      now.debt_value.insert(0, -1 * value);
    }else{
      now.debt_value[ind] -= value; 
    }
    _info.add(now);
  }
  add_debt(String name,double value){
    var now = current;
    now.sum_debt +=value;
    int ind = now.debt_string.indexWhere((element) => element==name);
    if(ind == -1){
      now.debt_string.insert(0, name);
      now.debt_value.insert(0,value);
    }else{
      now.debt_value[ind] += value; 
    }
    _info.add(now);
  }
}

class walletdetail{

  double cash = 0;
  double sum_account = 0;
  double sum_debt =0;
  double sum_loan = 0;
  List<double> account_value = [];
  List<String> account_string =[];
  List<double> debt_value = [];
  List<String> debt_string =[];
  List<double> loan_value = [];
  List<String> loan_string =[];
}

var walletService = wallet();