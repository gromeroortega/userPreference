import 'package:flutter/material.dart';
import 'package:user_preference/src/pages/widgets/drawer_menu.dart';
import 'package:user_preference/src/shere_prefs/user_preference.dart';

class HomePage extends StatelessWidget {
  static final String routeName = 'home';
  final pref = new UserPreferences();

  @override
  Widget build(BuildContext context) {
    pref.lastPage = HomePage.routeName;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: (pref.secondColor) ? Colors.teal : Colors.blue,
        title: Text('Home'),
      ),
      drawer: DrawerMenu(),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'Color secundario: ${pref.secondColor}',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: (pref.secondColor) ? Colors.teal : Colors.blue),
            ),
            Divider(),
            Text('Género: ${pref.genere}'),
            Divider(),
            Text('Nombre de usuario: ${pref.name}'),
            Divider(),
          ]),
    );
  }
}
