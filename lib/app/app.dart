import 'package:flutter/material.dart';
import 'package:kykey/app/pages/dashboard/dashboard.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: MaterialColor(
          0xFFff7857,
          {
            50: const Color(0xFFff7857).withOpacity(.9),
            100: const Color(0xFFff7857).withOpacity(.8),
            200: const Color(0xFFff7857).withOpacity(.7),
            300: const Color(0xFFff7857).withOpacity(.6),
            400: const Color(0xFFff7857).withOpacity(.5),
            500: const Color(0xFFff7857).withOpacity(.4),
            600: const Color(0xFFff7857).withOpacity(.3),
            700: const Color(0xFFff7857).withOpacity(.2),
            800: const Color(0xFFff7857).withOpacity(.1),
            900: const Color(0xFFff7857).withOpacity(.1),
          },
        ),
        appBarTheme: const AppBarTheme(
          color:  Color(0xFFff7857),
          elevation: 0,
        ),
        colorScheme: Theme.of(context).colorScheme.copyWith(
              secondary: const Color(0xFF0122a9),
            ),
        sliderTheme: SliderThemeData(
          activeTrackColor: const Color(0xFFff7857),
          inactiveTrackColor: const Color(0xFFff7857).withOpacity(.1),
          thumbColor: const Color(0xFFff7857),
          overlayColor: const Color(0xFFff7857).withOpacity(.1),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder()
        )
      ),
      home: const Dashboard(),
    );
  }
}
