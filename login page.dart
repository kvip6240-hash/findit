import 'package:find_zero/sigin%20in.dart';
import 'package:find_zero/sp%20screen.dart';
import 'package:find_zero/introduction.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'home.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {


  bool show = false;
  bool showw =false;


   TextEditingController emailController = TextEditingController();

   TextEditingController passwordController = TextEditingController();

   Sce() {
     setState(() {
       emailController.text.isNotEmpty && passwordController.text.isNotEmpty ? show = true : showw = false;
     });
   }


   create() async
   {
     await FirebaseAuth.instance.signInWithEmailAndPassword(
         email:  emailController.text,
         password: passwordController.text);
     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Homepage()));
     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("login successfully")));
   }


   final GoogleSignIn  googleSignIn = GoogleSignIn(
     clientId:
     '410348576673-4v3h84e9inv6s5nke7kn3i4ukfac7ln2.apps.googleusercontent.com',
   );

   Future<User?> signInWithGoogle(BuildContext context) async {
     FirebaseAuth _auth = FirebaseAuth.instance;
     try {
       UserCredential userCredential;
       if (kIsWeb) {
         var googleProvider = GoogleAuthProvider();
         userCredential = await _auth.signInWithPopup(googleProvider);
       } else {
         GoogleSignInAccount googleUser = (await GoogleSignIn().signIn())!;
         final GoogleSignInAuthentication googleAuth =
         await googleUser.authentication;
         final googleAuthCredential = GoogleAuthProvider.credential(
           accessToken: googleAuth.accessToken,
           idToken: googleAuth.idToken,
         );
         userCredential = await _auth.signInWithCredential(googleAuthCredential);
       }
       final user = userCredential.user;
       if (user != null) {

         Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
             builder: (context)=>Homepage()),(route)
         {
           return false;
         });

       }
     } catch (e) {
       print(e);
     }
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            height: 220,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
              ),
            ),
            child: Center(
                child: Text("Welcome !",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 50,color: Colors.white),)
            ),
          ),
          const SizedBox(height: 30),
          Text(
            "Login",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: Column(
              children: [
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    hintText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 15),
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.key),
                    hintText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 25),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    minimumSize: Size(double.infinity, 50),
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Homepage()));
                  },
                  child: Text("Login", style: TextStyle(color: Colors.white)),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    minimumSize: Size(double.infinity, 50),
                  ),
                  onPressed: () {
                    signInWithGoogle(context);
                  },
                  child: Text("Don't have any google account?", style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ),
          SizedBox(height:50,),
          Text("Terms & Conditions")
          // ElevatedButton(onPressed: (){
          //   signInWithGoogle(context);
          // }, child: Text("Don't have any google account?",
          //   style: TextStyle(decoration: TextDecoration.underline),)),
        ],
      ),
    );
  }
}
