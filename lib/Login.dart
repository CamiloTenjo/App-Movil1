import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:proyecto_1/buscar.dart';

class Login extends StatefulWidget {
  @override
  LoginApp createState() => LoginApp();
}

class LoginApp extends State<Login> {
  TextEditingController correo = TextEditingController();
  TextEditingController pass = TextEditingController();
  final firebase = FirebaseFirestore.instance;
int flag=0;
  validarDatos() async {
    try {
      CollectionReference ref = FirebaseFirestore.instance.collection(
          "Usuarios");
      QuerySnapshot usuario = await ref.get();
      if (usuario.docs.length != 0) {
        int flag=0;
        for (var cursor in usuario.docs) {
          print(cursor.get("Correo"));
          if (cursor.get("Correo")==correo.text){
            if(cursor.get("pass")==pass.text){
              mensaje("Correcto","usuario encontrado");
              print(cursor.get("nombreUsuario"));
              flag=1;
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => buscar()));
            }
          }
        }
        if(flag==0){
          mensaje("No encontrado","No se encontro el usuario");
        }
      } else {
        print('No se encontraron elementos en la coleccion');
      }
    }catch(e){
      print (e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ingreso de clientes"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: Center(
                child: Container(
                  width: 100,
                  height: 100,
                  child: Image.asset('Image/login.png'),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 40, top: 30, right: 10, bottom: 5),
              child: TextField(
                controller: correo,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)
                  ),
                  labelText: 'correo',
                  hintText: 'Digite Correo',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 40, top: 30, right: 10, bottom: 5),
              child: TextField(
                controller: pass,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)
                  ),
                  labelText: 'Contraseña',
                  hintText: 'Digite Contraseña',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 40, top: 30, right: 10, bottom: 5),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(500, 50),
                ),
                onPressed: (){
                 validarDatos();
                  correo.clear();
                  pass.clear();
                },
                child: Text("Enviar"),
              ),
            ),
          ],
        ),
      ),
    );
  }
  void mensaje(String titulo, String mess){
    showDialog(
      context: context,
      builder: (buildcontext){
        return AlertDialog(
          title: Text(titulo),
          content: Text(mess),
          actions:<Widget>[
            RaisedButton(onPressed: (){
             Navigator.of(context).pop();
            }, child:Text("aceptar",
            style:TextStyle(color:Colors.blueGrey)),
            )
          ]
        );
      }
    );
  }
}
