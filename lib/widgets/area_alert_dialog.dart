import 'package:fc_hackathon_2024/data/model/area.dart';
import 'package:fc_hackathon_2024/data/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multi_dropdown/multi_dropdown.dart';

class AreaAlertDialog extends ConsumerWidget {
  const AreaAlertDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final areas = ref.watch(areasProvider);
    final selectedAreas = ref.watch(selectedAreasProvider);
    final areaController = MultiSelectController<Area>();
    bool recursionFlag = false;
    return AlertDialog(
      title: const Text(
        "Areas Available",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      content: SingleChildScrollView(
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset('assets/images/areas.jpg'),
            ),
            const SizedBox(
              height: 10,
            ),
            MultiDropdown<Area>(
              controller: areaController,
              items: areas
                  .map(
                    (area) => DropdownItem(
                      label: area.code,
                      value: area,
                      disabled:
                          (areas.where((area) => area.isSelected).length == 3 &&
                                  !areas[areas.indexOf(area)].isSelected) ||
                              selectedAreas.length == 3 &&
                                  !selectedAreas.contains(area),
                      selected: areas[areas.indexOf(area)].isSelected ||
                          selectedAreas.contains(area),
                    ),
                  )
                  .toList(),
              enabled: true,
              fieldDecoration: const FieldDecoration(
                hintText: 'Select Areas',
                borderRadius: 10.0,
              ),
              chipDecoration: const ChipDecoration(
                backgroundColor: Colors.orange,
                runSpacing: 2,
                spacing: 5,
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              dropdownDecoration: const DropdownDecoration(
                maxHeight: 300,
                header: Padding(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    'Select areas (Max 3)',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              dropdownItemDecoration: const DropdownItemDecoration(
                selectedIcon:
                    Icon(Icons.check_box_rounded, color: Colors.green),
              ),
              onSelectionChange: (selectedItems) {
                if (!recursionFlag) {
                  recursionFlag = true;
                  final newSelectedAreas = List<Area>.from(selectedItems);
                  ref.read(selectedAreasProvider.notifier).state =
                      newSelectedAreas;
                  recursionFlag = false;
                }
                areaController.closeDropdown();
              },
            )
          ],
        ),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () {
                List<Area> newAreas = [];
                for (var area in areas) {
                  newAreas.add(
                    area.copy(isSelected: selectedAreas.contains(area)),
                  );
                }
                ref.read(areasProvider.notifier).state = newAreas;
                Navigator.of(context).pop();
              },
              child: const Text("Apply"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Close"),
            ),
          ],
        ),
      ],
    );
  }
}
