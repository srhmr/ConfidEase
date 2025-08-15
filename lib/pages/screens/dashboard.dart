import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:confidease/pages/badges.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:confidease/styles/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:confidease/pages/hexaclipper.dart';

class Dashboard extends StatefulWidget {
  final String name;
  const Dashboard({super.key, required this.name});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  //levels of challenges (Rookie, RisingStar, SportlightSeeker, VocalAce, CrowdCharmer, CertifiedOrator, MicMaster)
  int challengesCompleted = 0;
  String userLevel = "";
  int xpPoints = 0;
  double progress = 0.0;
  int maxDisplay = 6;

  List<String> badges = [
    'Rookie',  //1
    'Rising Star', //2
    'Spotlight Seeker', //3
    'Vocal Ace', //4
    'Crowd Charmer',  //5
    'Certified Orator',  //6
    'Mic Master',  //7
    'Stage Pro',  //8
    'Audience Magnet', //9
    'Pitch Perfect', //10
    'Confidence King', //11
    'Speech Guru',  //12
    'Debate Star',  //13
    'Persuader',  //14
    'Orator Extraordinaire',  //15
  ];

  @override
  void initState() {
    super.initState();

    //badges list
    //badges = List.generate(6, (index) => 'Badge ${index + 1}'); // sample data

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
              StreamBuilder<DocumentSnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('user')
                    .doc(FirebaseAuth.instance.currentUser!.uid)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return CircleAvatar(
                      radius: 30,
                      backgroundColor: secondary,
                      child: Icon(Icons.person_2, size: 40, color: quartenary),
                    );
                  }

                  var userData = snapshot.data!.data() as Map<String, dynamic>?;

                  return CircleAvatar(
                    radius: 35,
                    backgroundColor: secondary,
                    backgroundImage: NetworkImage(
                      userData?['avatar'] ??
                          'https://i.pinimg.com/736x/20/66/99/206699b44b5cbe16450c19da611d73c7.jpg',
                    ),
                  );
                },
              ),

              SizedBox(width: 16),
              Text(
                widget.name,
                style: GoogleFonts.sora(
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
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
                            border: Border.all(
                              color: Color(0xFF000000),
                              width: 1,
                            ),
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
                              border: Border.all(
                                color: Color(0xFF000000),
                                width: 1,
                              ),
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
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Badges()),
                          );
                        },
                        child: Text(
                          'See All',
                          style: GoogleFonts.sora(
                            fontWeight: FontWeight.w300,
                            fontSize: 16,
                            color: Color(0xFF000000),
                          ),
                        ),
                      ),
                    ],
                  ),

                  //SizedBox(height: 0),
                  GridView.count(
                    padding: const EdgeInsets.all(5),
                    crossAxisCount: 3, // dito lang sa count
                    mainAxisSpacing: 30,
                    crossAxisSpacing: 10,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: List.generate(
                      badges.length > maxDisplay ? maxDisplay : badges.length,
                      (index) {
                        bool unlocked = index < 1; // sample unlocked logic
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            HexagonBorder(
                              width: 85,
                              height: 85,
                              fillColor: unlocked ? secondary : lightgrey,
                              borderColor: Color(0xFF000000),
                              borderWidth: 1,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              badges[index],
                              style: GoogleFonts.sofiaSans(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: unlocked ? Colors.black : Colors.grey,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        );
                      },
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
