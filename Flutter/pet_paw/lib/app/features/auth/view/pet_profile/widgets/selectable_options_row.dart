import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:petpaw/app/common/custom_label.dart';

import 'option.dart';

class SelectableOptionsRow extends FormField<String> {
  SelectableOptionsRow({
    super.key,
    required List<String> options,
    required String? selectedValue,
    required Function(String) onSelect,
    bool haveLabel = false,
    String label = '',
    super.validator,
  }) : super(
         initialValue: selectedValue,
         builder: (FormFieldState<String> state) {
           return Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               if (haveLabel) customLabel(label, state.context),
               SizedBox(height: 16.h),
               Row(
                 children: options
                     .map(
                       (option) => Expanded(
                         child: buildOption(option, state.context, (val) {
                           state.didChange(val);
                           onSelect(val);
                         }, state.value == option),
                       ),
                     )
                     .toList(),
               ),
               if (state.hasError)
                 Padding(
                   padding: EdgeInsets.only(top: 8.h),
                   child: Text(
                     state.errorText ?? '',
                     style: TextStyle(color: Colors.red, fontSize: 12.sp),
                   ),
                 ),
             ],
           );
         },
       );
}
