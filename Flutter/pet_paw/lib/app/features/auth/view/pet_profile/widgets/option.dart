import 'package:flutter/material.dart';

import '../../../../../core/utils/constants/app_colors.dart';

Widget buildOption(String value, BuildContext context, Function(String) onTap, bool isSelected) {
  return GestureDetector(
    onTap: () => onTap(value),
    child: AnimatedContainer(
      height: 56,
      duration: const Duration(milliseconds: 500),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: isSelected ? Colors.brown.shade400 : Colors.brown.shade100,
          width: isSelected ? 2 : 1,
        ),
      ),
      child: Row(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.brown.shade400, width: 2),
            ),
            child: isSelected
                ? Center(
                    child: Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.buttonMainColor,
                      ),
                    ),
                  )
                : SizedBox.shrink(),
          ),
          SizedBox(width: 8),
          Text(
            value,
            style: TextStyle(
              color: isSelected ? Colors.brown.shade800 : Colors.brown.shade300,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    ),
  );
}
