import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../repository/medication_repository.dart';
import '../../../service_locator/service_locator.dart';
import '../bloc/medication_bloc.dart';
import '../bloc/medication_event.dart';
import '../bloc/medication_state.dart';

class MedicationScreen extends StatefulWidget {
  const MedicationScreen({super.key});

  @override
  State<MedicationScreen> createState() => _MedicationScreenState();
}

class _MedicationScreenState extends State<MedicationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Healthera Medication"),
      ),
      body: BlocProvider(
        create: (_) =>
            MedicationBloc(medicationRepo: getIt<MedicationRepository>())
              ..add(LoadMedicationScreen()),
        child: BlocBuilder<MedicationBloc, MedicationState>(
          builder: (context, state) {
            if (state is InitialMedicationState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is DataLoadedMedicationState) {
              return const Placeholder();
            } else {
              return const Center(
                  child: Text("An error occurred loading the data"));
            }
          },
        ),
      ),
    );
  }
}
