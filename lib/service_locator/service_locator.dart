import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../network/api_service.dart';
import '../repository/mapper/adherence_mapper.dart';
import '../repository/mapper/remedy_mapper.dart';
import '../repository/medication_repository.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  // networking
  getIt.registerLazySingleton<Dio>(() {
    final dio = Dio();
    dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: false,
      logPrint: (o) => debugPrint(o.toString()),
    ));
    return dio;
  });

  getIt.registerLazySingleton<ApiService>(() => ApiService(getIt<Dio>()));

  // repository
  getIt.registerFactory<MedicationRepository>(() => MedicationRepositoryImpl(
        apiService: getIt<ApiService>(),
        remedyMapper: RemedyMapper(),
        adherenceMapper: AdherenceMapper(),
      ));
}
