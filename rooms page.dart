// import 'package:find_it/FindHome.dart';
import 'package:flutter/material.dart';

import 'home.dart';

class roomPage extends StatefulWidget {
  const roomPage({super.key});

  @override
  State<roomPage> createState() => _roomPageState();
}

class _roomPageState extends State<roomPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.black,leading:IconButton(
        icon: Icon(Icons.arrow_back,size: 30, color: Colors.white),
        onPressed: () {
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>Homepage()),(c){
            return false;
          });
        },
      ),
      ),
    );
  }
}