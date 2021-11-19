

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
class RegistroUsuario extends StatefulWidget {
  @override
  RegistroUsuarioApp createState() => RegistroUsuarioApp();
}

class RegistroUsuarioApp extends State<RegistroUsuario> {
  @override
  TextEditingController usuario= TextEditingController();
  TextEditingController correo= TextEditingController();
  TextEditingController telefono= TextEditingController();
  TextEditingController pass= TextEditingController();
  final firebase=FirebaseFirestore.instance;

  registrarUsuario() async{
    try{
      await firebase
          .collection('Usuarios')
          .doc()
          .set({
        "nombreUsuario":usuario.text,
        "Correo":correo.text,
        "Telefono":telefono.text,
        "Pass":pass.text
      });
    }
    catch(e){
      print(e);
    }

  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.lightBlueAccent, Colors.blue.shade600],
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
            ),
          ),
        ),
        title: Text('Registro de Usuario'),
        toolbarHeight: 50,
        elevation: 20.00,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 15, right: 20, top: 10, bottom: 0),
              // nombre Tienda
              child: TextField(
                controller: usuario,
                decoration: InputDecoration(
                    labelText: 'Nombre Usuario',
                    hintText: 'Digite Nombre del Usuario',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5))),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15, right: 20, top: 10, bottom: 0),
              //Ruta Imagen
              child: TextField(
                controller: correo,
                decoration: InputDecoration(
                    labelText: 'Correo',
                    hintText: 'Digite el correo',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5))),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15, right: 20, top: 10, bottom: 0),
              // Descrpcion
              child: TextField(
                controller: telefono,
                decoration: InputDecoration(
                    labelText: 'Telefono',
                    hintText: 'Digite el numero de telefono',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5))),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15, right: 20, top: 10, bottom: 0),
              //Pagina Web
              child: TextField(
                obscureText: true,
                controller:pass,
                decoration: InputDecoration(
                    labelText: 'Contraseña',
                    hintText: 'Digite la Contraseña',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5))
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15, right: 20, top: 10, bottom: 0),
              child: ElevatedButton(
                onPressed: () {
                  registrarUsuario();
                  usuario.clear();
                  correo.clear();
                  telefono.clear();
                  pass.clear();
                },
                child: Text('Regsitrar Usuario'),


              ),
            ),
          ],
        ),
      ),
    );
  }
}
