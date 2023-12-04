import 'package:flutter/material.dart';
import 'segunda_actividad.dart';

class UsuarioRegistrado {
  final String nombreUsuario;
  final String contrasena;

  UsuarioRegistrado({required this.nombreUsuario, required this.contrasena});
}

class PantallaLogin extends StatefulWidget {
  @override
  _PantallaLoginState createState() => _PantallaLoginState();
}

class _PantallaLoginState extends State<PantallaLogin> {
  TextEditingController _controladorUsuario = TextEditingController();
  TextEditingController _controladorContrasena = TextEditingController();

  // Lista de usuarios registrados
  List<UsuarioRegistrado> _usuariosRegistrados = [
    UsuarioRegistrado(nombreUsuario: 'luis', contrasena: '123'),
    UsuarioRegistrado(nombreUsuario: 'sebas', contrasena: '1234'),
    // Puedes agregar más usuarios aquí
  ];

  void _mostrarDialogo(bool esValido) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Resultado del Inicio de Sesión'),
          content: esValido
              ? Column(
                  children: [
                    Icon(Icons.check, color: Colors.green, size: 50),
                    Text('Usuario Válido'),
                  ],
                )
              : Column(
                  children: [
                    Icon(Icons.clear, color: Colors.red, size: 50),
                    Text('Usuario Inválido'),
                  ],
                ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _validarUsuario() {
    String usuarioIngresado = _controladorUsuario.text;
    String contrasenaIngresada = _controladorContrasena.text;

    // Verificar si el usuario ya está registrado
    bool esUsuarioRegistrado = _usuariosRegistrados.any(
      (usuario) => usuario.nombreUsuario == usuarioIngresado && usuario.contrasena == contrasenaIngresada,
    );

    _mostrarDialogo(esUsuarioRegistrado);

    if (esUsuarioRegistrado) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SegundaActividad(esUsuarioValido: esUsuarioRegistrado),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pantalla de Inicio de Sesión'),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(238, 60, 162, 225), // Color de fondo de la página
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Agregar la imagen en la parte superior
              Image.asset(
                'assets/tu_imagen.jpg', // Cambia esto con la ruta de tu imagen
                height: 150,
                width: 100,
              ),
              SizedBox(height: 20),
              TextField(
                controller: _controladorUsuario,
                decoration: InputDecoration(labelText: 'Usuario'),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _controladorContrasena,
                obscureText: true,
                decoration: InputDecoration(labelText: 'Contraseña'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _validarUsuario,
                child: Text('Iniciar Sesión'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
