import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'persuasive_learners.dart';
import 'learners_popup.dart';
import 'f_speech1.dart';

class Learners extends StatefulWidget {
  const Learners({super.key});

  @override
  State<Learners> createState() => _LearnersState();
}

class _LearnersState extends State<Learners> {
  final Color tertiary = const Color(0xFFFFF7D0);

  bool showMoreSpeechTypes = false;
  bool showMoreAudienceTypes = false;
  bool showMoreFamousSpeeches = false;

  Widget buildCategoryButton({
    required String text,
    required String imagePath,
    required VoidCallback onTap,
    required double buttonWidth,
  }) {
    bool isYellowCategory =
        text == "Persuasive Speech" || text == "Entertaining Speech";
    bool isYellowAudience =
        text == "Students" || text == "Family or Friends";

    return GestureDetector(
      onTap: () {
        if (text == "Persuasive Speech") {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const TypesOfSpeechScreen(),
            ),
          );
        }
        onTap();
      },
      child: Container(
        width: buttonWidth,
        height: 70,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: (isYellowCategory || isYellowAudience)
              ? const Color(0xFFFFF7D0)
              : const Color(0xFFDADBF3),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.black12),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 28,
              height: 28,
              child: Image.asset(imagePath, fit: BoxFit.contain),
            ),
            const SizedBox(width: 8),
            Flexible(
              child: Text(
                text,
                style: GoogleFonts.sora(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMoreButton(VoidCallback onTap) {
    return Align(
      alignment: Alignment.centerRight,
      child: GestureDetector(
        onTap: onTap,
        child: Text(
          "More",
          style: GoogleFonts.sora(
            fontSize: 10,
            fontWeight: FontWeight.w500,
            color: Colors.grey,
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    );
  }

  Widget buildLessButton(VoidCallback onTap) {
    return Align(
      alignment: Alignment.centerRight,
      child: GestureDetector(
        onTap: onTap,
        child: Text(
          "Less",
          style: GoogleFonts.sora(
            fontSize: 10,
            fontWeight: FontWeight.w500,
            color: Colors.grey,
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    );
  }

  Widget buildSpeechCard({
    required String title,
    required String speaker,
    required Color color,
    required Color iconColor,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: color,
          border: Border.all(color: Colors.black12),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.sora(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    speaker,
                    style: GoogleFonts.sora(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              TablerIcons.player_play,
              color: iconColor,
              size: 28,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double horizontalPadding = 16;
    double spacing = 10;
    double buttonWidth =
        (screenWidth - (horizontalPadding * 2) - spacing) / 2;

    return Scaffold(
      backgroundColor: const Color(0xFFF9F9FA),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header
            Container(
              padding:
                  const EdgeInsets.only(top: 15, left: 15, right: 15),
              height: 150,
              width: double.infinity,
              color: tertiary,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 100,
                    margin: const EdgeInsets.only(top: 10),
                    child: const Image(
                      image: AssetImage('images/learners.png'),
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(top: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Learner's",
                              style: GoogleFonts.sora(
                                  height: 1.0,
                                  fontSize: 32,
                                  fontWeight: FontWeight.w600)),
                          Text("Corners",
                              style: GoogleFonts.sora(
                                  height: 1.0,
                                  fontSize: 32,
                                  fontWeight: FontWeight.w600)),
                          const SizedBox(height: 6),
                          Text(
                            "Get better with public speaking by learning the tips and tricks",
                            style: GoogleFonts.sora(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Colors.black87),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Content
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Types of Speech
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Types of speech",
                          style: GoogleFonts.sora(
                              fontSize: 12, fontWeight: FontWeight.w600)),
                      GestureDetector(
                        onTap: () => showDialog(
                          context: context,
                          builder: (context) => const LearnersPopup(),
                        ),
                        child: Image.asset('images/info_btn.png', height: 35),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Wrap(
                    spacing: spacing,
                    runSpacing: 10,
                    children: [
                      buildCategoryButton(
                        text: "Persuasive Speech",
                        imagePath: 'images/persuade.png',
                        onTap: () {},
                        buttonWidth: buttonWidth,
                      ),
                      buildCategoryButton(
                        text: "Informative Speech",
                        imagePath: 'images/inform.png',
                        onTap: () {},
                        buttonWidth: buttonWidth,
                      ),
                      buildCategoryButton(
                        text: "Impromptu Speech",
                        imagePath: 'images/impromptu.png',
                        onTap: () {},
                        buttonWidth: buttonWidth,
                      ),
                      buildCategoryButton(
                        text: "Entertaining Speech",
                        imagePath: 'images/entertain.png',
                        onTap: () {},
                        buttonWidth: buttonWidth,
                      ),
                      if (showMoreSpeechTypes) ...[
                        buildCategoryButton(
                          text: "Debate Speech",
                          imagePath: 'images/debate.png',
                          onTap: () {},
                          buttonWidth: buttonWidth,
                        ),
                        buildCategoryButton(
                          text: "Special Occasion Speech",
                          imagePath: 'images/occasion.png',
                          onTap: () {},
                          buttonWidth: buttonWidth,
                        ),
                        buildCategoryButton(
                          text: "Motivational Speech",
                          imagePath: 'images/motivational.png',
                          onTap: () {},
                          buttonWidth: buttonWidth,
                        ),
                        buildCategoryButton(
                          text: "Demonstrative Speech",
                          imagePath: 'images/demo.png',
                          onTap: () {},
                          buttonWidth: buttonWidth,
                        ),
                      ],
                    ],
                  ),
                  const SizedBox(height: 4),
                  buildMoreButton(() {
                    setState(() => showMoreSpeechTypes = !showMoreSpeechTypes);
                  }),

                  const SizedBox(height: 20),

                  // Audience Type
                  Text("Audience Type",
                      style: GoogleFonts.sora(
                          fontSize: 12, fontWeight: FontWeight.w600)),
                  const SizedBox(height: 10),
                  Wrap(
                    spacing: spacing,
                    runSpacing: 10,
                    children: [
                      buildCategoryButton(
                        text: "Students",
                        imagePath: 'images/students.png',
                        onTap: () {},
                        buttonWidth: buttonWidth,
                      ),
                      buildCategoryButton(
                        text: "Employees",
                        imagePath: 'images/employee.png',
                        onTap: () {},
                        buttonWidth: buttonWidth,
                      ),
                      buildCategoryButton(
                        text: "Kids",
                        imagePath: 'images/kids.png',
                        onTap: () {},
                        buttonWidth: buttonWidth,
                      ),
                      buildCategoryButton(
                        text: "Family or Friends",
                        imagePath: 'images/family.png',
                        onTap: () {},
                        buttonWidth: buttonWidth,
                      ),
                      if (showMoreAudienceTypes) ...[
                        buildCategoryButton(
                          text: "Teachers",
                          imagePath: 'images/teacher.png',
                          onTap: () {},
                          buttonWidth: buttonWidth,
                        ),
                        buildCategoryButton(
                          text: "Community",
                          imagePath: 'images/community.png',
                          onTap: () {},
                          buttonWidth: buttonWidth,
                        ),
                        buildCategoryButton(
                          text: "Professionals",
                          imagePath: 'images/professionals.png',
                          onTap: () {},
                          buttonWidth: buttonWidth,
                        ),
                        buildCategoryButton(
                          text: "Online Audience",
                          imagePath: 'images/online.png',
                          onTap: () {},
                          buttonWidth: buttonWidth,
                        ),
                      ],
                    ],
                  ),
                  const SizedBox(height: 4),
                  buildMoreButton(() {
                    setState(() => showMoreAudienceTypes = !showMoreAudienceTypes);
                  }),

                  const SizedBox(height: 20),

                  // Famous Speeches
                  Text("Famous Speeches",
                      style: GoogleFonts.sora(
                          fontSize: 12, fontWeight: FontWeight.w600)),
                  const SizedBox(height: 10),
                  buildSpeechCard(
                    title: "Day of Infamy",
                    speaker: "Franklin D. Roosevelt",
                    color: const Color(0xFFDADBF3),
                    iconColor: const Color(0xFF7E81D4),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const FamousSpeechDetailScreen(
                            title: "Day of Infamy",
                            speaker: "Franklin D. Roosevelt",
                            description:
                                "A historic speech delivered on December 7, 1941, following the attack on Pearl Harbor, rallying the United States into World War II.",
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 10),
                  if (!showMoreFamousSpeeches)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        buildSpeechCard(
                          title: "To The People of the Philippines",
                          speaker: "General Douglas McArthur",
                          color: const Color(0xFFFFF7D0),
                          iconColor: Colors.yellow[700]!,
                          onTap: () {},
                        ),
                        const SizedBox(height: 4),
                        buildMoreButton(() {
                          setState(() => showMoreFamousSpeeches = true);
                        }),
                      ],
                    )
                  else ...[
                    buildSpeechCard(
                      title: "To The People of the Philippines",
                      speaker: "General Douglas McArthur",
                      color: const Color(0xFFFFF7D0),
                      iconColor: Colors.yellow[700]!,
                      onTap: () {},
                    ),
                    const SizedBox(height: 10),
                    buildSpeechCard(
                      title: "I Have a Dream",
                      speaker: "Martin Luther King Jr.",
                      color: const Color(0xFFDADBF3),
                      iconColor: const Color(0xFF7E81D4),
                      onTap: () {},
                    ),
                    const SizedBox(height: 10),
                    buildSpeechCard(
                      title: "We Shall Fight on the Beaches",
                      speaker: "Winston Churchill",
                      color: const Color(0xFFFFF7D0),
                      iconColor: Colors.yellow[700]!,
                      onTap: () {},
                    ),
                    const SizedBox(height: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        buildSpeechCard(
                          title: "The Gettysburg Address",
                          speaker: "Abraham Lincoln",
                          color: const Color(0xFFDADBF3),
                          iconColor: const Color(0xFF7E81D4),
                          onTap: () {},
                        ),
                        const SizedBox(height: 4),
                        buildLessButton(() {
                          setState(() => showMoreFamousSpeeches = false);
                        }),
                      ],
                    ),
                  ]
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
