import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tmdb/constants.dart';

import 'dashboard.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController LoginEmailController = TextEditingController();
  TextEditingController LoginPasswordController = TextEditingController();
  bool _isHiddenPassword = true;
  double winHeight = 0;
  double winWidth = 0;
  @override
  Widget build(BuildContext context) {
    winHeight = MediaQuery.of(context).size.height;
    winWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.blue,
              height: 270,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 35,),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0,top: 10),
                      child: Image.asset("assets/logo.png",
                  height: winHeight * 0.1,),
                    ),
                    SizedBox(height: 15,),
                    Text("Millions of movies, TV shows and many more to discover and what's the Fab point, all is controlled at your FingerTips. Explore now...",
                    style: GoogleFonts.nunito(color: Colors.white, fontSize: 20),),
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: Container(
                 padding: EdgeInsets.only(top: 10),
                height: 50,
                child: Text(
                  "Let's get you Started!",
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.black,
                  ),
                ),

              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Constants.textField("Username", Icon(Icons.email),
                    textController: LoginEmailController,
                    ),
                    SizedBox(height: 10,),
                    Constants.textField("Password", Icon(Icons.password),
                        type: TextInputType.visiblePassword,
                        textController: LoginPasswordController,
                        suffixIconW: InkWell(
                          child: Icon(
                            _isHiddenPassword
                                ? Icons.visibility
                                : Icons.visibility_off,
                            size: 22,
                          ),
                          onTap: _togglePasswordView,
                        ),
                        isPassword: _isHiddenPassword
                    ),
                    SizedBox(height: 20,),
                    GestureDetector(
                      onTap: () {
                        LoginValidate();
                      },
                      child: Constants.btnContainer(
                        "Sign In",
                        winWidth * .4,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
  void LoginValidate() async {
    if (LoginEmailController.text.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(Constants.mySnackBar("Username cannot be Empty"));
    }
    else if (LoginEmailController.text.length < 6) {
      ScaffoldMessenger.of(context)
          .showSnackBar(Constants.mySnackBar("Username too Short"));

    }
    else if (LoginPasswordController.text.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(Constants.mySnackBar("Password cannot be Empty"));
    } else if (LoginPasswordController.text.length < 8) {
      ScaffoldMessenger.of(context)
          .showSnackBar(Constants.mySnackBar("Password too Short"));
    } else {
      try {
        if (LoginEmailController.text == "tmdbuser" && LoginPasswordController.text == "password") {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => Dashboard(),
              ),
                  (route) => false);
          setState(() {
            // Here you can write your code for open new view
          });
          Constants.messengerKey.currentState
              ?.showSnackBar(Constants.mySnackBar("SignIn Successful"));
        }
        else{
          Constants.messengerKey.currentState
              ?.showSnackBar(Constants.mySnackBar("Invalid Credentials"));
        }
      }
       catch (e) {
        Constants.messengerKey.currentState
            ?.showSnackBar(Constants.mySnackBar("Login Failed"));
      }
    }
    // Login Logic
  } // Validation for Login// Validation for Login

  void _togglePasswordView() {
    setState(() {
      _isHiddenPassword = !_isHiddenPassword;
    });
  }
}