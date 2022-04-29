import 'package:flutter/material.dart';
import 'package:prefrecias_usuarios/provider/theme_provider.dart';
import 'package:prefrecias_usuarios/share_preferences/preferences.dart';
import 'package:prefrecias_usuarios/widgets/widgets.dart';
import 'package:provider/provider.dart';

import '../provider/theme_provider.dart';

class SettingsScreens extends StatefulWidget {
  static const String routerName = 'Settings';

  @override
  State<SettingsScreens> createState() => _SettingsScreensState();
}

class _SettingsScreensState extends State<SettingsScreens> {
  //bool isDarkMode = false;
  //int gender = 1;
  //String name = 'pedro';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Setting'),
      ),
      //menu de hamburguesa
      drawer: SideMenu(),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: SingleChildScrollView(
            child: Column(
          children: [
            const Text(
              'Ajustes',
              style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
            ),
            const Divider(),
            SwitchListTile.adaptive(
                value: Preferences.isDarkmode,
                title: Text('Darkmode'),
                onChanged: (value) {
                  Preferences.isDarkmode = value;
                  //esto es para que cambie el tema de blanco a negro
                  final themeProvider =
                      Provider.of<ThemeProvider>(context, listen: false);
                  //si el valor es de uno o otro debe de cambiar a blanco o negro
                  value
                      ? themeProvider.setDarkmode()
                      : themeProvider.setLightMode();
                  //esto es para que se redibuje
                  setState(() {});
                }),
            const Divider(),
            RadioListTile<int>(
                value: 1,
                groupValue: Preferences.gender,
                title: const Text('Masculino'),
                onChanged: (value) {
                  Preferences.gender = value ?? 1;
                  setState(() {});
                }),
            const Divider(),
            RadioListTile<int>(
                value: 2,
                groupValue: Preferences.gender,
                title: const Text('Femenino'),
                onChanged: (value) {
                  Preferences.gender = value ?? 2;
                  setState(() {});
                }),
            const Divider(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                initialValue: Preferences.name,
                onChanged: (value) {
                  Preferences.name = value;
                  setState(() {});
                },
                decoration: InputDecoration(
                    labelText: 'Nombre', helperText: 'Nombre de usuario'),
              ),
            )
          ],
        )),
      ),
    );
  }
}
