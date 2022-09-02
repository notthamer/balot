import 'package:flutter/material.dart';
import './add_names.dart';


class Rand_pg_2 extends StatefulWidget {
  
List <String> _names;
Rand_pg_2(this._names);
  @override
  State<Rand_pg_2> createState() => _Rand_pg_2State(_names);
}

class _Rand_pg_2State extends State<Rand_pg_2> {
  List <String> _names;
  _Rand_pg_2State(this._names);
  
  @override
  Widget build(BuildContext context) {
    _names.shuffle();
    return Scaffold(
      body: Column(
        children: [Container( padding: EdgeInsets.all(200), 
        
        child: Text("${_names[0] }&& ${_names[1] } ${_names[2] } && ${_names[3] }"),color: Colors.grey,)],
      ),
    );
  }
}
