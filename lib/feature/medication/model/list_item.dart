import 'package:equatable/equatable.dart';

import '../../../repository/model/adherence.dart';
import '../../../repository/model/remedy.dart';

abstract class ListItem extends Equatable {}

class RemedyListItem extends ListItem {
  final Remedy remedy;

  RemedyListItem(this.remedy);

  @override
  List<Object> get props => [remedy];
}

class AdherenceListItem extends ListItem {
  final Adherence adherence;

  AdherenceListItem(this.adherence);

  @override
  List<Object> get props => [adherence];
}

class SpacerItem extends ListItem {
  @override
  List<Object> get props => [];
}
