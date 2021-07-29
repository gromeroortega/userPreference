import 'package:shared_preferences/shared_preferences.dart';

/* Clase singleto para almacenar y obtener las preferencias del usuario */

class UserPreferences {
  //
  static final UserPreferences _instancia = new UserPreferences._internal();
  //Contructor de la instancia singleton UserPreference
  factory UserPreferences() {
    return _instancia;
  }

  UserPreferences._internal();
  late SharedPreferences _prefs;

//Instancía del paquete SheredPReferences
  initPrefs() async {
    this._prefs = await SharedPreferences.getInstance();
  }

/*Ninguna de estas propiedades se usa, solo ejemplo.
  bool _secondColor;
  int _genere;
  String _name;*/

  //Getters y Setters Genero

  get genere {
    //Setting del valor, se envia en un map[<String>dynamic(en este caso un Int)]
    //para grabar el int y retorna un boleano si lo hizo o no.
    return _prefs.getInt('genere') ?? 1;
  }

  set genere(dynamic value) {
    _prefs.setInt('genere', value);
  }

//Getters y Setters Color secundario
  get secondColor {
    return _prefs.getBool('secondColor') ?? false;
  }

  set secondColor(dynamic value) {
    _prefs.setBool('secondColor', value);
  }

//Getters y Setters Nombre
  get name {
    return _prefs.getString('name') ?? '';
  }

  set name(dynamic value) {
    _prefs.setString('name', value);
  }

//Getter y setter de la última página.
  get lastPage {
    return _prefs.getString('name') ?? 'home';
  }

  set lastPage(dynamic value) {
    _prefs.setString('name', value);
  }
}
