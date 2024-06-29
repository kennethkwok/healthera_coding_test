import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../repository/medication_repository.dart';
import '../../../repository/model/adherence.dart';
import '../../../repository/model/remedy.dart';
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
    final adherences = await _medicationRepo.getAdherences();
    final remedies = await _medicationRepo.getRemedies();

    final Map<Remedy, List<Adherence>> remedyMap = {};

    for (var remedy in remedies) {
      final matchingAdherences = adherences
          .where((adherence) => adherence.remedyId == remedy.remedyId)
          .toList();

      remedyMap[remedy] = matchingAdherences;
    }

    emit(DataLoadedMedicationState(remedyMap: remedyMap));
  }
}
