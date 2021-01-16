import 'package:flutter/material.dart';

class CounterService extends ChangeNotifier{
  int _counter = 0;

  int get counter => this._counter;

  void increase(){
    this._counter++;
    notifyListeners();
  }

  void decrease(){
    this._counter--;
    notifyListeners();
  }
}