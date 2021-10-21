import 'package:estadosapp/controllers/usuario_controller.dart';
import 'package:estadosapp/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Pagina2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final usuarioCtrl = Get.find<UsuarioController>();
    return Scaffold(
      appBar: AppBar(
        title: Obx(() => usuarioCtrl.existeUsuario.value
            ? Text(usuarioCtrl.usuario.value.nombre!)
            : const Text('Pagina 2')),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
                child: const Text(
                  'Establecer usuario',
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.blue,
                onPressed: () {
                  final user = Usuario(
                      nombre: Get.arguments['nombre'],
                      edad: Get.arguments['edad'],
                      profesiones: [
                        'Software Developer',
                        'Analist of Software'
                      ]);
                  usuarioCtrl.cargarUsuario(user);
                  Get.snackbar('Usuario agregado',
                      'Nombre: ${usuarioCtrl.usuario.value.nombre}');
                }),
            Obx(() => usuarioCtrl.existeUsuario.value
                ? BotonesAdicionales(usuarioCtrl, true)
                : BotonesAdicionales(usuarioCtrl, false))
          ],
        ),
      ),
    );
  }
}

class BotonesAdicionales extends StatelessWidget {
  final UsuarioController usuarioCtrl;
  final bool estado;

  const BotonesAdicionales(this.usuarioCtrl, this.estado);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MaterialButton(
            child: const Text(
              'Cambiar edad',
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.blue,
            onPressed: estado ? () => usuarioCtrl.cambiarEdad(20) : null),
        MaterialButton(
            child: const Text(
              'Añadir Profesión',
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.blue,
            onPressed: estado
                ? () => usuarioCtrl.agregarProfesion('Soccer Player')
                : null),
      ],
    );
  }
}
