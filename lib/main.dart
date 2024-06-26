import 'package:flutter/material.dart';
import 'package:app_idioma/views/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';

// Função principal que inicializa o aplicativo
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
