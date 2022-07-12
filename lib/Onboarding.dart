import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tmdb/main.dart';

import 'constants.dart';
import 'login_page.dart';

class Onboarding extends StatefulWidget {
  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  _OnboardInfo() async {
    print("Shared pref called");
    int isViewed = 0;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('Onboarding', isViewed);
    print(prefs.getInt('Onboarding'));
  }

  void _onIntroEnd(context) {
    _OnboardInfo();
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => SplashScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: IntroductionScreen(
          done: Text("Let's Explore",
            style: TextStyle(fontSize: 12),),
          pages: [
            PageViewModel(
                title: "Non Stop Entertainment",
                image: Image.asset("assets/onboarding_2.png"),
                bodyWidget: Text(onBoardingOneString,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.nunito(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),),
                decoration: PageDecoration(
                    titlePadding: EdgeInsets.symmetric(vertical: 30),
                    imageFlex: 3,
                    bodyFlex: 2,
                    imagePadding: EdgeInsets.only(top: 35)
                )
            ),
            PageViewModel(
                title: "Latest Content",
                image: Image.asset("assets/onboarding_1.png"),
                bodyWidget: Text(onBoardingTwoString,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.nunito(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),),
                decoration: PageDecoration(
                    titlePadding: EdgeInsets.symmetric(vertical: 30),
                    imageFlex: 3,
                    bodyFlex: 2,
                    imagePadding: EdgeInsets.only(top: 35,right: 30)
                )
            ),
            PageViewModel(
                title: "Quality Time's",
                image: Image.asset("assets/onboarding_4.png"),
                bodyWidget: Text(onBoardingThreeString,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.nunito(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),),
                decoration: PageDecoration(
                    titlePadding: EdgeInsets.symmetric(vertical: 30),
                    imageFlex: 3,
                    bodyFlex: 2,
                    imagePadding: EdgeInsets.only(top: 25)
                )
            ),
          ],
          onDone: (){
            _onIntroEnd(context);
          },
          skip: Text("Skip"),
          skipColor: Colors.black,
          onSkip: (){
            _onIntroEnd(context);
          },
          next: Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            width: double.infinity,
            decoration: BoxDecoration(
                gradient: buttoncolor, borderRadius: BorderRadius.circular(4)),
            child: Text(
              "Next",
              textAlign: TextAlign.center,
              style: GoogleFonts.rowdies(fontSize: 23, color: Colors.white),
            ),
          ),
          showNextButton: true,
          showSkipButton: true,
          dotsDecorator: DotsDecorator(
              activeColor:Colors.black,
              size: Size(10,10),
              activeSize: Size(22,10),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24)
              )
          ),
        ),
      ),
    );
  }
}