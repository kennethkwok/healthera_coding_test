import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:flutter/foundation.dart';

import 'model/adherences_dto.dart';
import 'model/remedies_dto.dart';

part 'api_service.g.dart';

@RestApi(
    baseUrl: "https://34574e81-855b-4c10-8987-935950fdd23c.mock.pstmn.io",
    parser: Parser.FlutterCompute)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET('/adherences')
  Future<AdherencesDto> getAdherences();

  @GET("/remedies")
  Future<RemediesDto> getRemedies();
}
