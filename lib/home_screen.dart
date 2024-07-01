// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'register_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoggedIn = false; // You will replace this with your auth logic

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Fitness App'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: isLoggedIn ? _buildUserGreeting() : _buildGuestGreeting(),
      ),
    );
  }

  Widget _buildUserGreeting() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Text('Welcome back, User!',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            // Navigate to your workout tracking pages or other parts of the app
          },
          child: const Text('Go to My Workouts'),
        ),
      ],
    );
  }

  Widget _buildGuestGreeting() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Text('Hello, Guest!',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        const SizedBox(height: 20),
        ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },
            child: const Text('Sign in with Google')),
        ElevatedButton(
          onPressed: () {
            // Navigate to your sign up page
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => RegisterScreen()),
            );
          },
          child: const Text('Sign Up'),
        ),
      ],
    );
  }
}
