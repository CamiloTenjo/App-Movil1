import 'package:flutter/material.dart';
import 'package:proyecto_1/RegistroUsuario.dart';
import 'package:proyecto_1/Login.dart';
class GestionUsuarios extends StatefulWidget{
  @override
  GestionUsuariosApp createState() => GestionUsuariosApp();

}
class GestionUsuariosApp extends State<GestionUsuarios>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Gestion Usuarios"),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Padding(padding:
            EdgeInsets.only(top:20),
            child: ElevatedButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (_)=> RegistroUsuario()));
              },
              child: Text("Registro de Usuario")
            ),  
            ),
            Padding(padding:
            EdgeInsets.only(top:20),
              child: ElevatedButton(
                  onPressed: (){},
                  child: Text("Cambio de password")
              ),
            ),
            Padding(padding:
            EdgeInsets.only(top:20),
              child: ElevatedButton(
                  onPressed: (){},
                  child: Text("Inhabilitar Usuario")
              ),
            ),
            Padding(padding:
            EdgeInsets.only(top:20),
              child: ElevatedButton(
                  onPressed: (){},
                  child: Text("Actualizar Usuario")
              ),
            ),
            Padding(padding:
            EdgeInsets.only(top:20),
              child: ElevatedButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (_)=> Login()));
                  },
                  child: Text("LOgin")
              ),
            ),
          ],
        )
      ),
    );
  }
}