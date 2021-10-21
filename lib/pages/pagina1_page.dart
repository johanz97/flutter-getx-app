import 'package:estadosapp/controllers/usuario_controller.dart';
import 'package:estadosapp/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Pagina1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final usuarioController = Get.put(UsuarioController());
    return Scaffold(
      appBar: AppBar(title: const Text('Pagina 1')),
      body: Obx(() => usuarioController.existeUsuario.value
          ? InformacionUsuario(usuarioController.usuario.value)
          : NoInfo()),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.pages),
          onPressed: () => Get.toNamed('/pagina2', arguments: {
                'nombre': 'Johan',
                'edad': 24
              })), //Navigator.pushNamed(context, 'pagina2')),
    );
  }
}

class InformacionUsuario extends StatelessWidget {
  final Usuario usuario;
  const InformacionUsuario(this.usuario);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'General',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const Divider(),
          ListTile(
            title: Text('Nombre: ${usuario.nombre}'),
          ),
          ListTile(
            title: Text('Edad: ${usuario.edad}'),
          ),
          const Text(
            'Profesiones',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const Divider(),
          ...usuario.profesiones
              .map((profesion) => ListTile(
                    title: Text(profesion),
                  ))
              .toList(),
        ],
      ),
    );
  }
}

class NoInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('No existe usuario'),
    );
  }
}
