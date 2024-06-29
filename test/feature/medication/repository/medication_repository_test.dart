import 'package:flutter_test/flutter_test.dart';
import 'package:healthera_coding_test/network/api_service.dart';
import 'package:healthera_coding_test/network/model/adherences_dto.dart';
import 'package:healthera_coding_test/network/model/remedies_dto.dart';
import 'package:healthera_coding_test/repository/mapper/adherence_mapper.dart';
import 'package:healthera_coding_test/repository/mapper/remedy_mapper.dart';
import 'package:healthera_coding_test/repository/medication_repository.dart';
import 'package:healthera_coding_test/repository/model/adherence.dart';
import 'package:healthera_coding_test/repository/model/remedy.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'medication_repository_test.mocks.dart';

@GenerateMocks([ApiService, RemedyMapper, AdherenceMapper])
void main() {
  late MockApiService mockApiService;
  late MockRemedyMapper mockRemedyMapper;
  late MockAdherenceMapper mockAdherenceMapper;
  late MedicationRepository medicationRepository;

  setUp(() {
    mockApiService = MockApiService();
    mockRemedyMapper = MockRemedyMapper();
    mockAdherenceMapper = MockAdherenceMapper();
    medicationRepository = MedicationRepositoryImpl(
      apiService: mockApiService,
      remedyMapper: mockRemedyMapper,
      adherenceMapper: mockAdherenceMapper,
    );
  });

  test(
    'should return list of remedy objects when getRemedies is called',
    () async {
      const remedy = Remedy(
        remedyId: 'id',
        dateCreatedTimestamp: 0,
        isOngoing: false,
        medicineId: 'medicine id',
        medicineName: 'medicine name',
        patientId: 'patient id',
        medicineType: 'type',
        repeatCycle: 0,
        allowEdit: false,
        isCurrent: true,
        price: 0.0,
        schedule: [],
      );

      when(mockApiService.getRemedies())
          .thenAnswer((_) async => const RemediesDto(
                data: [RemedyDto()],
              ));
      when(mockRemedyMapper.toRemedy(any)).thenAnswer((_) => remedy);

      final call = await medicationRepository.getRemedies();

      expect(call, equals([remedy]));
    },
  );

  test(
    'should return list of adherence objects when getAdherences is called',
    () async {
      final adherence = Adherence(adherenceId: 'id', remedyId: 'remedy id');

      when(mockApiService.getAdherences())
          .thenAnswer((_) async => const AdherencesDto(
                data: [AdherenceDto()],
              ));
      when(mockAdherenceMapper.toAdherence(any)).thenAnswer((_) => adherence);

      final call = await medicationRepository.getAdherences();

      expect(call, equals([adherence]));
    },
  );

  test(
    'should return error when getAdherences is called and error is thrown',
    () async {
      when(mockApiService.getAdherences())
          .thenAnswer((_) async => Future.error(Exception));

      await expectLater(
          medicationRepository.getAdherences(), throwsA(Exception));
    },
  );

  test(
    'should return error when getRemedies is called and error is thrown',
    () async {
      when(mockApiService.getRemedies())
          .thenAnswer((_) async => Future.error(Exception));

      await expectLater(medicationRepository.getRemedies(), throwsA(Exception));
    },
  );
}
