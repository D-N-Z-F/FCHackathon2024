import 'package:fc_hackathon_2024/data/model/shift.dart';
import 'package:fc_hackathon_2024/data/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ShiftAlertDialog extends ConsumerWidget {
  const ShiftAlertDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final shifts = ref.watch(shiftsProvider);
    return AlertDialog(
      title: const Text(
        "Shifts Available",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      content: SingleChildScrollView(
        child: Column(
          children: shifts
              .map(
                (shift) => CheckboxListTile(
                  title: Text(shift.duration),
                  value: shift.isSelected,
                  onChanged: (value) {
                    final newShift = shift.copy(isSelected: value!);
                    List<Shift> newShifts = [];
                    for (var shift in shifts) {
                      newShifts.add(shift.duration == newShift.duration
                          ? newShift
                          : shift);
                    }
                    ref.read(shiftsProvider.notifier).state = newShifts;
                  },
                ),
              )
              .toList(),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text("Close"),
        ),
      ],
    );
  }
}
