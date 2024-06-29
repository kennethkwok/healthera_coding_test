class Adherence {
  final String adherenceId;
  final String? patientId;
  final String remedyId;
  final int? alarmTime;
  final String? action;
  final int? doseQuantity;

  Adherence({
    required this.adherenceId,
    required this.remedyId,
    this.patientId,
    this.alarmTime,
    this.action,
    this.doseQuantity,
  });
}
