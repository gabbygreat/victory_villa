import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:victory_villa/screen/home_screen/home_screen.dart';
import 'package:victory_villa/utils/colors.dart';
import 'package:victory_villa/utils/constants.dart';

void main() async{
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      gestures: const [
        GestureType.onTap,
        GestureType.onVerticalDragStart,
        GestureType.onVerticalDragDown,
      ],
      child: MaterialApp(
        title: VictoryConstants.name,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.white,
            elevation: 0,
            iconTheme: IconThemeData(
              color: VictoryColor.white,
            ),
          ),
          primaryColor: VictoryColor.primaryColor,
          colorScheme: ThemeData().colorScheme.copyWith(
                primary: VictoryColor.primaryColor,
              ),
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
