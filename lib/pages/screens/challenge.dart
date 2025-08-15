import 'package:confidease/pages/screens/upload_script.dart';
import 'package:flutter/material.dart';
import 'package:confidease/styles/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class Challenge extends StatefulWidget {
  const Challenge({super.key});

  @override
  State<Challenge> createState() => _ChallengeState();
}

class _ChallengeState extends State<Challenge> {
  String _selectedButton = '';

  Widget buildImageButton(
    String normalImage,
    String selectedImage,
    String buttonName,
    double imgHeight,
  ) {
    bool isSelected = _selectedButton == buttonName;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedButton = buttonName;
        });
      },
      child: Image.asset(
        isSelected ? selectedImage : normalImage,
        height: imgHeight,
        fit: BoxFit.contain,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Screen size
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final fontScale = screenWidth / 400; // text scaling factor

    return Scaffold(
      body: Column(
        children: [
          // Title Bar
          Container(
            height: screenHeight * 0.2,
            padding: EdgeInsets.all(screenWidth * 0.02),
            color: tertiary,
            child: Row(
              children: [
                SizedBox(
                  width: screenWidth * 0.3,
                  child: Image.asset(
                    'images/mic-hand.png',
                    fit: BoxFit.contain,
                  ),
                ),
                Expanded(
                  child: FittedBox(
                    alignment: Alignment.centerLeft,
                    fit: BoxFit.scaleDown,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Challenge",
                          style: GoogleFonts.sora(
                            fontSize: 38,
                            height: 1,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          "Time",
                          style: GoogleFonts.sora(
                            fontSize: 38,
                            height: 1,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          "Put your speech delivery skills to the test!",
                          style: GoogleFonts.sora(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Main Body
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Input Speech Parameters",
                        style: GoogleFonts.sora(
                          fontSize: 14 * fontScale,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          // Handle info button tap
                        },
                        child: Image.asset(
                          'images/info_btn.png',
                          height: screenHeight * 0.04,
                        ),
                      ),
                    ],
                  ),

                  // Input Box
                  Container(
                    padding: EdgeInsets.all(screenWidth * 0.03),
                    decoration: BoxDecoration(
                      color: lightviolet,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: primary, width: 1),
                    ),
                    child: Column(
                      children: [
                        buildLabel("Type of Audience", fontScale),
                        buildInputField(screenHeight, quartenary),
                        buildLabel("Speech Topic or Concept", fontScale),
                        buildInputField(screenHeight, quartenary),
                        buildLabel("Delivery Goal", fontScale),
                        buildInputField(screenHeight, quartenary),
                      ],
                    ),
                  ),

                  // Script Options
                  Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Speech Script",
                          style: GoogleFonts.sora(
                            fontSize: 14 * fontScale,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.01),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          buildScriptOption(
                            'images/script_btn.png',
                            'images/script_btn_hltd.png',
                            'script',
                            "Upload my",
                            "script",
                            fontScale,
                            screenHeight * 1.2,
                          ),
                          buildScriptOption(
                            'images/ai_btn.png',
                            'images/ai_btn_hltd.png',
                            'ai',
                            "Generate from",
                            "AI",
                            fontScale,
                            screenHeight * 1.2,
                          ),
                          buildScriptOption(
                            'images/impromptu_btn.png',
                            'images/impromptu_btn_hltd.png',
                            'impromptu',
                            "Impromptu/No",
                            "Script",
                            fontScale,
                            screenHeight * 1.2,
                          ),
                        ],
                      ),
                    ],
                  ),

                  // Start Button
                  SizedBox(
                    width: screenWidth * 0.6,
                    height: screenHeight * 0.06,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UploadScript(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: details,
                        side: const BorderSide(color: Colors.black, width: 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      child: Text(
                        "START CHALLENGE",
                        style: GoogleFonts.sora(
                          fontSize: 15 * fontScale,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildLabel(String text, double scale) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Text(
          text,
          style: GoogleFonts.sora(
            fontSize: 12 * scale,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget buildInputField(double screenHeight, Color fillColor) {
    return SizedBox(
      height: screenHeight * 0.045,
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          filled: true,
          fillColor: fillColor,
          contentPadding: const EdgeInsets.symmetric(horizontal: 10),
        ),
      ),
    );
  }

  Widget buildScriptOption(
    String img,
    String imgSelected,
    String name,
    String line1,
    String line2,
    double fontScale,
    double screenHeight,
  ) {
    return Column(
      children: [
        buildImageButton(img, imgSelected, name, screenHeight * 0.08),
        Text(
          line1,
          style: GoogleFonts.sora(
            fontSize: 10 * fontScale,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          line2,
          style: GoogleFonts.sora(
            fontSize: 10 * fontScale,
            height: 1,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
