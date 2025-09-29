import 'package:flutter/material.dart';
import 'telas/tela_login.dart';
import 'estilos/estilos.dart';
import 'usuario.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
        home: TelaLogin(),
    );
  }
}
