import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'buscar.dart';
import 'package:flutter/src/widgets/icon.dart';
void main(){
    WidgetsFlutterBinding.ensureInitialized();
    Firebase.initializeApp();
    runApp(MyApp());

}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bienvenidos grupo 6',
      home: Scaffold(
        appBar: AppBar(

          titleTextStyle: TextStyle(color: Colors.red.withOpacity(1.0)),
          title: Text('Aplicacion'),
          Icon(
           Icons.search,),




        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(left: 20,top: 20, right: 20, bottom: 0),
                  child: Center(
                    child:Container(
                      width: 200,
                      height: 200,
                      child: Image.asset('image/logo.png'),
                  ),
                ),
              ),
              Padding(padding:EdgeInsets.only(left: 20,top: 40,right: 20,bottom: 0),
              child:TextField(
                decoration:InputDecoration(
                  labelText: 'Busqueda',
                  hintText: 'Palabra Clave'
                ),
              ),
              ),
             Padding(padding: EdgeInsets.only(left: 20, top: 20, right: 0,bottom: 0),
             child: ElevatedButton(
               onPressed:(){
                 print("presionando");
                 Navigator.push(context, MaterialPageRoute(builder: (_) => buscar()));
                 },
                 child:Text('Buscar'),
             ),
             ),
            ],
          ) ,
        ),
      ),
    );
  }
}
