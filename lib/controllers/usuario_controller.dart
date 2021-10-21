import 'package:get/get.dart';

import 'package:estadosapp/models/usuario.dart';

class UsuarioController extends GetxController {
  var existeUsuario = false.obs;
  var usuario = Usuario().obs;

  void cargarUsuario(Usuario user) {
    existeUsuario.value = true;
    usuario.value = user;
  }

  void cambiarEdad(int edad) {
    usuario.update((val) => val!.edad = edad);
  }

  void agregarProfesion(String profesion) {
    usuario.update((val) {
      val!.profesiones.add(profesion);
    });
  }
}
