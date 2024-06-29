import 'package:flutter/foundation.dart';

import '../network/api_service.dart';
import 'mapper/adherence_mapper.dart';
import 'mapper/remedy_mapper.dart';
import 'model/adherence.dart';
import 'model/remedy.dart';

abstract class MedicationRepository {
  Future<List<Remedy>> getRemedies();
  Future<List<Adherence>> getAdherences();
}

class MedicationRepositoryImpl implements MedicationRepository {
  final ApiService _apiService;
  final RemedyMapper _remedyMapper;
  final AdherenceMapper _adherenceMapper;

  MedicationRepositoryImpl({
    required ApiService apiService,
    required RemedyMapper remedyMapper,
    required AdherenceMapper adherenceMapper,
  })  : _apiService = apiService,
        _remedyMapper = remedyMapper,
        _adherenceMapper = adherenceMapper;

  @override
  Future<List<Remedy>> getRemedies() async {
    try {
      final remedies = await _apiService.getRemedies().then((response) =>
          response.data
              ?.map((remedy) => _remedyMapper.toRemedy(remedy))
              .toList() ??
          List<Remedy>.empty());

      return remedies;
    } catch (error) {
      debugPrint("Error parsing remedies: $error");
      return Future.error(error);
    }
  }

  @override
  Future<List<Adherence>> getAdherences() async {
    try {
      final adherences = await _apiService.getAdherences().then((response) =>
          response.data
              ?.map((adherence) => _adherenceMapper.toAdherence(adherence))
              .toList() ??
          List<Adherence>.empty());

      return adherences;
    } catch (error) {
      debugPrint("Error parsing adherences: $error");
      return Future.error(error);
    }
  }
}
