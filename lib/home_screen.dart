import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'my_workouts.dart';
import 'login_screen.dart';
import 'register_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  User? _user;
  String? _username;

  @override
  void initState() {
    super.initState();
    _checkUserStatus();
  }

  void _checkUserStatus() {
    // Get the current user
    _user = FirebaseAuth.instance.currentUser;

    // Listen to auth state changes
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      setState(() {
        _user = user;
        if (_user != null) {
          _fetchUsername();
        }
      });
    });
  }

  Future<void> _fetchUsername() async {
    if (_user != null) {
      var doc = await FirebaseFirestore.instance
          .collection('users')
          .doc(_user!.uid)
          .get();
      if (doc.exists) {
        setState(() {
          _username = doc.data()!['username'];
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false, // Remove the back button
          title: const Text('My Fitness App'),
          backgroundColor: Colors.blue,
        ),
        body: Center(
          child: _user != null ? _buildUserGreeting() : _buildGuestGreeting(),
        ),
      ),
    );
  }

  Widget _buildUserGreeting() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text('Welcome back, ${_username ?? 'User'}!',
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            // Navigate to your workout tracking pages or other parts of the app
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MyWorkouts()),
            );
          },
          child: const Text('Go to My Workouts'),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () async {
            await FirebaseAuth.instance.signOut();
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const LoginScreen()),
            );
          },
          child: const Text('Sign Out'),
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
                MaterialPageRoute(builder: (context) => const LoginScreen()),
              );
            },
            child: const Text('Sign in')),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const RegisterScreen()),
            );
          },
          child: const Text('Sign Up'),
        ),
      ],
    );
  }
}
