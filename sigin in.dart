
import 'package:flutter/material.dart';

class Signinpage extends StatefulWidget {
  const Signinpage({super.key});

  @override
  State<Signinpage> createState() => _SigninpageState();
}

class _SigninpageState extends State<Signinpage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration:  BoxDecoration(
          gradient: LinearGradient(
            colors: [ Colors.grey,
              ?Colors.grey[800],
              Colors.black],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                icon: Icon(Icons.arrow_back_outlined, color: Colors.white),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            SizedBox(height: 50 ,),
            Center(
              child: Container(
                height: 500,
                width: 300,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(10)
                ),child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Sign Up",style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    ),SizedBox(height: 30,),Text("Username",
                      style: TextStyle(fontSize: 16,color: Colors.black,fontWeight:
                      FontWeight.w500),
                    ),SizedBox(height: 8,),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.person),
                            hintText: "Enter your Username",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            )
                        ),
                      ),
                    ),Text("Email",
                      style: TextStyle(fontSize: 16,color: Colors.black,fontWeight:
                      FontWeight.w500),
                    ),SizedBox(height: 8,),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.email),
                            hintText: "Enter your Email",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            )
                        ),
                      ),
                    ),
                    Text("Password",
                      style: TextStyle(fontSize: 16,color: Colors.black,fontWeight:
                      FontWeight.w500),
                    ),SizedBox(height: 8,),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.key),
                            hintText: "Enter your Password",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            )
                        ),
                      ),
                    ),SizedBox(height:20 ,),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: SizedBox(
                          width: 150,
                          height: 50,
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              side:  BorderSide(color: Colors.black, width: 1.5),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            onPressed: () {},
                            child:  Text(
                              "Sign In",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
