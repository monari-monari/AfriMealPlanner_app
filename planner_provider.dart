import 'package:flutter/material.dart';
import '../services/ai_engine/ai_meal_service.dart';


class PlannerProvider extends ChangeNotifier {
final AiMealService aiMealService;
Map<String, dynamic>? _currentPlan;
bool _loading = false;


PlannerProvider({required this.aiMealService});


Map<String, dynamic>? get mealPlan => _currentPlan;
bool get isLoading => _loading;


Future<void> generatePlan(String goal) async {
_loading = true;
notifyListeners();


_currentPlan = await aiMealService.generateMealPlan(goal);


_loading = false;
notifyListeners();
}
}