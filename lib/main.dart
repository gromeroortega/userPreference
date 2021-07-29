import 'package:flutter/material.dart';
import 'package:user_preference/src/pages/home_page.dart';
import 'package:user_preference/src/settings_page.dart';
import 'package:user_preference/src/shere_prefs/user_preference.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final pref = new UserPreferences();
  await pref.initPrefs();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override //Palabra reservada para sobre escribir clases.

  Widget build(BuildContext context) {
    //Se seobre escribe el constructor que retorna MaterialApp (Diseños de Material)
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'User Preferences',
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName: (BuildContext context) => HomePage(),
        SettingsPage.routeName: (BuildContext context) => SettingsPage(),
      },
    );
  }
}
