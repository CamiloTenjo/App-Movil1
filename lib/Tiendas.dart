import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'VistaTienda.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Tiendas extends StatefulWidget{
  @override
  TiendasApp createState() => TiendasApp ();
}
class TiendasApp extends State<Tiendas>{
  @override
  Widget build(BuildContext context) {
    Widget titleSection=Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children:[
          Expanded(child:
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom:8),
                  child: Text(
                    'Comidas Rapidas Carmen',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        )
                  ),
                ),
                Text('Perros Calientes, Hamburguesas',
                  style: TextStyle(
                    color: Colors.red[500],
                  ),

                ),
              ],
          ),

          ),
          Container(
            width: 80,
              height: 80,
            child: Image.asset('image/perro.png'),
          ),
          ElevatedButton(onPressed: (){}, child:  ElevatedButton(onPressed: () {
    print("presionado");
    Navigator.push(
    context, MaterialPageRoute(builder: (_) => shopview()));
    }, child:
    Text('Entrar'),
    style: ElevatedButton.styleFrom(
    primary: Colors.blue[600],
           ),
          ),
          ),
        ],
      
      ),
    );
    return Scaffold(
    appBar: AppBar(
    title: Text('Lista de Tiendas'),
    ),
    body: new Container(
    child: Center(
    child: StreamBuilder(
    stream: FirebaseFirestore.instance.collection('Tiendas').snapshots(),
    builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot){
    if (!snapshot.hasData) return CircularProgressIndicator();
    return ListView.builder(
    itemCount: snapshot.data!.docs.length,
    itemBuilder: (BuildContext context, int index){
    return new Card(
    child: new Column(
    children: <Widget>[
    Container(
    padding: const EdgeInsets.all(15),
    child: Row(
    children: [
    Expanded(child: Column(
    crossAxisAlignment:
    CrossAxisAlignment.start,
    children: [
    Container(
    padding:
    const EdgeInsets.only(bottom:10),
    child: Text(snapshot.data!.docs[index].get('nombreTienda')),
    ),
    Text(snapshot.data!.docs[index].get("descrip")
    ,
    style: TextStyle(
    color: Colors.green[500],
    ),
    ),

    ],
    )
    ),
    Container(
    width: 80,
    height: 80,
    child: Image.asset('image/'+snapshot.data!.docs[index].get("ruta")),
    ),
    ElevatedButton(onPressed: (){}, child: Text('Entrar'))
    ]
    ),
    )
    ],
    ),
    );
    },
    );
    },
    ),
    ),
    ),
    );
  }
}