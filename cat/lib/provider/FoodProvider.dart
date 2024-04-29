import 'package:flutter/material.dart';

class FoodProvider extends ChangeNotifier {
  List<Map<String, dynamic>> _foodList = [];
  Map<String, dynamic>? _selectedFood;

  List<Map<String, dynamic>> get foodList => _foodList;
  Map<String, dynamic>? get selectedFood => _selectedFood;

  void addFood(Map<String, dynamic> food) {
    _foodList.add(food);
    notifyListeners();
  }

  void setSelectedFood(Map<String, dynamic>? food) {
    _selectedFood = food;
    notifyListeners();
  }
}
