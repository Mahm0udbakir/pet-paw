import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petpaw/app/core/utils/constants/app_colors.dart';
import 'package:petpaw/app/core/utils/constants/images_strings.dart';
import 'package:petpaw/app/features/auth/controller/login/login_cubit.dart';
import 'package:petpaw/app/features/auth/view/login/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int _currentIndex = 0;

  final List<String> animatedLogos = [
    ImagesStrings.appLogo,
    ImagesStrings.splash1Logo,
    ImagesStrings.splash2Logo,
    ImagesStrings.splash3Logo,
    ImagesStrings.splash4Logo,
  ];

  final String staticLogo = ImagesStrings.constPart;

  @override
  void initState() {
    super.initState();
    _preloadSvg().then((_) => _startAnimation());
  }

  Future<void> _preloadSvg() async {
    final allLogos = [...animatedLogos, staticLogo];
    for (var path in allLogos) {
      final loader = SvgAssetLoader(path);
      await svg.cache.putIfAbsent(
        loader.cacheKey(null),
        () => loader.loadBytes(null),
      );
    }
  }

  Future<void> _startAnimation() async {
    for (int i = 1; i < animatedLogos.length; i++) {
      await Future.delayed(const Duration(milliseconds: 800));
      if (!mounted) return;
      setState(() => _currentIndex = i);
    }

    await Future.delayed(const Duration(milliseconds: 1000));

    if (mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => LoginCubit(),
            child: const LoginScreen(),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.splashBackground,
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            SvgPicture.asset(staticLogo, width: 300, height: 300),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 600),
              transitionBuilder: (c, a) => FadeTransition(opacity: a, child: c),
              child: SvgPicture.asset(
                animatedLogos[_currentIndex],
                key: ValueKey(_currentIndex),
                width: 300,
                height: 300,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
