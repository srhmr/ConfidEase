import 'package:flutter/material.dart';
import 'package:confidease/styles/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:confidease/pages/hexaclipper.dart';

class FirstScreen extends StatefulWidget {
  final String name;
  const FirstScreen({super.key, required this.name});

  @override
  State<FirstScreen> createState() => _FirstScreenPageState();
}

class _FirstScreenPageState extends State<FirstScreen> {
  //levels of challenges (Rookie, RisingStar, SportlightSeeker, VocalAce, CrowdCharmer, CertifiedOrator, MicMaster)
  int challengesCompleted = 0;
  String userLevel = "";
  int xpPoints = 0;
  double progress = 0.0;

  @override
  void initState() {
    super.initState();

    challengesCompleted = 0;
    userLevel = '';
    xpPoints = 0;
    progress = 0.0;
  }

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            height: 140,
            color: primary,
            padding: EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 40),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: secondary,
                  child: Icon(Icons.person, size: 35, color: quartenary),
                ),
                SizedBox(width: 16),
                Text(
                  widget.name,
                  style: GoogleFonts.sora(
                    fontWeight: FontWeight.w700,
                    fontSize: 21,
                    color: quartenary,
                  ),
                ),
              ],
            ),
          ),

    Expanded(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          margin: EdgeInsets.only(top: 120, bottom: 0),
          decoration: BoxDecoration(
            color: quartenary,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10,
                offset: Offset(0, -5),
              ),
            ],
          ),
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Challenges, Level, XP
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 157,
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: secondary,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Color(0xFF000000), width: 1),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'You did',
                            style: GoogleFonts.sora(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF000000),
                            ),
                          ),
      
                          Text(
                            '$challengesCompleted Challenges',
                            style: GoogleFonts.sora(
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                              color: Color(0xFF000000),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
      
                  SizedBox(width: 13),
      
                  //Level
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        Container(
                          width: 174,
                          height: 70,
                          decoration: BoxDecoration(
                            color: Color(0xFFD0D0E8),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: EdgeInsets.only(left: 12),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Level',
                                style: GoogleFonts.sora(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: Color(0xFF000000),
                                ),
                              ),
      
                              SizedBox(height: 6),
      
                              //levels logic
                              Text(
                                userLevel,
                                style: GoogleFonts.sora(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20,
                                  color: Color(0xFF000000),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 16),
                        Container(
                          width: 174,
                          height: 70,
                          decoration: BoxDecoration(
                            color: const Color(0xFFD0D0E8),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: EdgeInsets.only(left: 12),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'XP Points',
                                style: GoogleFonts.sora(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: Color(0xFF000000),
                                ),
                              ),
      
                              SizedBox(height: 6),
      
                              Text(
                                '$xpPoints',
                                style: GoogleFonts.sora(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20,
                                  color: Color(0xFF000000),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
      
              SizedBox(height: 30),
      
              //Progress
              Text(
                'My Level Progress',
                style: GoogleFonts.sora(
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF000000),
                  fontSize: 20,
                ),
              ),
      
              SizedBox(height: 8),
              //Progress Bar
              Container(
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.blueGrey[100],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Stack(
                  children: [
                    FractionallySizedBox(
                      widthFactor: progress,
                      child: Container(
                        decoration: BoxDecoration(
                          color: primary,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Color(0xFF000000), width: 1),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 12),
                        child: Text(
                          '${(progress * 100).toStringAsFixed(0)}%', //percentage
                          style: GoogleFonts.sora(
                            color: const Color(0xFFD0D0E8),
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
      
              SizedBox(height: 40),
      
              //Badges
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'My Badges',
                    style: GoogleFonts.sora(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      color: Color(0xFF000000),
                    ),
                  ),
                  Text(
                    'See All',
                    style: GoogleFonts.sora(
                      fontWeight: FontWeight.w300,
                      fontSize: 16,
                      color: Color(0xFF000000),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
      
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(8, (index) {
                    return Container(
                      margin: EdgeInsets.only(right: 10),
                      child: HexagonBorder(
                        width: 120,
                        height: 120,
                        fillColor: secondary,
                        borderColor: Color(0xFF000000),
                        borderWidth: 1,
                      ),
                    );
                  }),
                ),
              ),
      
              SizedBox(height: 15),

      
              //Locked Badges
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Locked Badges',
                    style: GoogleFonts.sora(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      color: Color(0xFF000000),
                    ),
                  ),
                  Text(
                    'See All',
                    style: GoogleFonts.sora(
                      fontWeight: FontWeight.w300,
                      fontSize: 16,
                      color: Color(0xFF000000),
                    ),
                  ),
                ],
              ),
      
              SizedBox(height: 15),
      
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(8, (index) {
                    return Container(
                      margin: EdgeInsets.only(right: 10),
                      child: HexagonBorder(
                        width: 120,
                        height: 120,
                        fillColor: Color(0xFFD0D0E8),
                        borderColor: Color(0xFF000000),
                        borderWidth: 1,
                      ),
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    ),

      ],
    );
  }
}
