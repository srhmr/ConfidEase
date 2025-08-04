import 'package:flutter/material.dart';
import 'package:confidease/styles/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: primary,
             appBar: AppBar(
        backgroundColor: primary,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              color: details,
              shape: BoxShape.circle,
              border: Border.all(color: Color(0xFF000000), width: 1),
            ),
            child: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color:Color(0xFF000000),
                size: 20,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 400,
                height: 150,
                margin: EdgeInsets.only(top: 40, bottom: 10),
                // padding: EdgeInsets.all(10),
                child: Image(image: AssetImage('images/soundwave1.png')),
              ),

              Container(
                margin: EdgeInsets.only(left: 50, right: 50),
                // padding: EdgeInsets.only(left: 20, right: 20),
                // color: Colors.white,
                width: 350,
                child: Text(
                  "WELCOME BACK",
                  style: GoogleFonts.sora(
                    fontWeight: FontWeight.w700,
                    fontSize: 30,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

              Container(
                margin: EdgeInsets.only(left: 50, right: 50),
                width: 350,
                child: Text(
                  "Login to your account",
                  style: TextStyle(color: Colors.white, fontSize: 12),
                  textAlign: TextAlign.center,
                ),
              ),

              Container(
                margin: EdgeInsets.only(top: 50),
                width: 300,
                child: Text(
                  "Email Address",
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),

            //TEXT FIELD
              Container(
                width: 300,
                height: 40,
                margin: EdgeInsets.only(top: 5),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: quartenary,
                    contentPadding: EdgeInsets.symmetric(horizontal: 12.0),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: const Color(0xFFFFC419), width: 2),
                    ),
                  ),
                ),
              ),

              Container(
                margin: EdgeInsets.only(top: 10),
                width: 300,
                child: Text(
                  "Password",
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
              
              //TEXT FIELD
              Container(
                width: 300,
                height: 40,
                margin: EdgeInsets.only(top: 5, bottom: 25),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: quartenary,
                    contentPadding: EdgeInsets.symmetric(horizontal: 12.0),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: const Color(0xFFFFC419), width: 2),
                    ),
                  ),
                ),
              ),

              Container(
                width: 100,
                height: 50,
                margin: EdgeInsets.only(bottom: 25),
                child: ElevatedButton(
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => Login()),
                    // );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                    side: BorderSide(color: Colors.black, width: 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    backgroundColor: details,
                  ),
                  child: Text(
                    "Login",
                    style: GoogleFonts.sora(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}