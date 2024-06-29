import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../repository/medication_repository.dart';
import '../model/list_item.dart';
import 'medication_event.dart';
import 'medication_state.dart';

class MedicationBloc extends Bloc<MedicationEvent, MedicationState> {
  final MedicationRepository _medicationRepo;

  MedicationBloc({required MedicationRepository medicationRepo})
      : _medicationRepo = medicationRepo,
        super(InitialMedicationState()) {
    on<LoadMedicationScreen>(_onLoadMedicationScreen);
  }

  Future<void> _onLoadMedicationScreen(
    LoadMedicationScreen event,
    Emitter<MedicationState> emit,
  ) async {
    try {
      final adherences = await _medicationRepo.getAdherences();
      final remedies = await _medicationRepo.getRemedies();

      final List<ListItem> items = [];

      for (var remedy in remedies) {
        final matchingAdherences = adherences
            .where((adherence) => adherence.remedyId == remedy.remedyId)
            .toList();

        if (matchingAdherences.isNotEmpty) {
          items
            ..add(RemedyListItem(remedy))
            ..addAll(matchingAdherences.map((e) => AdherenceListItem(e)))
            ..add(SpacerItem());
        } else {
          items
            ..add(RemedyListItem(remedy))
            ..add(SpacerItem());
        }
      }

      emit(DataLoadedMedicationState(items: items));
    } catch (error) {
      emit(ErrorMedicationState());
    }
  }
}
