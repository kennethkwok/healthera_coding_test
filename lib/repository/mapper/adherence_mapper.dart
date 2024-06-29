import 'package:flutter/material.dart';

import '../../network/model/adherences_dto.dart';
import '../model/adherence.dart';
import 'mapper_exception.dart';

class AdherenceMapper {
  Adherence toAdherence(AdherenceDto adherence) {
    try {
      return Adherence(
        adherenceId: adherence.adherenceId ?? '',
        remedyId: adherence.remedyId ?? '',
        patientId: adherence.patientId,
        alarmTime: adherence.alarmTime?.toInt(),
        action: adherence.action,
        doseQuantity: adherence.doseQuantity?.toInt(),
      );
    } catch (error) {
      debugPrint("Error mapping AdherenceDto to Adherence object: $error");
      throw MapperException<AdherenceDto, Adherence>(error.toString());
    }
  }
}
