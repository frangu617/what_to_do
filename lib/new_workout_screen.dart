// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'my_workouts.dart';
import 'home_screen.dart';

class NewWorkoutScreen extends StatefulWidget {
  const NewWorkoutScreen({super.key});
  @override
  _NewWorkoutScreenState createState() => _NewWorkoutScreenState();
}

class _NewWorkoutScreenState extends State<NewWorkoutScreen> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text("New Workout"),
        ),
      ),
    );
  }
}