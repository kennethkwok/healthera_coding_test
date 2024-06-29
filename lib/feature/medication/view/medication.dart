import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthera_coding_test/feature/medication/widgets/adherence_item.dart';
import 'package:healthera_coding_test/feature/medication/widgets/remedy_item.dart';

import '../../../repository/medication_repository.dart';
import '../../../service_locator/service_locator.dart';
import '../bloc/medication_bloc.dart';
import '../bloc/medication_event.dart';
import '../bloc/medication_state.dart';
import '../model/list_item.dart';

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
              return _medicationList(state.items);
            } else {
              return const Center(
                  child: Text("An error occurred loading the data"));
            }
          },
        ),
      ),
    );
  }

  Widget _medicationList(List<ListItem> items) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        if (item is RemedyListItem) {
          return RemedyItem(item: item);
        } else if (item is AdherenceListItem) {
          return AdherenceItem(item: item);
        } else if (item is SpacerItem) {
          return const SizedBox(height: 16);
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
