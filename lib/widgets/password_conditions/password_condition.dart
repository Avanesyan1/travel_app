import 'package:flutter/material.dart';
import 'package:travel_app/global/const.dart';

class PasswordCondition extends StatelessWidget {
  final bool conditionMet;
  final String condition;

  const PasswordCondition({super.key, required this.conditionMet, required this.condition});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8, top: 10, bottom: 10),
          child: conditionMet
              ? const Icon(Icons.check, color: Colors.green)
              : const Icon(Icons.close, color: Colors.red),
        ),
        const SizedBox(width: 10),
        Text(condition, style: bf16w4),
      ],
    );
  }
}
