// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'adherences_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdherencesDto _$AdherencesDtoFromJson(Map<String, dynamic> json) =>
    AdherencesDto(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => AdherenceDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AdherencesDtoToJson(AdherencesDto instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

AdherenceDto _$AdherenceDtoFromJson(Map<String, dynamic> json) => AdherenceDto(
      id: (json['_id'] as num?)?.toInt(),
      adherenceId: json['adherence_id'] as String?,
      patientId: json['patient_id'] as String?,
      remedyId: json['remedy_id'] as String?,
      alarmTime: json['alarm_time'] as num?,
      action: json['action'] as String?,
      actionTime: json['action_time'] as num?,
      doseDiscrete: json['dose_discrete'] as num?,
      doseQuantity: json['dose_quantity'] as num?,
      note: json['note'] as String?,
    );

Map<String, dynamic> _$AdherenceDtoToJson(AdherenceDto instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'adherence_id': instance.adherenceId,
      'patient_id': instance.patientId,
      'remedy_id': instance.remedyId,
      'alarm_time': instance.alarmTime,
      'action': instance.action,
      'action_time': instance.actionTime,
      'dose_discrete': instance.doseDiscrete,
      'dose_quantity': instance.doseQuantity,
      'note': instance.note,
    };
