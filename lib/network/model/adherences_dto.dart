import 'package:json_annotation/json_annotation.dart';

part 'adherences_dto.g.dart';

AdherencesDto deserializeAdherencesDto(Map<String, dynamic> json) =>
    AdherencesDto.fromJson(json);

@JsonSerializable()
class AdherencesDto {
  @JsonKey(name: "data")
  final List<AdherenceDto>? data;

  const AdherencesDto({this.data});

  factory AdherencesDto.fromJson(Map<String, dynamic> json) =>
      _$AdherencesDtoFromJson(json);
}

@JsonSerializable()
class AdherenceDto {
  @JsonKey(name: "_id")
  final String? id;

  @JsonKey(name: "adherence_id")
  final String? adherenceId;

  @JsonKey(name: "patient_id")
  final String? patientId;

  @JsonKey(name: "remedy_id")
  final String? remedyId;

  @JsonKey(name: "alarm_time")
  final num? alarmTime;

  @JsonKey(name: "action")
  final String? action;

  @JsonKey(name: "action_time")
  final num? actionTime;

  @JsonKey(name: "dose_discrete")
  final num? doseDiscrete;

  @JsonKey(name: "dose_quantity")
  final num? doseQuantity;

  @JsonKey(name: "note")
  final String? note;

  const AdherenceDto({
    this.id,
    this.adherenceId,
    this.patientId,
    this.remedyId,
    this.alarmTime,
    this.action,
    this.actionTime,
    this.doseDiscrete,
    this.doseQuantity,
    this.note,
  });

  factory AdherenceDto.fromJson(Map<String, dynamic> json) =>
      _$AdherenceDtoFromJson(json);
}
