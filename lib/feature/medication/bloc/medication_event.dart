import 'package:equatable/equatable.dart';

abstract class MedicationEvent extends Equatable {
  const MedicationEvent();

  @override
  List<Object> get props => [];
}

class LoadMedicationScreen extends MedicationEvent {}
