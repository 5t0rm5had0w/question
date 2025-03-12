import 'package:flutter/material.dart';
import 'package:garant_project/provider/providers.dart';
import 'package:garant_project/screen/main_screen.dart';
import 'package:provider/provider.dart';

import 'utils/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Providers>(create: (_) {
          return Providers();
        })
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          useMaterial3: false,
          colorScheme: ColorScheme.fromSwatch().copyWith(secondary: colorPrimary),
          primaryColor: colorPrimary,
          primaryColorDark: colorPrimaryDark,
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              elevation: 0,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
          ),
        ),
        debugShowCheckedModeBanner: false,
        home: MainScreen(),
      ),
    );
  }
}
