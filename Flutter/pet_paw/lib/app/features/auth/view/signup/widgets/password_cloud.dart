import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../model/validation_status_model.dart';

class ValidationPopoverIcon extends StatelessWidget {
  final ValidationStatus validation;
  final bool showBubble;

  const ValidationPopoverIcon({
    super.key,
    required this.validation,
    this.showBubble = true,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.topRight,
      children: [
        Icon(Icons.error, color: Colors.red),
        if (showBubble)
          Positioned(
            top: -170,
            right: -41,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // Bubble box
                Container(
                  width: 320.w,
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(26),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildPopoverCheck(
                        validation.hasMinLength,
                        'Must be at 8-20 characters.',
                      ),
                      _buildPopoverCheck(
                        validation.hasNumber,
                        'Must include at least 1 number.',
                      ),
                      _buildPopoverCheck(
                        validation.hasUpper,
                        'Must contain at least 1 uppercase letter.',
                      ),
                      _buildPopoverCheck(
                        validation.hasLower,
                        'Must contain at least 1 lowercase letter.',
                      ),
                      _buildPopoverCheck(
                        validation.hasSpecial,
                        'Must include at least 1 special character (e.g.!,@,#).',
                      ),
                    ],
                  ),
                ),
                Transform.translate(
                  offset: Offset(-38, -3),
                  child: CustomPaint(
                    size: Size(30, 40),
                    painter: TrianglePainter(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }

  Widget _buildPopoverCheck(bool condition, String text) {
    return Padding(
      padding: const EdgeInsets.all(2.8),
      child: Row(
        children: [
          Icon(
            condition ? Icons.check : Icons.close,
            color: condition ? Colors.green : Colors.red,
            size: 16,
          ),
          SizedBox(width: 8.w),
          Expanded(
            child: Text(
              text,
              style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w300),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

class TrianglePainter extends CustomPainter {
  final Color color;

  TrianglePainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final Path path = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width / 2, size.height)
      ..lineTo(size.width, 0)
      ..close();

    canvas.drawShadow(path, Colors.black38, 16, true);

    final Paint paint = Paint()..color = color;
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
