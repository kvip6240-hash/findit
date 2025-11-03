// import 'package:find_it/Collagepage.dart';
// import 'package:find_it/Introduction.dart';
// import 'package:find_it/Location.dart';
// import 'package:find_it/Logout.dart';
// import 'package:find_it/roomsApi.dart';
import 'package:find_zero/rooms%20page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'college page.dart';
import 'location code.dart';
import 'logout.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _currentIndex = 0;

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });

    if (index == 3) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Profileeee()),
      );
    }
    if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => location()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.person),
          )
        ],
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("img_5.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding:EdgeInsets.symmetric(vertical: 60.0, horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    "F I N D   I T",
                    style:TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.black,
                      letterSpacing: 1.5,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search, color: Colors.black),
                    hintText: "Search it",
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>roomPage()), // change to your Rooms page
                    );
                  },
                  child: Center(
                    child: Card(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Container(
                        height: 230,
                        width: 300,
                        decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Center(
                          child: Text(
                            "Room's",
                            style: GoogleFonts.lato(
                              textStyle:TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 20),
                InkWell(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) =>collegeApi()),
                    );
                  },
                  child: Center(
                    child: Card(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Container(
                        height: 230,
                        width: 300,
                        decoration: BoxDecoration(
                          color: Colors.black54,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child:Center(
                          child:  Text(
                            "College's",
                            style: GoogleFonts.lato(
                              textStyle:TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                                letterSpacing: 0.5,
                              ),
                            ),
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

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white.withOpacity(0.9),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.location_on_outlined), label: "Location"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Favorite"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "settings"),
        ],
      ),
    );
  }
}