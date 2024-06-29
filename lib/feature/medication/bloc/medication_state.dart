import 'package:equatable/equatable.dart';

import '../../../repository/model/adherence.dart';
import '../../../repository/model/remedy.dart';

abstract class MedicationState extends Equatable {
  const MedicationState();

  @override
  List<Object> get props => [];
}

class InitialMedicationState extends MedicationState {}

class ErrorMedicationState extends MedicationState {}

class DataLoadedMedicationState extends MedicationState {
  final Map<Remedy, List<Adherence>> remedyMap;

  const DataLoadedMedicationState({required this.remedyMap});

  @override
  List<Object> get props => [remedyMap];
}
