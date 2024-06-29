import 'dart:convert';

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

    // Note: interceptorswrapper needed as endpoint response content-type is not application/json
    dio.interceptors
      ..add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: false,
        logPrint: (o) => debugPrint(o.toString()),
      ))
      ..add(
        InterceptorsWrapper(
          onResponse: (Response response, ResponseInterceptorHandler handler) {
            if (response.data is String) {
              try {
                String jsonStr = response.data;
                response.data = json.decode(jsonStr);
              } catch (e) {
                debugPrint(
                    'Error when trying to cast a string response data to json: $e');
              }
            }
            handler.next(response);
          },
        ),
      );
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
