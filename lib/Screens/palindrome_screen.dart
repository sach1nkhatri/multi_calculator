import 'package:flutter/material.dart';

class PalindromeScreen extends StatefulWidget {
  const PalindromeScreen({super.key});

  @override
  State<PalindromeScreen> createState() => _PalindromeScreenState();
}

class _PalindromeScreenState extends State<PalindromeScreen> {
  final TextEditingController inputController = TextEditingController();
  String result = '';
  String calculationDetails = '';

  void checkPalindrome() {
    String input = inputController.text.trim();
    String reversed = input.split('').reversed.join('');

    if (input.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter text or number')),
      );
      return;
    }

    setState(() {
      if (input.toLowerCase() == reversed.toLowerCase()) {
        result = 'It\'s a Palindrome!';
      } else {
        result = 'Not a Palindrome.';
      }
      calculationDetails =
      'Input: $input\n'
          'Reversed: $reversed\n'
          'Comparison: ${input.toLowerCase()} == ${reversed.toLowerCase()}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Palindrome Checker'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: inputController,
                decoration: const InputDecoration(
                  labelText: 'Enter Text or Number',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: checkPalindrome,
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
