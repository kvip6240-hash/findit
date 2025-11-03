import 'package:find_zero/settings%20page.dart';
import 'package:find_zero/sigin%20in.dart';
import 'package:find_zero/sp%20screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// import 'package:find_it/Collagepage.dart';
// import 'package:find_it/Introduction.dart';
// import 'package:find_it/Location.dart';
// import 'package:find_it/Logout.dart';
// import 'package:find_it/roomsApi.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'firebase_options.dart';
import 'home.dart';
import 'location code.dart';
import 'login page.dart';
import 'logout.dart';

Future<void> main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ChangeNotifierProvider(create: (context)=>ThemePr(),
      child:  MyApp()));
}

class MyApp extends StatelessWidget {
  void main() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    runApp(MyApp());
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var themePro = Provider.of<ThemePr>(context);
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      theme: themePro.darkmode ? ThemeData.dark() : ThemeData.light(),

      home: SplashScreen(),
    );
  }
}
class ThemePr extends ChangeNotifier {
  bool darkmode = true;

  ThemePr() {
    loadTheme();
  }

  void update({required bool dark}) async {
    darkmode = dark;
    notifyListeners();
    final Prefs = await SharedPreferences.getInstance();
    await Prefs.setBool('isDarkMode', darkmode);
  }

  void loadTheme() async {
    final Prefs = await SharedPreferences.getInstance();
    darkmode = Prefs.getBool('isDarkMode') ?? true;
    notifyListeners();
  }
}