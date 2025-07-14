import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class Loaders {
  static void hideSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
  }

  static void customToast({
    required BuildContext context,
    required String message,
    IconData? icon,
    Color? backgroundColor,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final color =
        backgroundColor ??
        (isDark
            ? Colors.grey[800]!.withOpacity(0.9)
            : Colors.grey[200]!.withOpacity(0.9));

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        elevation: 0,
        duration: const Duration(seconds: 3),
        backgroundColor: Colors.transparent,
        behavior: SnackBarBehavior.floating,
        padding: EdgeInsets.zero,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        content: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: color,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                spreadRadius: 1,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (icon != null) ...[
                Icon(
                  icon,
                  size: 22,
                  color: isDark ? Colors.white : Colors.black87,
                ),
                const SizedBox(width: 12),
              ],
              Flexible(
                child: Text(
                  message,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: isDark ? Colors.white : Colors.black87,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static void successSnackBar({
    required BuildContext context,
    required String title,
    String message = '',
    int duration = 3,
  }) {
    _showStyledSnackBar(
      context: context,
      title: title,
      message: message,
      backgroundColor: Colors.green[600]!,
      icon: Iconsax.tick_circle,
      duration: duration,
    );
  }

  static void warningSnackBar({
    required BuildContext context,
    required String title,
    String message = '',
    int duration = 3,
  }) {
    _showStyledSnackBar(
      context: context,
      title: title,
      message: message,
      backgroundColor: Colors.orange[600]!,
      icon: Iconsax.warning_2,
      duration: duration,
    );
  }

  static void errorSnackBar({
    required BuildContext context,
    required String title,
    String message = '',
    int duration = 3,
  }) {
    _showStyledSnackBar(
      context: context,
      title: title,
      message: message,
      backgroundColor: Colors.red[600]!,
      icon: Iconsax.danger,
      duration: duration,
    );
  }

  static void infoSnackBar({
    required BuildContext context,
    required String title,
    String message = '',
    int duration = 3,
  }) {
    _showStyledSnackBar(
      context: context,
      title: title,
      message: message,
      backgroundColor: Colors.blue[600]!,
      icon: Iconsax.info_circle,
      duration: duration,
    );
  }

  static void _showStyledSnackBar({
    required BuildContext context,
    required String title,
    required String message,
    required Color backgroundColor,
    required IconData icon,
    int duration = 5,
  }) {
    final theme = Theme.of(context);
    final scaffoldMessenger = ScaffoldMessenger.of(context);

    final snackBar = SnackBar(
      duration: Duration(seconds: duration),
      backgroundColor: Colors.transparent,
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.all(16),
      padding: EdgeInsets.zero,
      content: TweenAnimationBuilder<double>(
        tween: Tween(begin: 0.0, end: 1.0),
        duration: const Duration(milliseconds: 600),
        curve: Curves.fastEaseInToSlowEaseOut,
        builder: (context, value, child) {
          double opacity = value < 0.2 ? value * 5 : 1.0;

          return Transform.translate(
            offset: Offset(0, 40 * (1 - value)),
            child: Opacity(
              opacity: opacity,
              child: Transform.scale(
                scale: 0.95 + (0.05 * value),
                child: child,
              ),
            ),
          );
        },
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(16),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    backgroundColor.withOpacity(0.9),
                    backgroundColor.withOpacity(0.7),
                  ],
                ),
                boxShadow: [
                  BoxShadow(
                    color: backgroundColor.withOpacity(0.3),
                    blurRadius: 20,
                    spreadRadius: 2,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white.withOpacity(0.2),
                    ),
                    child: ShaderMask(
                      shaderCallback: (Rect bounds) {
                        return LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.white.withOpacity(0.8), Colors.white],
                        ).createShader(bounds);
                      },
                      child: Icon(icon, size: 24, color: Colors.white),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: theme.textTheme.titleSmall?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.2,
                          ),
                        ),
                        if (message.isNotEmpty)
                          Padding(
                            padding: const EdgeInsets.only(top: 4),
                            child: Text(
                              message,
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: Colors.white.withOpacity(0.9),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  IconButton(
                    icon: const Icon(
                      Icons.close,
                      size: 18,
                      color: Colors.white,
                    ),
                    onPressed: () => scaffoldMessenger.hideCurrentSnackBar(),
                    splashRadius: 16,
                    padding: EdgeInsets.zero,
                  ),
                ],
              ),
            ),

            // Progress indicator
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
                child: TweenAnimationBuilder<double>(
                  tween: Tween(begin: 1.0, end: 0.0),
                  duration: Duration(seconds: duration),
                  curve: Curves.linear,
                  builder: (context, value, child) => LinearProgressIndicator(
                    value: value,
                    backgroundColor: Colors.transparent,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Colors.white.withOpacity(0.9),
                    ),
                    minHeight: 4,
                  ),
                ),
              ),
            ),

            // Shine effect
            Positioned(
              top: -10,
              left: -10,
              child: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withOpacity(0.1),
                ),
              ),
            ),
          ],
        ),
      ),
    );

    scaffoldMessenger.showSnackBar(snackBar);
  }
}
