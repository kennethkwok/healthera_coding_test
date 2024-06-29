// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remedies_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemediesDto _$RemediesDtoFromJson(Map<String, dynamic> json) => RemediesDto(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => RemedyDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RemediesDtoToJson(RemediesDto instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

RemedyDto _$RemedyDtoFromJson(Map<String, dynamic> json) => RemedyDto(
      id: json['_id'] as String?,
      remedyId: json['remedy_id'] as String?,
      patientId: json['patient_id'] as String?,
      dateCreated: json['date_created'] as num?,
      isOngoing: json['is_ongoing'] as bool?,
      startDate: json['start_date'] as num?,
      medicineId: json['medicine_id'] as String?,
      instruction: json['instruction'] as String?,
      medicineName: json['medicine_name'] as String?,
      medicineType: json['medicine_type'] as String?,
      endDate: json['end_date'] as num?,
      repeatCycle: json['repeat_cycle'] as num?,
      allowEdit: json['allow_edit'] as bool?,
      schedule: (json['schedule'] as List<dynamic>?)
          ?.map((e) => ScheduleDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      isCurrent: json['is_current'] as bool?,
      price: json['price'] as num?,
      medicine: json['medicine'] == null
          ? null
          : MedicineDto.fromJson(json['medicine'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RemedyDtoToJson(RemedyDto instance) => <String, dynamic>{
      '_id': instance.id,
      'remedy_id': instance.remedyId,
      'patient_id': instance.patientId,
      'date_created': instance.dateCreated,
      'is_ongoing': instance.isOngoing,
      'start_date': instance.startDate,
      'medicine_id': instance.medicineId,
      'instruction': instance.instruction,
      'medicine_name': instance.medicineName,
      'medicine_type': instance.medicineType,
      'end_date': instance.endDate,
      'repeat_cycle': instance.repeatCycle,
      'allow_edit': instance.allowEdit,
      'schedule': instance.schedule,
      'is_current': instance.isCurrent,
      'price': instance.price,
      'medicine': instance.medicine,
    };

ScheduleDto _$ScheduleDtoFromJson(Map<String, dynamic> json) => ScheduleDto(
      dayIterator: json['day_iterator'] as num?,
      alarmWindow: json['alarm_window'] as num?,
      dayOffset: json['day_offset'] as num?,
      doseMin: json['dose_min'] as num?,
      doseMax: json['dose_max'] as num?,
    );

Map<String, dynamic> _$ScheduleDtoToJson(ScheduleDto instance) =>
    <String, dynamic>{
      'day_iterator': instance.dayIterator,
      'alarm_window': instance.alarmWindow,
      'day_offset': instance.dayOffset,
      'dose_min': instance.doseMin,
      'dose_max': instance.doseMax,
    };

MedicineDto _$MedicineDtoFromJson(Map<String, dynamic> json) => MedicineDto(
      id: json['_id'] as String?,
      amppId: json['ampp_id'] as String?,
      amppName: json['ampp_name'] as String?,
      ampId: json['amp_id'] as String?,
      vmppId: json['vmpp_id'] as String?,
      discontinuedDate: json['discontinued_date'] as String?,
      pipCode: json['pip_code'] as String?,
      prescriptionCharges: json['prescription_charges'] as num?,
      nhsPrice: json['nhs_price'] as num?,
      nhsPriceDate: json['nhs_price_date'] as String?,
      gtin: (json['gtin'] as List<dynamic>?)?.map((e) => e as String).toList(),
      startDate: json['start_date'] as String?,
      medicineName: json['medicine_name'] as String?,
      genericName: json['generic_name'] as String?,
      courseQuantity: json['course_quantity'] as num?,
      medicineId: json['medicine_id'] as String?,
      name: json['name'] as String?,
      isControlled: json['controlled'] as bool?,
    );

Map<String, dynamic> _$MedicineDtoToJson(MedicineDto instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'ampp_id': instance.amppId,
      'ampp_name': instance.amppName,
      'amp_id': instance.ampId,
      'vmpp_id': instance.vmppId,
      'discontinued_date': instance.discontinuedDate,
      'pip_code': instance.pipCode,
      'prescription_charges': instance.prescriptionCharges,
      'nhs_price': instance.nhsPrice,
      'nhs_price_date': instance.nhsPriceDate,
      'gtin': instance.gtin,
      'start_date': instance.startDate,
      'medicine_name': instance.medicineName,
      'generic_name': instance.genericName,
      'course_quantity': instance.courseQuantity,
      'medicine_id': instance.medicineId,
      'name': instance.name,
      'controlled': instance.isControlled,
    };
