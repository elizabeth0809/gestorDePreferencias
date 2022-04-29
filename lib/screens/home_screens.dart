import 'package:flutter/material.dart';
import 'package:prefrecias_usuarios/share_preferences/preferences.dart';

import '../widgets/widgets.dart';

class HomeScreens extends StatelessWidget {
  static const String routerName = 'Home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      //menu de hamburguesa
      //drawer: Container(), esto mostrara una pantalla semitrasparente negra
      /*drawer: Container(
        color: Colors.white,
      ),
      esto mostrara un widget blanco que ocultara toda la pantalla
      */
      drawer: SideMenu(),

      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text('Darkmode: ${Preferences.isDarkmode}'),
        Divider(),
        Text('Genero: ${Preferences.gender}'),
        Divider(),
        Text('Nombre de usuario: ${Preferences.name}'),
        Divider(),
      ]),
    );
  }
}
