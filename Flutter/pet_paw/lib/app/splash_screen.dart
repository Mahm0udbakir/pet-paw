import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:petpaw/app/core/utils/constants/app_colors.dart';
import 'package:petpaw/app/core/utils/constants/images_strings.dart';
import 'package:petpaw/app/features/auth/controller/login/login_cubit.dart';

import 'features/auth/view/login/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int _currentIndex = 0;

  final String staticLogo = ImagesStrings.constPart;

  final List<String> animatedLogos = [
    ImagesStrings.appLogo,
    ImagesStrings.splash1Logo,
    ImagesStrings.splash2Logo,
    ImagesStrings.splash3Logo,
    ImagesStrings.splash4Logo,
  ];

  @override
  void initState() {
    super.initState();
    _startLogoAnimation();
  }

  void _startLogoAnimation() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (_currentIndex < animatedLogos.length - 1) {
        setState(() {
          _currentIndex++;
        });
      } else {
        timer.cancel();
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => BlocProvider(
              create: (context) => LoginCubit(),
              child: const LoginScreen(),
            ),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            SvgPicture.asset(
              staticLogo,
              width: 300,
              height: 300,
              fit: BoxFit.cover,
            ),
            AnimatedSwitcher(
              duration: Duration(milliseconds: 600),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return FadeTransition(opacity: animation, child: child);
              },
              child: SvgPicture.asset(
                animatedLogos[_currentIndex],
                key: ValueKey<int>(_currentIndex),
                width: 300,
                height: 300,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
