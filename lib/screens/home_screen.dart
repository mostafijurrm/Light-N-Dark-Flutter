import 'package:flutter/material.dart';
import 'package:lightdark/main.dart';
import 'package:lightdark/screens/profile_screen.dart';
import 'package:lightdark/widgets/change_theme_button_widget.dart';
import 'package:lightdark/widgets/navigationbar_widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    /*final text = MediaQuery.of(context).platformBrightness == Brightness.dark
        ? 'DarkTheme'
        : 'LightTheme';

    return Scaffold(
      appBar: AppBar(
        //backgroundColor: Colors.orange,
        title: Text(MyApp.title),
        actions: [
          ChangeThemeButtonWidget()
        ],
      ),
      body: Center(
        child: Text(
          'Hello $text!',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold
          ),

        ),
      ),
    );*/
    return Scaffold(
      appBar: AppBar(
        title: Text(MyApp.title),
        iconTheme: Theme.of(context).iconTheme,
        backgroundColor: Colors.transparent,
        leading: Icon(
          Icons.menu
        ),
        elevation: 0,
        actions: [
          ChangeThemeButtonWidget()
        ],
      ),
      body: ProfileScreen(),
      extendBody: true,
      bottomNavigationBar: NavigationBarWidget(),
    );
  }
}
