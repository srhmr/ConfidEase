import 'package:flutter/material.dart';
import 'package:confidease/styles/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:confidease/pages/hexaclipper.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

class Dashboard extends StatefulWidget {
  final String name;
  const Dashboard({super.key, required this.name});

  @override
  State<Dashboard> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<Dashboard> {
  //pfp options
  final List<IconData> avatarOptions = [
    Icons.person,
    Icons.face_sharp,
    Icons.face,
    Icons.account_circle,
  ];

  int selectedAvatarIndex = 0;

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
    return Scaffold(
      backgroundColor: primary,
      body: Stack(
        children: [
          SafeArea(
            //Body
            child: Column(
                  children: [
                    SizedBox(height: 25),
                    //circle avatar
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () => _showAvatarOptions(context),
                                child: CircleAvatar(
                                  radius: 30,
                                  backgroundColor: secondary,
                                  child: Icon(
                                    avatarOptions[selectedAvatarIndex],
                                    size: 30,
                                    color: quartenary,
                                  ),
                                ),
                              ),
                              SizedBox(width: 16),
                              Text(
                                widget.name,
                                style: GoogleFonts.sora(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 24,
                                  color: quartenary,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                        child: Container(
                          color: quartenary,
                          child: SingleChildScrollView( //to scroll
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                
                                //Challenges
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(
                                        //size of the box
                                        width: 172,
                                        child: Container(
                                          height: 148,
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
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
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
                                      
                                              //User Challenges
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
                                  
                                  //Level
                                  SizedBox(width: 13),
                                  
                                  Expanded(
                                    flex: 1,
                                    child: Column(
                                      children: [
                                        SingleChildScrollView(
                                          child: Container(
                                            margin: EdgeInsets.only(bottom: 13),
                                            width: 174,
                                            height: 70,
                                            decoration: BoxDecoration(
                                              color: const Color(0xFFD0D0E8),
                                              borderRadius: BorderRadius.circular(
                                                8,
                                              ),
                                            ),
                                            padding: EdgeInsets.only(left: 12),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
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
                                                //level logic
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
                                        ),
                                  
                                        Container(
                                          width: 174,
                                          height: 70,
                                          decoration: BoxDecoration(
                                            color: const Color(0xFFD0D0E8),
                                            borderRadius: BorderRadius.circular(8),
                                          ),
                                          padding: EdgeInsets.only(left: 12),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
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
                                      ], //dulo
                                    ),
                                  ),
                                ],
                              ),
                                  
                              SizedBox(height: 20),
                              Text(
                                'My Level Progress',
                                style: GoogleFonts.sora(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20,
                                  color: Color(0xFF000000),
                                ),
                              ),
                              SizedBox(height: 8),
                              Container(
                                height: 40,
                                decoration: BoxDecoration(
                                  color: Colors.blueGrey[100],
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Stack(
                                  children: [
                                    //progress logic
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
                                        padding: EdgeInsetsGeometry.only(left: 12),
                                        child: Text(
                                          '${(progress * 100).toStringAsFixed(0)}%',
                                          //text percentage
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
                                  
                              SizedBox(height: 30),
                                  
                              //Badges
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'My Badges',
                                    style: GoogleFonts.sora(
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF000000),
                                      fontSize: 20,
                                    ),
                                  ),
                                  Text(
                                    "See All",
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
                                        width: 100,
                                        height: 100,
                                        fillColor: secondary,
                                        borderColor: Color(0xFF000000),
                                        borderWidth: 1,
                                      ),
                                    );
                                  }),
                                ),
                              ),
                              SizedBox(height: 20),
                              //Locked Badge
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
                              SizedBox(height: 12),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: List.generate(8, (index) {
                                    return Container(
                                      margin: EdgeInsets.only(right: 10),
                                      child: HexagonBorder(
                                        width: 100,
                                        height: 100,
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
                                        ),
                ),
                SizedBox(height: 77),
              ],
            ), 
          ),

          //Bottom Navbar
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 77,
              decoration: BoxDecoration(
                color: primary,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                border: Border.all(color: Color(0xFF000000), width: 1),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    offset: Offset(0, -3),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(5, (index) {
                  //List of ICONS
                  List<IconData> icons = [
                    TablerIcons.layout_dashboard,
                    TablerIcons.book_2,
                    TablerIcons.target_arrow,
                    TablerIcons.chart_bar,
                    TablerIcons.settings,
                  ];

                  // for update selected icon (selected index)
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: selectedIndex == index
                            ? secondary
                            : Colors.transparent,
                        border: selectedIndex == index
                            ? Border.all(color: details, width: 2)
                            : null,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(icons[index], size: 40, color: quartenary),
                    ),
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Avatar options
  void _showAvatarOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16),
          height: 220,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Choose your Avatar",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 16),
              Expanded(
                child: GridView.builder(
                  scrollDirection: Axis.horizontal,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    mainAxisSpacing: 16,
                    childAspectRatio: 1,
                  ),
                  itemCount: avatarOptions.length,
                  itemBuilder: (context, index) {
                    bool isSelected = index == selectedAvatarIndex;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedAvatarIndex = index;
                        });
                        Navigator.pop(context); // close modal
                      },
                      child: CircleAvatar(
                        radius: isSelected ? 36 : 28,
                        backgroundColor: isSelected
                            ? Colors.orange
                            : Colors.grey[300],
                        child: Icon(
                          avatarOptions[index],
                          size: isSelected ? 36 : 28,
                          color: isSelected ? Colors.white : Colors.black54,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}


