import 'package:flutter/foundation.dart';

import '../../network/model/remedies_dto.dart';
import '../model/remedy.dart';
import 'mapper_exception.dart';

class RemedyMapper {
  Remedy toRemedy(RemedyDto remedy) {
    try {
      return Remedy(
        remedyId: remedy.remedyId ?? '',
        dateCreatedTimestamp: remedy.dateCreated?.toInt(),
        isOngoing: remedy.isOngoing ?? false,
        medicineId: remedy.medicineId ?? '',
        medicineName: remedy.medicineName ?? '',
        medicineType: remedy.medicineType ?? '',
        repeatCycle: remedy.repeatCycle?.toInt() ?? 0,
        allowEdit: remedy.allowEdit ?? false,
        isCurrent: remedy.isCurrent ?? false,
        price: remedy.price?.toDouble() ?? 0.0,
        schedule: remedy.schedule
                ?.map(
                  (item) => Schedule(
                    dayIterator: item.dayIterator?.toInt() ?? 0,
                    alarmWindow: item.alarmWindow?.toInt() ?? 0,
                    doseMin: item.doseMin?.toInt() ?? 0,
                    doseMax: item.doseMax?.toInt() ?? 0,
                    dayOffset: item.dayOffset?.toInt(),
                  ),
                )
                .toList() ??
            [],
        patientId: remedy.patientId,
        startDateTimestamp: remedy.startDate?.toInt(),
        instruction: remedy.instruction,
        endDateTimestamp: remedy.endDate?.toInt(),
        medicine: remedy.medicine != null
            ? Medicine(
                ampId: remedy.medicine?.ampId ?? '',
                amppId: remedy.medicine?.amppId ?? '',
                amppName: remedy.medicine?.amppName ?? '',
                vmppId: remedy.medicine?.vmppId ?? '',
                prescriptionCharges:
                    remedy.medicine?.prescriptionCharges?.toDouble() ?? 0.0,
                nhsPrice: remedy.medicine?.nhsPrice?.toDouble() ?? 0.0,
                gtin: remedy.medicine?.gtin ?? [],
                medicineName: remedy.medicine?.medicineName ?? '',
                genericName: remedy.medicine?.genericName ?? '',
                courseQuantity: remedy.medicine?.courseQuantity?.toInt() ?? 0,
                medicineId: remedy.medicine?.medicineId ?? '',
                name: remedy.medicine?.name ?? '',
                isControlled: remedy.medicine?.isControlled ?? false,
                discontinuedDate: remedy.medicine?.discontinuedDate,
                pipCode: remedy.medicine?.pipCode,
                nhsPriceDate: remedy.medicine?.nhsPriceDate != null
                    ? DateTime.tryParse(remedy.medicine?.nhsPriceDate ?? '')
                    : null,
                startDate: remedy.medicine?.startDate != null
                    ? DateTime.tryParse(remedy.medicine?.startDate ?? '')
                    : null,
              )
            : null,
      );
    } catch (error) {
      debugPrint("Error mapping RemedyDto to Remedy object: $error");
      throw MapperException<RemedyDto, Remedy>(error.toString());
    }
  }
}
