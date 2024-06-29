import 'package:flutter/material.dart';
import 'package:healthera_coding_test/service_locator/service_locator.dart';

import 'feature/medication/view/medication.dart';

void main() {
  setupServiceLocator();
  runApp(const HealtheraCodingTestApp());
}

class HealtheraCodingTestApp extends StatelessWidget {
  const HealtheraCodingTestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MedicationScreen(),
    );
  }
}
