import 'package:flutter/material.dart';

import '../model/list_item.dart';

class RemedyItem extends StatelessWidget {
  final RemedyListItem item;

  const RemedyItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              const Icon(Icons.medication),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  item.remedy.medicineName,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
            ],
          ),
          if (item.remedy.medicine?.genericName != null)
            Text(
              item.remedy.medicine?.genericName ?? '',
              style: Theme.of(context).textTheme.titleSmall,
            ),
          const SizedBox(height: 8),
          Text(item.remedy.instruction ?? ''),
        ],
      ),
    );
  }
}
