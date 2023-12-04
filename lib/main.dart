import 'package:flutter/material.dart';
import 'pantalla_login.dart';


void main() {
  runApp(
    MaterialApp(
      title: 'Tu Aplicación',
      home: PantallaLogin(),
      builder: (context, child) {
        return MediaQuery(
          child: child!,
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        );
      },
      // Cambia el valor de 'assets/app_icon.png' con la ruta correcta de tu nuevo ícono
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: Colors.white),
        ),
        iconTheme: IconThemeData(
          color: Colors.black, // Puedes ajustar el color de los íconos aquí
          size: 24,  // Puedes ajustar el tamaño de los íconos aquí
        ),
      ),
    ),
  );
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PantallaLogin(),
    );
  }
}

