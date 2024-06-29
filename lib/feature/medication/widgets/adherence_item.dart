import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../model/list_item.dart';

class AdherenceItem extends StatelessWidget {
  final AdherenceListItem item;

  const AdherenceItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    String alarmTimeString = '';

    final dateFormat = DateFormat("yyyy-MM-dd HH:mm");

    if (item.adherence.alarmTime != null) {
      final alarmTime =
          DateTime.fromMillisecondsSinceEpoch(item.adherence.alarmTime! * 1000);
      alarmTimeString = dateFormat.format(alarmTime);
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          const Icon(Icons.alarm),
          const SizedBox(width: 8),
          Expanded(child: Text(alarmTimeString)),
        ],
      ),
    );
  }
}
