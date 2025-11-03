
// import 'package:find_it/FindHome.dart';
// import 'package:find_it/Introduction.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home.dart';
import 'introduction.dart';
import 'main.dart';

class Profileeee extends StatefulWidget {
  const Profileeee({super.key});

  @override
  State<Profileeee> createState() => _ProfileeeeState();
}

class _ProfileeeeState extends State<Profileeee> {
  Future<void> saveLoginState() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', true);
  }


  @override
  Widget build(BuildContext context) {


    var themePro = Provider.of<ThemePr>(context);

    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.black,leading:IconButton(
        icon: Icon(Icons.arrow_back,size: 30, color: Colors.white),
        onPressed: () {
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>Homepage()),(c){
            return false;
          });
        },
      ),
        title: Text("settings",style: TextStyle(color: Colors.white),),
      ),
      body: Column(
        children: [SizedBox(height:20 ,),
          InkWell(
            onTap: (){},
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child:
              Row(
                children: [
                  Icon(Icons.dark_mode),SizedBox(width: 12,),
                  Text("dark mode",style: TextStyle(fontSize:20),),Divider(),
                  Switch(value:themePro.darkmode , onChanged:(value)
                  {
                    themePro.update(dark: value);
                  }
                  ),
                ],
              ),
            ),
          ),SizedBox(height: 50,),
          InkWell(
            onTap: (){},
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(Icons.language),SizedBox(width: 12,),
                  Text("Language",style: TextStyle(fontSize:20),),Divider(),
                ],
              ),
            ),
          ),SizedBox(height: 50,),
          InkWell(
            onTap: (){},
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(Icons.policy),SizedBox(width: 12,),
                  Text("Privacy & policy",style: TextStyle(fontSize:20),),Divider(),
                ],
              ),
            ),
          ),SizedBox(height: 50,),
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Introduction()));
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(Icons.logout),SizedBox(width: 12,),
                  Text("Logout",style: TextStyle(fontSize:20),),Divider(),
                ],
              ),
            ),
          ),Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(height: 150,),
          ),
          Text("Terms & Conditions")
        ],
      ),
    );

  }
}
