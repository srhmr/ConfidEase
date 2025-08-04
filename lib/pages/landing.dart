import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:confidease/pages/login.dart';
import 'package:confidease/pages/signup.dart';
import 'package:confidease/styles/colors.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          Container(
            width: 300,
            height: 300,
            margin: EdgeInsets.only(right: 50, left: 50, bottom: 50, top: 120),

            child: Image(image: AssetImage('images/chosen1.png')),
          ),

          Container(
            width: 300,
            height: 50,
            margin: EdgeInsets.only(bottom: 25),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
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
                Navigator.push(
                    // para clickable yung button
                    context,
                    MaterialPageRoute(builder: (context) => const SignupPage()),
                );
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
                  fontWeight: FontWeight.w400,
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
