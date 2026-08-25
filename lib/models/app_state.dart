import 'package:flutter/material.dart';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();
  factory FFAppState() => _instance;
  FFAppState._internal();

  String? _selectedPoolRef = 'demo_pool_1';
  String? get selectedPoolRef => _selectedPoolRef;
  set selectedPoolRef(String? val) {
    _selectedPoolRef = val;
    notifyListeners();
  }

  double _latestOrp = 720.0;
  double get latestOrp => _latestOrp;
  set latestOrp(double val) {
    _latestOrp = val;
    notifyListeners();
  }

  double _latestPh = 7.20;
  double get latestPh => _latestPh;
  set latestPh(double val) {
    _latestPh = val;
    notifyListeners();
  }
}
