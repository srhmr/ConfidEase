import 'package:flutter/material.dart';
import 'package:confidease/styles/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:confidease/pages/screens/final_script.dart';

class ImproveScript extends StatefulWidget {
  const ImproveScript({super.key});

  @override
  State<ImproveScript> createState() => _ImproveScriptState();
}

class _ImproveScriptState extends State<ImproveScript> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // align to left
          children: [
            // Title
            Container(
              margin: EdgeInsets.only(
                top: screenHeight * 0.02,
                left: screenWidth * 0.05,
              ),
              child: Text(
                'Let\'s improve the\nspeech!',
                style: GoogleFonts.sora(
                  fontSize: screenWidth * 0.06, // responsive font size
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),

            // Subtitle
            Container(
              margin: EdgeInsets.only(
                left: screenWidth * 0.05,
                top: screenHeight * 0.005,
              ),
              child: Text(
                'Here\'s a suggested revised version for your\nspeech.',
                style: GoogleFonts.sora(
                  fontSize: screenWidth * 0.035,
                  color: Colors.black,
                ),
              ),
            ),

            // Scrollable Text Box
            Expanded(
              child: ScrollbarTheme(
                data: ScrollbarThemeData(
                  thumbColor: WidgetStateProperty.all(secondary),
                  thickness: WidgetStateProperty.all(6),
                  radius: const Radius.circular(8),
                ),
                child: Container(
                  width: screenWidth * 0.85, // responsive width
                  height: screenHeight * 0.35, // responsive height
                  margin: EdgeInsets.symmetric(
                    vertical: screenHeight * 0.03,
                    horizontal: screenWidth * 0.07,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.black),
                  ),
                  child: Scrollbar(
                    controller: _scrollController,
                    thumbVisibility: true,
                    child: SingleChildScrollView(
                      controller: _scrollController,
                      child: Padding(
                        padding: EdgeInsets.all(screenWidth * 0.03),
                        child: Text(
                          'Good day everyone,\n'
                          'Politics might sound like a topic for adults, but the truth is, it affects us all — including you, the youth. In the Philippines today, we see many political issues: corruption scandals, debates on government transparency, concerns about human rights, environmental neglect, and the quality of education. These issues may seem far from your daily life, but they shape the world you\'re growing into.\n\n'
                          'Corruption, for example, isn\'t just about politicians taking money. It can mean fewer classrooms, outdated school materials, and limited opportunities for the future. Environmental policies aren\'t just about laws — they affect the air you breathe, the water you drink, and the communities you live in.\n\n'
                          'But here\'s the important part: you are not powerless. Even if you\'re not yet voting, you can think critically, ask questions, and stay informed. Social media gives you a voice — use it wisely. Learn to check facts before sharing information. Listen to different perspectives, and don\'t be afraid to stand for what\'s right.\n\n'
                          'Our nation\'s future doesn\'t just depend on those in office — it depends on citizens who care, speak up, and act. You are the next generation of leaders, and the choices you make today — in how you think, communicate, and dream — will shape the Philippines of tomorrow.\n\n'
                          'So be aware. Be involved. And most importantly, be the kind of Filipino who doesn\'t just watch history happen, but helps write it.\n\n'
                          'Thank you.',
                          style: GoogleFonts.sora(
                            fontSize:
                                screenWidth * 0.04, // responsive text size
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            Center(
              child: SizedBox(
                width: screenWidth * 0.6,
                height: screenHeight * 0.06,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FinalScript()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                      vertical: screenHeight * 0.015,
                      horizontal: screenWidth * 0.05,
                    ),
                    side: const BorderSide(color: Colors.black, width: 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    backgroundColor: details,
                  ),
                  child: Text(
                    "SURE, LET\'S USE THIS!",
                    style: GoogleFonts.sora(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: screenWidth * 0.04,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            Center(
              child: SizedBox(
                width: screenWidth * 0.6,
                height: screenHeight * 0.06,
                child: ElevatedButton(
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => ImproveScript()),
                    // );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                      vertical: screenHeight * 0.015,
                      horizontal: screenWidth * 0.05,
                    ),
                    side: const BorderSide(color: Colors.black, width: 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    backgroundColor: lightgrey,
                  ),
                  child: Text(
                    "NO, THANKS!",
                    style: GoogleFonts.sora(
                      color: details,
                      fontWeight: FontWeight.w600,
                      fontSize: screenWidth * 0.04,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
