import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class NewWorkoutScreen extends StatefulWidget {
  const NewWorkoutScreen({super.key});

  @override
  _NewWorkoutScreenState createState() => _NewWorkoutScreenState();
}

class _NewWorkoutScreenState extends State<NewWorkoutScreen> {
  final _formKey = GlobalKey<FormState>();
  String _exerciseName = '';
  int _sets = 0;
  List<int> _reps = [];
  List<double> _weights = [];
  bool _isCardio = false;
  int _duration = 0;
  int _startHeartRate = 0;
  int _endHeartRate = 0;
  int _caloriesBurned = 0;
  DateTime _selectedDate = DateTime.now();

  void _updateSets(int sets) {
    setState(() {
      _sets = sets;
      _reps = List<int>.filled(_sets, 0);
      _weights = List<double>.filled(_sets, 0.0);
    });
  }

  Future<void> _saveWorkout() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      final user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        final workoutData = {
          'exerciseName': _exerciseName,
          'sets': _sets,
          'reps': _reps,
          'weights': _weights,
          'isCardio': _isCardio,
          if (_isCardio)
            'cardio': {
              'duration': _duration,
              'startHeartRate': _startHeartRate,
              'endHeartRate': _endHeartRate,
              'caloriesBurned': _caloriesBurned,
            },
          'timestamp': Timestamp.now(),
          'date': _selectedDate,
          'userId': user.uid,
        };

        await FirebaseFirestore.instance
            .collection('workouts')
            .add(workoutData);

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Workout saved successfully!')),
        );

        Navigator.pop(context);
      }
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate)
      setState(() {
        _selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("New Workout"),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Exercise Name'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter an exercise name';
                  }
                  return null;
                },
                onSaved: (value) {
                  _exerciseName = value!;
                },
              ),
              ListTile(
                title: Text("Date: ${_selectedDate.toLocal()}".split(' ')[0]),
                trailing: const Icon(Icons.calendar_today),
                onTap: () => _selectDate(context),
              ),
              SwitchListTile(
                title: const Text('Is Cardio'),
                value: _isCardio,
                onChanged: (value) {
                  setState(() {
                    _isCardio = value;
                  });
                },
              ),
              if (_isCardio) ...[
                TextFormField(
                  decoration:
                      const InputDecoration(labelText: 'Duration (minutes)'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value!.isEmpty || int.tryParse(value) == null) {
                      return 'Please enter a valid number';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _duration = int.parse(value!);
                  },
                ),
                TextFormField(
                  decoration:
                      const InputDecoration(labelText: 'Starting Heart Rate'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value!.isEmpty || int.tryParse(value) == null) {
                      return 'Please enter a valid number';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _startHeartRate = int.parse(value!);
                  },
                ),
                TextFormField(
                  decoration:
                      const InputDecoration(labelText: 'Ending Heart Rate'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value!.isEmpty || int.tryParse(value) == null) {
                      return 'Please enter a valid number';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _endHeartRate = int.parse(value!);
                  },
                ),
                TextFormField(
                  decoration:
                      const InputDecoration(labelText: 'Calories Burned'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value!.isEmpty || int.tryParse(value) == null) {
                      return 'Please enter a valid number';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _caloriesBurned = int.parse(value!);
                  },
                ),
              ] else ...[
                TextFormField(
                  decoration:
                      const InputDecoration(labelText: 'Number of Sets'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value!.isEmpty || int.tryParse(value) == null) {
                      return 'Please enter a valid number';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    if (value.isNotEmpty && int.tryParse(value) != null) {
                      _updateSets(int.parse(value));
                    }
                  },
                  onSaved: (value) {
                    _sets = int.parse(value!);
                  },
                ),
                for (int i = 0; i < _sets; i++)
                  Column(
                    children: [
                      TextFormField(
                        decoration:
                            InputDecoration(labelText: 'Reps for set ${i + 1}'),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value!.isEmpty || int.tryParse(value) == null) {
                            return 'Please enter a valid number';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _reps[i] = int.parse(value!);
                        },
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: 'Weight for set ${i + 1} (kg)'),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value!.isEmpty ||
                              double.tryParse(value) == null) {
                            return 'Please enter a valid number';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _weights[i] = double.parse(value!);
                        },
                      ),
                    ],
                  ),
              ],
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _saveWorkout,
                child: const Text('Save Workout'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
