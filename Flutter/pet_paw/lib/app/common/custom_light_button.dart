import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../core/utils/constants/app_colors.dart';
import '../core/utils/helpers/helper_functions.dart';

class CustomLightButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;

  const CustomLightButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = HelperFunctions.isDarkMode(context);
    return SizedBox(
      height: 45.h,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 10.h),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
            side: BorderSide(
              color: isDark
                  ? Color(0xffBDBDBD)
                  : Color(0xff30200D).withValues(alpha: 0.6),
              width: 1.w,
            ),
          ),
        ),
        onPressed: isLoading ? null : onPressed,
        child: isLoading
            ? SizedBox(
                height: 20.h,
                width: 20.w,
                child: CircularProgressIndicator(
                  strokeWidth: 2.w,
                  color: Colors.white,
                ),
              )
            : Text(
                text,
                style: TextStyle(
                  color: isDark
                      ? Color(0xffBDBDBD)
                      : Color(0xff30200D).withValues(alpha: 0.9),
                  fontWeight: FontWeight.w600,
                  fontSize: 16.sp,
                  fontFamily: 'Poppins',
                ),
              ),
      ),
    );
  }
}
