import 'package:equatable/equatable.dart';

import '../model/list_item.dart';

abstract class MedicationState extends Equatable {
  const MedicationState();

  @override
  List<Object> get props => [];
}

class InitialMedicationState extends MedicationState {}

class ErrorMedicationState extends MedicationState {}

class DataLoadedMedicationState extends MedicationState {
  final List<ListItem> items;

  const DataLoadedMedicationState({required this.items});

  @override
  List<Object> get props => [items];
}
