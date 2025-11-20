class AiMealService {
Future<Map<String, dynamic>> generateMealPlan(String goal) async {
return {
"breakfast": "Oats with banana",
"lunch": "Ugali + Sukuma Wiki",
"dinner": "Rice + Beans"
};
}
}