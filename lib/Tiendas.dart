import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Tiendas extends StatefulWidget{
  @override
  TiendasApp createState() => TiendasApp ();
}
class TiendasApp extends State<Tiendas>{
  @override
  Widget build(BuildContext context) {
    Widget titleSction=Container(
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
          ElevatedButton(onPressed: (){}, child: Text('Entrar')),
        ],
      
      ),
    );
    return Scaffold(
    appBar: AppBar(
    title: Text('Lista de Tiendas'),
    ),
      body: ListView(
        children: [
          titleSction,
          titleSction
        ],
      ),
    );
  }
}