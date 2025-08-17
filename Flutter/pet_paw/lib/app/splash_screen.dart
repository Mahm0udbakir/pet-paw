import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petpaw/app/core/utils/constants/app_colors.dart';
import 'package:petpaw/app/core/utils/constants/images_strings.dart';
import 'package:petpaw/app/features/onboarding_and_getstarted/controller/on_boarding_cubit.dart';

import 'features/onboarding_and_getstarted/view/onboarding/onboarding_screen.dart';

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
            create: (_) => OnBoardingCubit()..initO(),
            child: const OnboardingScreen(),
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

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:petpaw/app/core/utils/constants/images_strings.dart';
//
// import 'features/onboarding_and_getstarted/controller/on_boarding_cubit.dart';
// import 'features/onboarding_and_getstarted/view/onboarding/onboarding_screen.dart';
//
// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});
//
//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }
//
// class _SplashScreenState extends State<SplashScreen>
//     with TickerProviderStateMixin {
//   late AnimationController _logoController;
//   late Animation<double> _logoScale;
//   late Animation<double> _logoOpacity;
//
//   @override
//   void initState() {
//     super.initState();
//
//     _logoController = AnimationController(
//       vsync: this,
//       duration: const Duration(seconds: 2),
//     );
//
//     _logoScale = Tween<double>(begin: 0.8, end: 1.0).animate(
//       CurvedAnimation(parent: _logoController, curve: Curves.easeOutBack),
//     );
//
//     _logoOpacity = Tween<double>(
//       begin: 0,
//       end: 1,
//     ).animate(CurvedAnimation(parent: _logoController, curve: Curves.bounceIn));
//
//     _logoController.forward();
//
//     Future.delayed(const Duration(seconds: 5), () {
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(
//           builder: (_) => BlocProvider(
//             create: (_) => OnBoardingCubit()..initO(),
//             child: const OnboardingScreen(),
//           ),
//         ),
//       );
//     });
//   }
//
//   @override
//   void dispose() {
//     _logoController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           Container(
//             decoration: const BoxDecoration(
//               gradient: LinearGradient(
//                 begin: Alignment.topCenter,
//                 end: Alignment.bottomCenter,
//                 colors: [Color(0xffFCC9AD), Color(0xffE35E21)],
//               ),
//             ),
//           ),
//           Stack(
//             children: [
//               Positioned(
//                 top: -135,
//                 right: -135,
//                 child: SlideTransition(
//                   position:
//                       Tween<Offset>(
//                         begin: const Offset(0.5, -0.5),
//                         end: Offset.zero,
//                       ).animate(
//                         CurvedAnimation(
//                           parent: _logoController,
//                           curve: Curves.easeOut,
//                         ),
//                       ),
//                   child: Container(
//                     width: 270,
//                     height: 270,
//                     decoration: BoxDecoration(
//                       color: const Color(0xffF09E60).withValues(alpha: 0.1),
//                       shape: BoxShape.circle,
//                     ),
//                   ),
//                 ),
//               ),
//
//               Align(
//                 alignment: Alignment(0, -0.2),
//                 child: ScaleTransition(
//                   scale: _logoScale,
//                   child: FadeTransition(
//                     opacity: _logoOpacity,
//                     child: SvgPicture.asset(
//                       ImagesStrings.newSplash,
//                       width: 200,
//                     ),
//                   ),
//                 ),
//               ),
//
//               Positioned(
//                 bottom: -135,
//                 left: -135,
//                 child: SlideTransition(
//                   position:
//                       Tween<Offset>(
//                         begin: const Offset(-0.5, 0.5),
//                         end: Offset.zero,
//                       ).animate(
//                         CurvedAnimation(
//                           parent: _logoController,
//                           curve: Curves.easeOut,
//                         ),
//                       ),
//                   child: Container(
//                     width: 270,
//                     height: 270,
//                     decoration: BoxDecoration(
//                       color: const Color(0xffF09E60).withValues(alpha: 0.1),
//                       shape: BoxShape.circle,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
