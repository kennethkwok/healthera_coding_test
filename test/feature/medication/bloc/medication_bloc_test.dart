import 'package:flutter_test/flutter_test.dart';
import 'package:healthera_coding_test/feature/medication/bloc/medication_bloc.dart';
import 'package:healthera_coding_test/feature/medication/bloc/medication_event.dart';
import 'package:healthera_coding_test/feature/medication/bloc/medication_state.dart';
import 'package:healthera_coding_test/feature/medication/model/list_item.dart';
import 'package:healthera_coding_test/repository/medication_repository.dart';
import 'package:healthera_coding_test/repository/model/adherence.dart';
import 'package:healthera_coding_test/repository/model/remedy.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:bloc_test/bloc_test.dart';

import 'medication_bloc_test.mocks.dart';

@GenerateMocks([MedicationRepository])
void main() {
  late MockMedicationRepository mockMedicationRepository;
  late MedicationBloc bloc;

  setUp(() {
    mockMedicationRepository = MockMedicationRepository();
    bloc = MedicationBloc(medicationRepo: mockMedicationRepository);
  });

  final adherence = Adherence(adherenceId: 'adherenceId', remedyId: 'remedyId');
  const remedy = Remedy(
      remedyId: 'remedyId',
      dateCreatedTimestamp: 0,
      isOngoing: false,
      medicineId: 'medicineId',
      medicineName: 'medicineName',
      medicineType: 'medicineType',
      repeatCycle: 0,
      allowEdit: false,
      isCurrent: false,
      price: 0.0,
      schedule: []);

  blocTest<MedicationBloc, MedicationState>(
    'should emit data loaded state when getRemedies and getAdherences are called',
    build: () {
      when(mockMedicationRepository.getAdherences())
          .thenAnswer((_) async => []);

      when(mockMedicationRepository.getRemedies()).thenAnswer((_) async => []);
      return bloc;
    },
    act: (bloc) => bloc.add(LoadMedicationScreen()),
    expect: () => [const DataLoadedMedicationState(items: [])],
  );

  blocTest<MedicationBloc, MedicationState>(
    'should emit data loaded state with items when getRemedies and getAdherences are called',
    build: () {
      when(mockMedicationRepository.getAdherences())
          .thenAnswer((_) async => [adherence]);

      when(mockMedicationRepository.getRemedies())
          .thenAnswer((_) async => [remedy]);
      return bloc;
    },
    act: (bloc) => bloc.add(LoadMedicationScreen()),
    expect: () => [
      DataLoadedMedicationState(items: [
        RemedyListItem(remedy),
        AdherenceListItem(adherence),
        SpacerItem(),
      ])
    ],
  );

  blocTest<MedicationBloc, MedicationState>(
    'should emit error state when getRemedies returns an error',
    build: () {
      when(mockMedicationRepository.getRemedies())
          .thenThrow((_) async => Error());
      return bloc;
    },
    act: (bloc) => bloc.add(LoadMedicationScreen()),
    expect: () => [ErrorMedicationState()],
  );

  blocTest<MedicationBloc, MedicationState>(
    'should emit error state when getAdherences returns an error',
    build: () {
      when(mockMedicationRepository.getAdherences())
          .thenThrow((_) async => Error());
      return bloc;
    },
    act: (bloc) => bloc.add(LoadMedicationScreen()),
    expect: () => [ErrorMedicationState()],
  );
}
