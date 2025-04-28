import 'package:flutter/material.dart';
import '../widgets/dashboard_button.dart';
import 'simple_interest_screen.dart';
import 'area_of_circle_screen.dart';
import 'palindrome_screen.dart';
import 'armstrong_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          children: [
            DashboardButton(
              title: 'Simple Interest',
              icon: Icons.attach_money,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const SimpleInterestScreen()),
                );
              },
            ),
            DashboardButton(
              title: 'Area of Circle',
              icon: Icons.circle,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const AreaOfCircleScreen()),
                );
              },
            ),
            DashboardButton(
              title: 'Palindrome',
              icon: Icons.repeat,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const PalindromeScreen()),
                );
              },
            ),
            DashboardButton(
              title: 'Armstrong Number',
              icon: Icons.numbers,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const ArmstrongScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
