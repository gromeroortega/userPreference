//Paquete para grabar información en el teléfono (android SharedPreferences, IOS NSUserDefaults)
import 'package:flutter/material.dart';
import 'package:user_preference/src/pages/widgets/drawer_menu.dart';
import 'package:user_preference/src/shere_prefs/user_preference.dart';

//Clase Statefull para el manejo de los estados
class SettingsPage extends StatefulWidget {
  static final String routeName = 'settings';

  @override
  // Inicialización del estado
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  dynamic _secondColor = false;
  dynamic _genere;
  dynamic _name = '';

// NOTA: Para usuo correcto del Null Safety
  late TextEditingController? _textController;
  final prefs = new UserPreferences();

//Aquí se dispara el init state de statefullWidget
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    prefs.lastPage = SettingsPage.routeName;
    _genere = prefs.genere;
    _secondColor = prefs.secondColor;
    _name = prefs.name;

    //Instancia del controller para edición de texto en el textField.
    _textController = new TextEditingController(text: prefs.name);
  }

// Método para almacenar las preferencias del Género.
  _setSelectRadio(dynamic value) {
    prefs.genere = value;
    _genere = value;
    //Notificación al widget para redibujar

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: (prefs.secondColor) ? Colors.teal : Colors.blue,
          title: Text('Preferencias del usuario'),
        ),
        drawer: DrawerMenu(),
        body: ListView(children: <Widget>[
          Container(
              padding: EdgeInsets.all(10.0),
              child: Text(
                'Ajustes',
                style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
              )),
          Divider(),
          SwitchListTile(
              value: _secondColor,
              title: Text('Color secundario'),
              onChanged: (value) {
                setState(() {
                  _secondColor = value;
                  prefs.secondColor = value;
                });
              }),
          RadioListTile(
              value: 1,
              title: Text('Femenino'),
              groupValue: _genere,
              onChanged: _setSelectRadio),
          RadioListTile(
              value: 2,
              title: Text('Masculino'),
              groupValue: _genere,
              onChanged: _setSelectRadio),
          Divider(),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                controller: _textController,
                decoration: InputDecoration(
                    labelStyle: TextStyle(fontSize: 25.0),
                    icon: Icon(
                      Icons.face,
                      color: Colors.blue,
                    ),
                    labelText: 'Nombre',
                    helperText: 'Nombre del usuario'),
                onChanged: (value) {
                  setState(() {
                    prefs.name = value;
                  });
                },
              ))
        ]));
  }
}
