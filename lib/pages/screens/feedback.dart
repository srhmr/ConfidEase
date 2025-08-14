import 'package:confidease/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FeedbackPage extends StatefulWidget {
  const FeedbackPage({super.key});

  @override
  State<FeedbackPage> createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
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
              width: screenWidth * 1, // responsive width
              height: screenHeight * 0.2, // responsive height
              decoration: BoxDecoration(
                color: secondary,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(85),
                  bottomRight: Radius.circular(85),
                ),
                border: Border.all(color: Colors.black, width: 1),
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: primary,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(85),
                    bottomRight: Radius.circular(85),
                  ),
                  border: Border.all(color: Colors.black, width: 1),
                ),
                margin: EdgeInsets.only(
                  left: screenWidth * 0.05,
                  right: screenWidth * 0.05,
                  bottom: screenHeight * 0.025,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        // Outline
                        Text(
                          "WELL DONE!",
                          style: GoogleFonts.sora(
                            textStyle: TextStyle(
                              fontSize:
                                  screenWidth * 0.12, // responsive font size
                              fontWeight: FontWeight.bold,
                              foreground: Paint()
                                ..style = PaintingStyle.stroke
                                ..strokeWidth = 3
                                ..color = Colors.black, // Outline color
                            ),
                          ),
                        ),
                        // Fill
                        Text(
                          "WELL DONE!",
                          style: GoogleFonts.sora(
                            textStyle: TextStyle(
                              fontSize:
                                  screenWidth * 0.12, // responsive font size
                              fontWeight: FontWeight.bold,
                              color: Colors.white, // Fill color
                            ),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      'Give yourself a pat on the back!',
                      style: GoogleFonts.sora(
                        fontSize: screenWidth * 0.03, // responsive font size
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              margin: EdgeInsets.only(
                right: screenWidth * 0.08,
                top: screenHeight * 0.02,
              ),
              child: GestureDetector(
                onTap: () {
                  // Handle info button tap
                },
                child: Image.asset(
                  'images/info_btn.png',
                  height: screenHeight * 0.04,
                ),
              ),
            ),

            // Subtitle
            Container(
              width: screenWidth * 0.85,
              height: screenHeight * 0.25,
              margin: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.08,
                vertical: screenHeight * 0.009,
              ),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 1),
                borderRadius: BorderRadius.circular(5),
                color: tertiary,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      vertical: screenHeight * 0.005,
                      horizontal: screenWidth * 0.05,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Criteria',
                          style: GoogleFonts.sora(
                            fontSize: screenWidth * 0.03,
                            color: const Color.fromARGB(255, 104, 104, 104),
                          ),
                        ),
                        Text(
                          'Points',
                          style: GoogleFonts.sora(
                            fontSize: screenWidth * 0.03,
                            color: const Color.fromARGB(255, 104, 104, 104),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.003),
                  Container(
                    padding: EdgeInsets.only(
                      right: screenWidth * 0.09,
                      left: screenWidth * 0.05,
                      bottom: screenHeight * 0.006,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Tone Delivery',
                          style: GoogleFonts.sora(
                            fontWeight: FontWeight.w600,
                            fontSize: screenWidth * 0.035,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          '5',
                          style: GoogleFonts.sora(
                            fontSize: screenWidth * 0.035,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    color: lightgrey,
                    thickness: 1,
                    height: 0,
                    indent: screenHeight * 0.02,
                    endIndent: screenHeight * 0.02,
                  ),

                  SizedBox(height: screenHeight * 0.003),
                  Container(
                    padding: EdgeInsets.only(
                      right: screenWidth * 0.09,
                      left: screenWidth * 0.05,
                      bottom: screenHeight * 0.006,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Clarity',
                          style: GoogleFonts.sora(
                            fontWeight: FontWeight.w600,
                            fontSize: screenWidth * 0.035,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          '5',
                          style: GoogleFonts.sora(
                            fontSize: screenWidth * 0.035,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    color: lightgrey,
                    thickness: 1,
                    height: 0,
                    indent: screenHeight * 0.02,
                    endIndent: screenHeight * 0.02,
                  ),
                  SizedBox(height: screenHeight * 0.003),
                  Container(
                    padding: EdgeInsets.only(
                      right: screenWidth * 0.09,
                      left: screenWidth * 0.05,
                      bottom: screenHeight * 0.006,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Pacing',
                          style: GoogleFonts.sora(
                            fontWeight: FontWeight.w600,
                            fontSize: screenWidth * 0.035,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          '5',
                          style: GoogleFonts.sora(
                            fontSize: screenWidth * 0.035,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    color: lightgrey,
                    thickness: 1,
                    height: 0,
                    indent: screenHeight * 0.02,
                    endIndent: screenHeight * 0.02,
                  ),
                  SizedBox(height: screenHeight * 0.003),
                  Container(
                    padding: EdgeInsets.only(
                      right: screenWidth * 0.09,
                      left: screenWidth * 0.05,
                      bottom: screenHeight * 0.006,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Emotions',
                          style: GoogleFonts.sora(
                            fontWeight: FontWeight.w600,
                            fontSize: screenWidth * 0.035,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          '5',
                          style: GoogleFonts.sora(
                            fontSize: screenWidth * 0.035,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
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
                  height: screenHeight * 0.2, // responsive height
                  margin: EdgeInsets.only(
                    top: screenHeight * 0.01,
                    left: screenWidth * 0.07,
                    right: screenWidth * 0.07,
                    bottom: screenHeight * 0.02,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
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
                                screenWidth * 0.035, // responsive text size
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: screenWidth * 0.4,
                  height: screenHeight * 0.05,
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => ImproveScript()),
                      // );
                    },
                    style: ElevatedButton.styleFrom(
                      side: const BorderSide(color: Colors.black, width: 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      backgroundColor: tertiary,
                    ),
                    child: Text(
                      "TRY AGAIN",
                      style: GoogleFonts.sora(
                        color: details,
                        fontWeight: FontWeight.w600,
                        fontSize: screenWidth * 0.035,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: screenWidth * 0.4,
                  height: screenHeight * 0.05,
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => ImproveScript()),
                      // );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.001,
                      ),
                      side: const BorderSide(color: Colors.black, width: 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      backgroundColor: details,
                    ),
                    child: Text(
                      "END CHALLENGE",
                      style: GoogleFonts.sora(
                        color: quartenary,
                        fontWeight: FontWeight.w600,
                        fontSize: screenWidth * 0.035,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
