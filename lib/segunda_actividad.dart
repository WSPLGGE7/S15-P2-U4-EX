import 'package:flutter/material.dart';

class SegundaActividad extends StatelessWidget {
  final bool esUsuarioValido;

  SegundaActividad({required this.esUsuarioValido});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Segunda Actividad'),
      ),
      body: Container(
        color: esUsuarioValido ? Colors.greenAccent : Colors.redAccent,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                esUsuarioValido ? Icons.check : Icons.clear,
                color: Colors.white,
                size: 50,
              ),
              SizedBox(height: 20),
              Text(
                esUsuarioValido ? 'Usuario Válido' : 'Usuario Inválido',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


