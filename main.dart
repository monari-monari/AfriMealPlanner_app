import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'presentation/auth/screens/login_screen.dart';


void main() {
runApp(const AfriMealApp());
}


class AfriMealApp extends StatelessWidget {
const AfriMealApp({super.key});


@override
Widget build(BuildContext context) {
return MaterialApp(
title: 'AfriMeal Planner',
theme: AppTheme.lightTheme,
debugShowCheckedModeBanner: false,
home: const LoginScreen(),
);
}
}