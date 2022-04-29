import 'package:flutter/material.dart';
import 'package:prefrecias_usuarios/provider/theme_provider.dart';
import 'package:prefrecias_usuarios/screens/screens.dart';
import 'package:prefrecias_usuarios/share_preferences/preferences.dart';
import 'package:provider/provider.dart';

void main() async {
  //esto iniciara si es necesario, es para evitar errores con el preferences init
  WidgetsFlutterBinding.ensureInitialized();
  //esto s para poder unsar preferences.art en todo el projecto
  await Preferences.init();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
          create: (_) => ThemeProvider(isDarkmode: Preferences.isDarkmode))
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: HomeScreens.routerName,
      routes: {
        HomeScreens.routerName: (_) => HomeScreens(),
        SettingsScreens.routerName: (_) => SettingsScreens(),
      },
      //aqui se dedibuja el tema
      theme: Provider.of<ThemeProvider>(context).currentTheme,
    );
  }
}
