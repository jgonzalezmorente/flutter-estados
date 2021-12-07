import 'package:estados/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:estados/services/usuario_service.dart';


class Pagina2Page extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    
    final usuarioService = Provider.of<UsuarioService>( context );
    
    return Scaffold(
      appBar: AppBar(
        title: usuarioService.existeUsuario
          ? Text( 'Nombre: ${ usuarioService.usuario!.nombre }')
          : Text( 'Página 2' )
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              child: Text( 'Establecer Usuario', style: TextStyle( color: Colors.white ) ),
              color: Colors.blue,
              onPressed: () {
                final newUser = new Usuario(
                  nombre: 'Fernando Herrera', 
                  edad: 34,
                  profesiones: ['Fullstack Developer', 'Video Jugador Experto']
                );
                usuarioService.usuario = newUser;
              }
            ),

            MaterialButton(
              child: Text( 'Cambiar edad', style: TextStyle( color: Colors.white ) ),
              color: Colors.blue,
              onPressed: () {                
                if ( usuarioService.existeUsuario ) {
                  usuarioService.cambiarEdad( 40 );
                }
              }
            ),

            MaterialButton(
              child: Text( 'Añadir profesión', style: TextStyle( color: Colors.white ) ),
              color: Colors.blue,
              onPressed: () {
                usuarioService.agregarProfesion();
              }
            )


          ],
        ),
     ),
   );
  }
}