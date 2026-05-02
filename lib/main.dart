import 'package:flutter/material.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(const BankApp());
}

class BankApp extends StatelessWidget {
  const BankApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bank App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF1E88E5),
        ),
        useMaterial3: true,
      ),
      home: const ResponsiveWrapper(),
    );
  }
}

// Responsive wrapper to constrain width on larger screens
class ResponsiveWrapper extends StatelessWidget {
  const ResponsiveWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Max width for phone-sized view on larger screens
        final maxWidth = constraints.maxWidth > 500 ? 500.0 : constraints.maxWidth;
        
        return Container(
          color: Colors.grey[100],
          child: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: maxWidth,
                minHeight: constraints.maxHeight,
              ),
              child: const LoginScreen(),
            ),
          ),
        );
      },
    );
  }
}
