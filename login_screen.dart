import 'package:flutter/material.dart';
import '../../../providers/auth_provider.dart';
import 'package:provider/provider.dart';


class LoginScreen extends StatelessWidget {
const LoginScreen({super.key});


@override
Widget build(BuildContext context) {
return Scaffold(
body: Padding(
padding: const EdgeInsets.all(20.0),
child: Column(
mainAxisAlignment: MainAxisAlignment.center,
children: [
const Text('Login to AfriMeal Planner', style: TextStyle(fontSize: 22)),
const SizedBox(height: 20),
ElevatedButton(
onPressed: () {
context.read<AuthProvider>().login();
},
child: const Text('Login'),
)
],
),
),
);
}
}