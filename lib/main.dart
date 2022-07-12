import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tmdb/Onboarding.dart';
import 'package:tmdb/login_page.dart';
import 'constants.dart';

int? isviewed;

void main() async {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,));
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  isviewed = prefs.getInt('Onboarding');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TMDB',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor:Colors.green,
        textTheme: GoogleFonts.rowdiesTextTheme(Theme.of(context).textTheme),
        colorScheme:
        ColorScheme.fromSwatch().copyWith(secondary: Colors.white ),
      ),
      scaffoldMessengerKey: Constants.messengerKey,
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget{
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double winHeight = 0;
  double winWidth = 0;

  // void performAsyncTask() async {
  //   SharePrefHelper sharePrefHelper = SharePrefHelper();
  //   bool isLoggedIn = await sharePrefHelper.getLoggedIn();
  //   try {
  //     if (isLoggedIn) {
  //       c.isLoggedIn = true;
  //       c.userModel = await sharePrefHelper.getUser();
  //       await c.getUserFromFirebase();
  //       c.getSelectedAddress();
  //     } else {
  //       c.isLoggedIn = true;
  //     }
  //
  //     Navigator.of(context).pushReplacement(MaterialPageRoute(
  //         builder: (_) => isviewed != 0
  //             ? Onboarding()
  //             : FirebaseAuth.instance.currentUser == null
  //             ? SelectionPage()
  //             : Dashboard()));
  //   } catch (e) {
  //     Navigator.pushAndRemoveUntil(
  //         context,
  //         MaterialPageRoute(
  //           builder: (context) => SelectionPage(),
  //         ),
  //             (route) => false);
  //   }
  // }

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 2500), () {
      Navigator.pushAndRemoveUntil(
                   context,
                   MaterialPageRoute(
                     builder: (context) => LoginPage(),
                  ),
                       (route) => false);
      setState(() {
        // Here you can write your code for open new view
      });

    });
  }

  @override
  Widget build(BuildContext context) {
    winHeight = MediaQuery.of(context).size.height;
    winWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/logo.png",
              fit: BoxFit.fitHeight,
              height: winHeight * 0.1,
            ),
            const SizedBox(
              height: 20,
            ),
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(Colors.black),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Getting Happiness",
              style: GoogleFonts.nunito(
                  fontWeight: FontWeight.bold, color: Colors.black),
            )
          ],
        ),
      ),
    );
  }
  // @override
  // void afterFirstLayout(BuildContext context) {
  //   performAsyncTask();
  // }
}