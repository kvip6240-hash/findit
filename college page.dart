
//
import 'package:flutter/material.dart';

import 'home.dart';

class collegeApi extends StatefulWidget {
  const collegeApi({super.key});

  @override
  State<collegeApi> createState() => _collegeApiState();
}

class _collegeApiState extends State<collegeApi> {
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
