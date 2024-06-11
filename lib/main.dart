import 'package:flutter/material.dart';
import 'package:app_idioma/views/login.dart';

// Função principal que inicializa o aplicativo
void main() {
  runApp(MyApp());
}

// Classe principal do aplicativo que é um StatefulWidget
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

// Estado associado ao MyApp
class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    // Retorna o widget MaterialApp que define a estrutura básica do aplicativo
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // Define a tela inicial do aplicativo como a tela de login
      home: Login(),
    );
     }
}