import 'package:flutter/material.dart';
import 'package:confidease/styles/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

class Challenge extends StatefulWidget {
  const Challenge({Key? key}) : super(key: key);

  @override
  _ChallengeState createState() => _ChallengeState();
}

class _ChallengeState extends State<Challenge> {
  @override
  Widget build(BuildContext context) {
    //whole page
    return Scaffold(
      body: Column(
        children: [
          // Title Bar
          Container(
            padding: const EdgeInsets.only(top: 15, left: 15),

            height: 170,
            width: double.infinity,
            color: tertiary,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 130,
                  // height: 150,
                  margin: const EdgeInsets.only(top: 15),
                  child: Image(
                    image: AssetImage('images/mic-hand.png'),
                    // fit: BoxFit.contain,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Challenge",
                        style: GoogleFonts.sora(
                          height: 1.0,
                          fontSize: 40,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          decoration: TextDecoration.none,
                        ),
                      ),
                      Text(
                        "Time",
                        style: GoogleFonts.sora(
                          height: 1.0,
                          fontSize: 40,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          decoration: TextDecoration.none,
                        ),
                      ),
                      Text(
                        "Put your speech delivery skills",
                        style: GoogleFonts.sora(
                          height: 1.0,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                          decoration: TextDecoration.none,
                        ),
                      ),
                      Text(
                        "to the test!",
                        style: GoogleFonts.sora(
                          height: 1.0,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: tertiary,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            height: 50,
            width: double.infinity,
            color: tertiary,
            child: IconButton(
              icon: Icon(TablerIcons.arrow_left, color: Colors.black),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),

          // Body
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Title
              SizedBox(height: 20, width: double.infinity),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Text(
                  "Input Speech Parameters",
                  style: GoogleFonts.sora(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.none,
                  ),
                ),
              ),

              // Input Parameters Box
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 10,
                ),
                height: 250,
                width: 300,
                margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                decoration: BoxDecoration(
                  color: lightviolet,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black, width: 2),
                ),
                // inside the box
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    //Type of Audience
                    Container(
                      height: 25,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 2),
                      ),
                      margin: const EdgeInsets.only(
                        left: 20,
                        right: 20,
                        top: 5,
                      ),
                      child: Text(
                        "Type of Audience",
                        style: GoogleFonts.sora(
                          color: Colors.black,
                          fontSize: 10,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),
                    //Text Field: //Type of Audience
                    Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 5,
                      ),
                      child: SizedBox(
                        width: 250,
                        height: 30,
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            filled: true,
                            fillColor: quartenary,
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 10.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    //Speech Topic or Concept
                    Container(
                      height: 25,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 2),
                      ),
                      margin: const EdgeInsets.only(
                        left: 20,
                        right: 20,
                        top: 5,
                      ),
                      child: Text(
                        "Speech Topic or Concept",
                        style: GoogleFonts.sora(
                          color: Colors.black,
                          fontSize: 10,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),
                    //Text Field: Speech Topic or Concept
                    Container(
                      margin: const EdgeInsets.only(
                        left: 20,
                        right: 20,
                        top: 5,
                      ),
                      child: SizedBox(
                        width: 250,
                        height: 30,
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            filled: true,
                            fillColor: quartenary,
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 10.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    // Delivery Goal
                    Container(
                      height: 25,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 2),
                      ),
                      margin: EdgeInsets.only(left: 20, top: 10),
                      child: Text(
                        "Delivery Goal",
                        style: GoogleFonts.sora(
                          color: Colors.black,
                          fontSize: 10,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),
                    //Text Field: Delivery Goal
                    Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 5,
                      ),
                      child: SizedBox(
                        width: 250,
                        height: 30,
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            filled: true,
                            fillColor: quartenary,
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 10.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
