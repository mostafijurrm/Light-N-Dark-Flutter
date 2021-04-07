import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lightdark/provider/theme_provider.dart';
import 'package:lightdark/screens/home_screen.dart';
import 'package:provider/provider.dart';

Future main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static const String title = 'Light N Dark Example';

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
    create: (context) => ThemeProvider(),
    builder: (context, _) {
      final themeProvider = Provider.of<ThemeProvider>(context);

      return MaterialApp(
        title: title,
        themeMode: themeProvider.themeMode,
        theme: MyThemes.lightTheme,
        darkTheme: MyThemes.darkTheme,
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      );
    },
  );
}
