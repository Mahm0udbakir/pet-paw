import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FinishDialog extends StatelessWidget {
  const FinishDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.zero,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32.r)),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: 0,
          maxHeight: MediaQuery.of(context).size.height * 0.85,
        ),
        child: Padding(padding: EdgeInsets.all(24)),
      ),
    );
  }
}
