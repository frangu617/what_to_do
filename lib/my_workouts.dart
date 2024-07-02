import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'home_screen.dart';

class MyWorkouts extends StatelessWidget {
  const MyWorkouts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Workouts'),
        backgroundColor: Colors.blue,
      ),
      body: const Center(
        child: Text('My Workouts'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const ()),
          );
        },
        child: const Icon(Icons.logout),
      ),
    );
  }
}