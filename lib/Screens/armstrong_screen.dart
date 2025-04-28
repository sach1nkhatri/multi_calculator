import 'package:flutter/material.dart';

class ArmstrongScreen extends StatefulWidget {
  const ArmstrongScreen({super.key});

  @override
  State<ArmstrongScreen> createState() => _ArmstrongScreenState();
}

class _ArmstrongScreenState extends State<ArmstrongScreen> {
  final TextEditingController numberController = TextEditingController();
  String result = '';
  String calculationDetails = '';

  void checkArmstrong() {
    final String input = numberController.text;
    final int? num = int.tryParse(input);

    if (num == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a valid number')),
      );
      return;
    }

    int sum = 0;
    String steps = '';

    for (int i = 0; i < input.length; i++) {
      int digit = int.parse(input[i]);
      int power = digit * digit * digit;
      sum += power;
      steps += '$digit³ = $power\n';
    }

    setState(() {
      if (sum == num) {
        result = 'It\'s an Armstrong Number!';
      } else {
        result = 'Not an Armstrong Number.';
      }
      calculationDetails =
      'Steps:\n$steps\nSum = $sum\nComparison: $sum == $num';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Armstrong Number Checker'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: numberController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Enter a number',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: checkArmstrong,
                child: const Text('Check'),
              ),
              const SizedBox(height: 24),
              if (result.isNotEmpty) ...[
                Text(
                  result,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  calculationDetails,
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
