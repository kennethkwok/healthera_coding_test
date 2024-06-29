import 'package:json_annotation/json_annotation.dart';

part 'remedies_dto.g.dart';

RemediesDto deserializeRemediesDto(Map<String, dynamic> json) =>
    RemediesDto.fromJson(json);

@JsonSerializable()
class RemediesDto {
  @JsonKey(name: "data")
  final List<RemedyDto>? data;

  const RemediesDto({this.data});

  factory RemediesDto.fromJson(Map<String, dynamic> json) =>
      _$RemediesDtoFromJson(json);
}

@JsonSerializable()
class RemedyDto {
  @JsonKey(name: "_id")
  final String? id;

  @JsonKey(name: "remedy_id")
  final String? remedyId;

  @JsonKey(name: "patient_id")
  final String? patientId;

  @JsonKey(name: "date_created")
  final num? dateCreated;

  @JsonKey(name: "is_ongoing")
  final bool? isOngoing;

  @JsonKey(name: "start_date")
  final num? startDate;

  @JsonKey(name: "medicine_id")
  final String? medicineId;

  @JsonKey(name: "instruction")
  final String? instruction;

  @JsonKey(name: "medicine_name")
  final String? medicineName;

  @JsonKey(name: "medicine_type")
  final String? medicineType;

  @JsonKey(name: "end_date")
  final num? endDate;

  @JsonKey(name: "repeat_cycle")
  final num? repeatCycle;

  @JsonKey(name: "allow_edit")
  final bool? allowEdit;

  @JsonKey(name: "schedule")
  final List<ScheduleDto>? schedule;

  @JsonKey(name: "is_current")
  final bool? isCurrent;

  @JsonKey(name: "price")
  final num? price;

  @JsonKey(name: "medicine")
  final MedicineDto? medicine;

  const RemedyDto({
    this.id,
    this.remedyId,
    this.patientId,
    this.dateCreated,
    this.isOngoing,
    this.startDate,
    this.medicineId,
    this.instruction,
    this.medicineName,
    this.medicineType,
    this.endDate,
    this.repeatCycle,
    this.allowEdit,
    this.schedule,
    this.isCurrent,
    this.price,
    this.medicine,
  });

  factory RemedyDto.fromJson(Map<String, dynamic> json) =>
      _$RemedyDtoFromJson(json);
}

@JsonSerializable()
class ScheduleDto {
  @JsonKey(name: "day_iterator")
  final num? dayIterator;

  @JsonKey(name: "alarm_window")
  final num? alarmWindow;

  @JsonKey(name: "day_offset")
  final num? dayOffset;

  @JsonKey(name: "dose_min")
  final num? doseMin;

  @JsonKey(name: "dose_max")
  final num? doseMax;

  const ScheduleDto({
    this.dayIterator,
    this.alarmWindow,
    this.dayOffset,
    this.doseMin,
    this.doseMax,
  });

  factory ScheduleDto.fromJson(Map<String, dynamic> json) =>
      _$ScheduleDtoFromJson(json);
}

@JsonSerializable()
class MedicineDto {
  @JsonKey(name: "_id")
  final String? id;

  @JsonKey(name: "ampp_id")
  final String? amppId;

  @JsonKey(name: "ampp_name")
  final String? amppName;

  @JsonKey(name: "amp_id")
  final String? ampId;

  @JsonKey(name: "vmpp_id")
  final String? vmppId;

  @JsonKey(name: "discontinued_date")
  final String? discontinuedDate;

  @JsonKey(name: "pip_code")
  final String? pipCode;

  @JsonKey(name: "prescription_charges")
  final num? prescriptionCharges;

  @JsonKey(name: "nhs_price")
  final num? nhsPrice;

  @JsonKey(name: "nhs_price_date")
  final String? nhsPriceDate;

  @JsonKey(name: "gtin")
  final List<String>? gtin;

  @JsonKey(name: "start_date")
  final String? startDate;

  @JsonKey(name: "medicine_name")
  final String? medicineName;

  @JsonKey(name: "generic_name")
  final String? genericName;

  @JsonKey(name: "course_quantity")
  final num? courseQuantity;

  @JsonKey(name: "medicine_id")
  final String? medicineId;

  @JsonKey(name: "name")
  final String? name;

  @JsonKey(name: "controlled")
  final bool? isControlled;

  const MedicineDto({
    this.id,
    this.amppId,
    this.amppName,
    this.ampId,
    this.vmppId,
    this.discontinuedDate,
    this.pipCode,
    this.prescriptionCharges,
    this.nhsPrice,
    this.nhsPriceDate,
    this.gtin,
    this.startDate,
    this.medicineName,
    this.genericName,
    this.courseQuantity,
    this.medicineId,
    this.name,
    this.isControlled,
  });

  factory MedicineDto.fromJson(Map<String, dynamic> json) =>
      _$MedicineDtoFromJson(json);
}
