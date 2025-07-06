import 'package:flutter/material.dart';
import 'package:petpaw/app/common/custom_label.dart';

import 'option.dart';

class SelectableOptionsRow extends StatelessWidget {
  final List<String> options;
  final Function(String) onSelect;
  final bool haveLabel;
  final String label;
  final String? selectedValue;

  const SelectableOptionsRow({
    super.key,
    required this.options,
    required this.onSelect,
    required this.selectedValue,
    this.haveLabel = false,
    this.label = '',
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (haveLabel) customLabel(label, context),
        const SizedBox(height: 5),
        Row(
          children: options
              .map(
                (option) =>
                    Expanded(child: buildOption(option, context, onSelect , selectedValue == option,)),
              )
              .toList(),
        ),
      ],
    );
  }
}
