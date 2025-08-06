import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:confidease/styles/colors.dart';

// import 'package:confidease/pages/login.dart';
// import 'package:confidease/pages/signup.dart';
// import 'package:confidease/pages/dashboard.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          Container(
            width: 300,
            height: 300,
            margin: EdgeInsets.only(right: 50, left: 50, bottom: 80, top: 40),

            child: Image(image: AssetImage('images/chosen1.png')),
          ),

          Container(
            width: 300,
            height: 50,
            margin: EdgeInsets.only(bottom: 25),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
              style: ElevatedButton.styleFrom(
                side: BorderSide(color: Colors.black, width: 1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                backgroundColor: details,
              ),
              child: Text(
                'Login',
                style: GoogleFonts.sora(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ),

          Container(
            width: 300,
            height: 50,
            margin: EdgeInsets.only(bottom: 25),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/signup');
              },
              style: ElevatedButton.styleFrom(
                side: BorderSide(color: Colors.black, width: 1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                backgroundColor: secondary,
              ),
              child: Text(
                'Sign Up',
                style: GoogleFonts.sora(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: details,
                ),
              ),
            ),
          ), 
        ],
      ),
      backgroundColor: primary,
    );
  }
}

