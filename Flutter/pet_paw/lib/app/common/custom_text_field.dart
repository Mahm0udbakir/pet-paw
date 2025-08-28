import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:petpaw/app/common/custom_label.dart';
import 'package:petpaw/app/core/utils/constants/app_colors.dart';
import 'package:petpaw/app/core/utils/helpers/helper_functions.dart';

class CustomTextField extends StatefulWidget {
  final String title;
  final String hintText;
  final Widget icon;
  final TextInputType? keyboardType;
  final bool obscure;
  final bool enabled;
  final bool titleBool;
  final bool filled;
  final bool readOnly;
  final Color fillColor;
  final Widget? suffixIcon;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final int maxLines;
  final int minLines;
  final Function(String)? onChanged;
  final VoidCallback? onEditingComplete;
  final FocusNode currentFocusNode;
  final FocusNode? nextFocusNode;
  final bool isLast;
  final VoidCallback? onSubmit;
  final List<TextInputFormatter>? inputFormatters;

  const CustomTextField({
    super.key,
    required this.title,
    required this.hintText,
    required this.icon,
    this.keyboardType,
    required this.controller,
    this.validator,
    this.fillColor = Colors.white,
    this.obscure = false,
    this.enabled = false,
    this.titleBool = true,
    this.filled = false,
    this.readOnly = false,
    this.suffixIcon,
    this.maxLines = 1,
    this.minLines = 1,
    this.onChanged,
    this.onEditingComplete,
    required this.currentFocusNode,
    this.nextFocusNode,
    this.isLast = false,
    this.onSubmit,
    this.inputFormatters,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool _isObscure;
  late bool _titleBool;

  @override
  void initState() {
    super.initState();
    _isObscure = widget.obscure;
    _titleBool = widget.titleBool;
  }

  @override
  Widget build(BuildContext context) {
    final isDark = HelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _titleBool == true
            ? customLabel(widget.title, context)
            : SizedBox.shrink(),
        SizedBox(height: 8.h),
        TextFormField(
          maxLines: widget.maxLines,
          minLines: widget.minLines,
          readOnly: widget.readOnly,
          controller: widget.controller,
          validator: widget.validator,
          keyboardType: widget.keyboardType,
          obscureText: _isObscure,
          onChanged: widget.onChanged,
          textInputAction: widget.isLast
              ? TextInputAction.done
              : TextInputAction.next,
          inputFormatters: widget.inputFormatters,
          onFieldSubmitted: (_) {
            if (widget.isLast) {
              widget.onSubmit?.call();
            } else {
              FocusScope.of(context).requestFocus(widget.nextFocusNode);
            }
          },
          onEditingComplete: widget.onEditingComplete,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontSize: 14.sp,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
            color: isDark
                ? Colors.white
                : AppColors.iconColor.withValues(alpha: 0.6),
          ),
          decoration: InputDecoration(
            filled: true,
            fillColor: Color(0xff000000).withValues(alpha: 0.05),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            prefixIcon: Padding(
              padding: const EdgeInsets.all(12.0),
              child: widget.icon,
            ),
            suffixIcon: widget.obscure
                ? IconButton(
                    onPressed: () => setState(() => _isObscure = !_isObscure),
                    icon: Icon(
                      _isObscure ? Icons.visibility : Icons.visibility_off,
                      color: isDark
                          ? AppColors.iconColor
                          : AppColors.iconColor.withValues(alpha: 0.6),
                    ),
                  )
                : widget.suffixIcon,
            hintText: widget.hintText,
            hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontSize: 14.sp,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
              color: isDark
                  ? Colors.white
                  : AppColors.iconColor.withValues(alpha: 0.6),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: Colors.transparent),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: Colors.transparent),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: Colors.transparent, width: 1.2.w),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: Colors.red.shade300, width: 1.2.w),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: Colors.transparent, width: 1.2.w),
            ),
          ),
        ),
      ],
    );
  }
}
