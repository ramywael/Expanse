import 'package:flutter/material.dart';

import 'expanse_screen.dart';

void main() {
  runApp(const ExpanseApp());
}
var colorScheme = ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 59, 96, 179));
var darkColorScheme = ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 59, 96, 179));

class ExpanseApp extends StatelessWidget {
  const ExpanseApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      theme: ThemeData().copyWith(
        useMaterial3: true,
        colorScheme: colorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: colorScheme.onPrimaryContainer,
          foregroundColor: colorScheme.primary,
        ),
        cardTheme: const CardTheme().copyWith(
          color: colorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 16
          )
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: colorScheme.primaryContainer,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8))
            )
          )
        ),
        textTheme: ThemeData().textTheme.copyWith(
          titleLarge: TextStyle(
            color: colorScheme.onSecondaryContainer,
            fontWeight: FontWeight.normal,
            fontSize: 17,
          )
        )
      ),

      darkTheme : ThemeData.dark().copyWith(
          useMaterial3: true,
          colorScheme: colorScheme,
          appBarTheme: const AppBarTheme().copyWith(
            backgroundColor: darkColorScheme.onPrimaryContainer,
            foregroundColor: darkColorScheme.primary,
          ),
          cardTheme: const CardTheme().copyWith(
              color: darkColorScheme.secondaryContainer,
              margin: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 16
              )
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                  backgroundColor: darkColorScheme.primaryContainer,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8))
                  )
              )
          ),
          textTheme: ThemeData().textTheme.copyWith(
              titleLarge: TextStyle(
                color: darkColorScheme.onSecondaryContainer,
                fontWeight: FontWeight.normal,
                fontSize: 17,
              )
          ),
        bottomSheetTheme:  BottomSheetThemeData(
          showDragHandle: true,
          backgroundColor: darkColorScheme.primaryContainer,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(16)
            )
          )
        ),
      ),

      home: const Expanses(),
    );
  }
}
