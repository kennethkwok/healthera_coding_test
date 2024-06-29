class Remedy {
  final String remedyId;
  final String? patientId;
  final int? dateCreatedTimestamp;
  final bool isOngoing;
  final int? startDateTimestamp;
  final String medicineId;
  final String? instruction;
  final String medicineName;
  final String medicineType;
  final int? endDateTimestamp;
  final int repeatCycle;
  final bool allowEdit;
  final bool isCurrent;
  final double price;
  final Medicine? medicine;
  final List<Schedule> schedule;

  const Remedy({
    required this.remedyId,
    this.patientId,
    required this.dateCreatedTimestamp,
    required this.isOngoing,
    this.startDateTimestamp,
    required this.medicineId,
    this.instruction,
    required this.medicineName,
    required this.medicineType,
    this.endDateTimestamp,
    required this.repeatCycle,
    required this.allowEdit,
    required this.isCurrent,
    required this.price,
    this.medicine,
    required this.schedule,
  });
}

class Schedule {
  final int dayIterator;
  final int alarmWindow;
  final int? dayOffset;
  final int doseMin;
  final int doseMax;

  const Schedule({
    required this.dayIterator,
    required this.alarmWindow,
    this.dayOffset,
    required this.doseMin,
    required this.doseMax,
  });
}

class Medicine {
  final String amppId;
  final String amppName;
  final String ampId;
  final String vmppId;
  final String? discontinuedDate;
  final String? pipCode;
  final double prescriptionCharges;
  final double nhsPrice;
  final DateTime? nhsPriceDate;
  final List<String> gtin;
  final DateTime? startDate;
  final String medicineName;
  final String genericName;
  final int courseQuantity;
  final String medicineId;
  final String name;
  final bool isControlled;

  const Medicine({
    required this.ampId,
    required this.amppId,
    required this.amppName,
    required this.vmppId,
    this.discontinuedDate,
    this.pipCode,
    required this.prescriptionCharges,
    required this.nhsPrice,
    this.nhsPriceDate,
    required this.gtin,
    this.startDate,
    required this.medicineName,
    required this.genericName,
    required this.courseQuantity,
    required this.medicineId,
    required this.name,
    required this.isControlled,
  });
}
