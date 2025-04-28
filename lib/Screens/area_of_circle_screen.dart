import 'package:flutter/material.dart';
import 'dart:math';

class AreaOfCircleScreen extends StatefulWidget {
  const AreaOfCircleScreen({super.key});

  @override
  State<AreaOfCircleScreen> createState() => _AreaOfCircleScreenState();
}

class _AreaOfCircleScreenState extends State<AreaOfCircleScreen> {
  final TextEditingController radiusController = TextEditingController();
  double? area;
  String calculationDetails = '';

  void calculateArea() {
    final double? radius = double.tryParse(radiusController.text);

    if (radius != null) {
      double a = pi * radius * radius;
      setState(() {
        area = a;
        calculationDetails =
        'Area = π × r²\n'
            '     = ${pi.toStringAsFixed(2)} × $radius²\n'
            '     = ${pi.toStringAsFixed(2)} × ${(radius * radius).toStringAsFixed(2)}\n'
            '     = ${a.toStringAsFixed(2)}';
      });
    } else {
      setState(() {
        area = null;
        calculationDetails = '';
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a valid number')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Area of Circle Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: radiusController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Radius',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: calculateArea,
                child: const Text('Calculate Area'),
              ),
              const SizedBox(height: 24),
              if (area != null) ...[
                Text(
                  'Area: ${area!.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blue.shade100,
                    border: Border.all(color: Colors.blue, width: 2),
                  ),
                  child: Center(
                    child: Text(
                      'r = ${radiusController.text}',
                      style: const TextStyle(fontSize: 16),
                    ),
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
