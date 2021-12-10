import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:estados/models/usuario.dart';

part 'usuario_state.dart';

class UsuarioCubit extends Cubit<UsuarioState> {
  
  UsuarioCubit() : super( UsuarioInitial() );

  void seleccionarUsuario( Usuario user ) {
    emit( UsuarioActivo( user ) );
  }

  void cambiarEdad( int edad ) {

    final currentState = state;
    if ( currentState is UsuarioActivo ) {
      final newUsuario = currentState.usuario.copyWith( edad: edad );      
      emit( UsuarioActivo( newUsuario ) );
    }

  }

  void agregarProfesion() {

    final currentState = state;
    if ( currentState is UsuarioActivo ) {
      final profesiones = currentState.usuario.profesiones;      
      final newProfesiones = [
        ...currentState.usuario.profesiones,
        'Profesión ${ profesiones.length + 1 }'
      ];
      final newUsuario = currentState.usuario.copyWith( profesiones: newProfesiones );
      emit( UsuarioActivo( newUsuario ) );
    }

  }

  void borrarUsuario() => emit( UsuarioInitial() );


}
