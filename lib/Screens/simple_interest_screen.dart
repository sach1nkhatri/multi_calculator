import 'package:flutter/material.dart';

class SimpleInterestScreen extends StatefulWidget {
  const SimpleInterestScreen({super.key});

  @override
  State<SimpleInterestScreen> createState() => _SimpleInterestScreenState();
}

class _SimpleInterestScreenState extends State<SimpleInterestScreen> {
  final TextEditingController principalController = TextEditingController();
  final TextEditingController rateController = TextEditingController();
  final TextEditingController timeController = TextEditingController();

  double? simpleInterest;
  String calculationDetails = '';

  void calculateSimpleInterest() {
    final double? principal = double.tryParse(principalController.text);
    final double? rate = double.tryParse(rateController.text);
    final double? time = double.tryParse(timeController.text);

    if (principal != null && rate != null && time != null) {
      double si = (principal * rate * time) / 100;
      setState(() {
        simpleInterest = si;
        calculationDetails =
        'SI = (P × R × T) / 100\n'
            '   = ($principal × $rate × $time) / 100\n'
            '   = ${si.toStringAsFixed(2)}';
      });
    } else {
      setState(() {
        simpleInterest = null;
        calculationDetails = '';
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter valid numbers')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple Interest Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: principalController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Principal Amount',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: rateController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Rate of Interest (%)',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: timeController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Time (years)',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: calculateSimpleInterest,
                child: const Text('Calculate'),
              ),
              const SizedBox(height: 24),
              if (simpleInterest != null) ...[
                Text(
                  'Simple Interest: ${simpleInterest!.toStringAsFixed(2)}',
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
