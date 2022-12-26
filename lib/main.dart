import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pokemon/pokemon/home/home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Pokemon",
    theme:
        ThemeData(appBarTheme: AppBarTheme(backgroundColor: Colors.green[900])),
    home: HomePage(),
  ));
}
