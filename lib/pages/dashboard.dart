import 'package:flutter/material.dart';
import 'package:confidease/styles/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:confidease/pages/hexaclipper.dart';

class Dashboard extends StatefulWidget {
  final String name;
  const Dashboard({super.key, required this.name});

  @override
  State<Dashboard> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<Dashboard> {
  // Avatar options (pwede palitan ng asset images or network images)
  final List<IconData> avatarOptions = [
    Icons.person,
    Icons.face,
    Icons.pets,
    Icons.tag_faces,
    Icons.account_circle,
  ];

  int selectedAvatarIndex = 0; // Current selected avatar

  //Dynamic data for the user
  int challengesCompleted = 0; // para sa "You did"
  String userLevel = "Beginner"; // para sa Level
  int xpPoints = 0; // para sa XP Points
  double progress = 0.0; // para sa progress bar (0.0 to 1.0)

  @override
  void initState() {
    super.initState();

    // Default (bagong user, walang progress)
    challengesCompleted = 0;
    userLevel = "Beginner";
    xpPoints = 0;
    progress = 0.0;
  }

  int selectedIndex = 0; // Pang-track ng alin ang selected

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Existing Body Code
      body: Stack(
        children: [
          // AppBar-like top area
          Container(
            height: 150, // taas ng appbar area
            color: primary,
            padding: EdgeInsets.only(left: 20, right: 20, top: 40, bottom: 30),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () => _showAvatarOptions(context),
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: secondary,
                    child: Icon(
                      avatarOptions[selectedAvatarIndex],
                      size: 36,
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
          ),

          // White body container na naka-overlay sa ilalim ng "AppBar"
          Container(
            margin: EdgeInsets.only(
              top: 120,
            ), // Ginawang overlay ang container sa ilalim ng appbar
            decoration: BoxDecoration(
              color: Colors.white, // Pinalitan ang kulay ng puti para lumutang
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), // Rounded top left
                topRight: Radius.circular(30), // Rounded top right
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12, // May shadow para may depth
                  blurRadius: 10,
                  offset: Offset(0, -5),
                ),
              ],
            ),
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Challenges, Level, XP Points
                Row(
                  children: [
                    // Challenges box (yellow)
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 157,
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.amber,
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

                            // CHALLENGES OF USER
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
                    // Level & XP boxes
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          Container(
                            width: 174,
                            height: 70,
                            decoration: BoxDecoration(
                              color: const Color(0xFFD0D0E8),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            padding: EdgeInsets.only(
                              left: 12,
                            ), // para di dikit sa gilid
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

                                //Level ni User logic
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
                            padding: EdgeInsets.only(
                              left: 12,
                            ), // para di dikit sa gilid
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

                                //points ni user
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

                SizedBox(height: 20),

                // Progress bar label
                Text(
                  'My Level Progress',
                  style: GoogleFonts.sora(
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF000000),
                    fontSize: 20,
                  ),
                ),

                SizedBox(height: 8),

                // Progress bar
                Container(
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.blueGrey[100],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Stack(
                    children: [
                      //progress ni user logic
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

                //Badges Section
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
                SizedBox(height: 12),

                // Scrollable Badges Row
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(8, (index) {
                      // pwede mong dagdagan count
                      return Container(
                        margin: EdgeInsets.only(right: 10),
                        child: HexagonBorder(
                          width: 100,
                          height: 100,
                          fillColor: secondary, // kulay ng hexagon
                          borderColor: Color(0xFF000000), // black border
                          borderWidth: 1, // kapal
                        ),
                      );
                    }),
                  ),
                ),

                SizedBox(height: 20),

                // === Locked Badges Section ===
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Locked Badges",
                      style: GoogleFonts.sora(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        color: Color(0xFF000000),
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
                SizedBox(height: 12),

                // Scrollable Locked Badges Row
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(8, (index) {
                      return Container(
                        margin: EdgeInsets.only(right: 10),
                        child: HexagonBorder(
                          width: 100,
                          height: 100,
                          fillColor: Color(0xFFD0D0E8), // kulay ng hexagon
                          borderColor: Color(0xFF000000), // black border
                          borderWidth: 1, // kapal
                        ),
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),
          //BOTTOM NAVBAR
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
                    Icons.dashboard,
                    Icons.book, //learners corner
                    Icons.flag, //challenge course (papalitan pa icon)
                    Icons.person, //profile (papalitan pa icon)
                    Icons.settings, //profile settings
                  ];

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index; //Update selected icon
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: selectedIndex == index
                            ? secondary //bg highlight
                            : Colors.transparent,
                        border: selectedIndex == index
                            ? Border.all(color: details, width: 2)
                            : null,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(icons[index], size: 30, color: quartenary),
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

  // Modal bottom sheet na nagpapakita ng avatar options
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
