import 'package:flutter/material.dart';
import '../data/entities/food_item.dart';


class TrackerProvider extends ChangeNotifier {
final List<FoodItem> _dailyLog = [];


List<FoodItem> get dailyLog => List.unmodifiable(_dailyLog);


int get totalCalories => _dailyLog.fold(0, (sum, item) => sum + item.calories);


void addFood(FoodItem item) {
_dailyLog.add(item);
notifyListeners();
}


void removeFood(String id) {
_dailyLog.removeWhere((item) => item.id == id);
notifyListeners();
}


void clearLog() {
_dailyLog.clear();
notifyListeners();
}
}