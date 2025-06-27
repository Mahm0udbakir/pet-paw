import 'package:flutter/material.dart';
import 'package:petpaw/app/core/utils/constants/app_colors.dart';

class CustomTextField extends StatefulWidget {
  final String title;
  final String hintText;
  final IconData icon;
  final TextInputType keyboardType;
  final bool obscure;
  final bool enabled;
  final bool titleBool;
  final bool filled;
  final Color fillColor;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  const CustomTextField({
    super.key,
    required this.title,
    required this.hintText,
    required this.icon,
    required this.keyboardType,
    required this.controller,
    required this.validator,
    this.fillColor = Colors.white,
    this.obscure = false,
    this.enabled = false,
    this.titleBool = true,
    this.filled = false,
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _titleBool == true
            ? Text(
                widget.title,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.greyColor,
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
              )
            : SizedBox.shrink(),
        SizedBox(height: 5),
        TextFormField(
          controller: widget.controller,
          validator: widget.validator,
          keyboardType: widget.keyboardType,
          obscureText: _isObscure,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontSize: 16,
            color: Colors.brown.shade500,
            fontWeight: FontWeight.w500,
          ),
          decoration: InputDecoration(
            filled: true,
            fillColor: widget.enabled
                ? Colors.white
                : Colors.white.withOpacity(0.5),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 14,
            ),
            prefixIcon: Icon(widget.icon, color: AppColors.iconColor),
            suffixIcon: widget.obscure
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        _isObscure = !_isObscure;
                      });
                    },
                    icon: Icon(
                      _isObscure
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      color: AppColors.iconColor,
                    ),
                  )
                : null,
            hintText: widget.hintText,
            hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: AppColors.iconColor,
              fontWeight: FontWeight.w400,
              fontSize: 16,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(40),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(40),
              borderSide: BorderSide(color: Colors.brown.shade100, width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(40),
              borderSide: BorderSide(color: Colors.brown.shade200, width: 1.2),
            ),
          ),
        ),
      ],
    );
  }
}
