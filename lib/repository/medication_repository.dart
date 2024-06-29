import 'package:healthera_coding_test/network/api_service.dart';

abstract class MedicationRepository {}

class MedicationRepositoryImpl implements MedicationRepository {
  final ApiService _apiService;

  MedicationRepositoryImpl({required ApiService apiService})
      : _apiService = apiService;
}
