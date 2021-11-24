

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
class shopRegister extends StatefulWidget {
  @override
  ShopRegisterApp createState() => ShopRegisterApp();
}

class ShopRegisterApp extends State<shopRegister> {
  @override
  TextEditingController nombreTienda= TextEditingController();
  TextEditingController rutaImagen= TextEditingController();
  TextEditingController des_Tienda= TextEditingController();
  TextEditingController webSite= TextEditingController();
  final firebase=FirebaseFirestore.instance;

  registrar() async{
    try{
      await firebase
          .collection('Tiendas')
          .doc()
          .set({
        "nombreTienda":nombreTienda.text,
        "ruta":rutaImagen.text,
        "descrip":des_Tienda.text,
        "webSite":webSite.text
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
        title: Text('Registro de Tiendas'),
        toolbarHeight: 50,
        elevation: 20.00,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 15, right: 20, top: 10, bottom: 0),
              // nombre Tienda
              child: TextField(
                controller: nombreTienda,
                decoration: InputDecoration(
                    labelText: 'Nombre Tienda',
                    hintText: 'Digite Nombre de la Tienda',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5))),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15, right: 20, top: 10, bottom: 0),
              //Ruta Imagen
              child: TextField(
                controller: rutaImagen,
                decoration: InputDecoration(
                    labelText: 'Nombre Imagen',
                    hintText: 'Digite la Ruta de la Imagen',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5))),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15, right: 20, top: 10, bottom: 0),
              // Descrpcion
              child: TextField(
                controller: des_Tienda,
                decoration: InputDecoration(
                    labelText: 'Descripcion Tienda',
                    hintText: 'Digite la Descripcion de la Tienda',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5))),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15, right: 20, top: 10, bottom: 0),
              //Pagina Web
              child: TextField(
                controller:webSite,
                decoration: InputDecoration(
                    labelText: 'Pagina Web',
                    hintText: 'Digite Pagina Web de la Tienda',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5))
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15, right: 20, top: 10, bottom: 0),
              child: ElevatedButton(
                onPressed: () {
                  registrar();
                  nombreTienda.clear();
                  rutaImagen.clear();
                  des_Tienda.clear();
                  webSite.clear();
                },
                  child: Text('Regsitrar'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue[600],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(600)),
                ),

              ),
            ),
          ],
        ),
      ),
    );
  }
}
