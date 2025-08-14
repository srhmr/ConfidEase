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
            padding: const EdgeInsets.only(top: 15, left: 15),

            height: 150,
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

          // Body
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  margin: const EdgeInsets.only(right: 20, top: 10),
                  child: GestureDetector(
                    onTap: () => {},
                    child: Image.asset('images/info_btn.png', height: 35),
                  ),
                ),
              ),
              //Title
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
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
                  vertical: 10,
                  horizontal: 10,
                ),
                height: 220,
                width: 350,
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                decoration: BoxDecoration(
                  color: lightviolet,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: primary, width: 1),
                ),

                // inside the box
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    //Type of Audience
                    Container(
                      height: 25,

                      margin: const EdgeInsets.only(
                        left: 20,
                        right: 20,
                        top: 5,
                      ),
                      child: Text(
                        "Type of Audience",
                        style: GoogleFonts.sora(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),
                    //Text Field: //Type of Audience
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      child: SizedBox(
                        width: 300,
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

                      margin: const EdgeInsets.only(
                        left: 20,
                        right: 20,
                        top: 5,
                      ),
                      child: Text(
                        "Speech Topic or Concept",
                        style: GoogleFonts.sora(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),
                    //Text Field: Speech Topic or Concept
                    Container(
                      margin: const EdgeInsets.only(left: 20, right: 20),
                      child: SizedBox(
                        width: 300,
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

                      margin: EdgeInsets.only(left: 20, top: 10),
                      child: Text(
                        "Delivery Goal",
                        style: GoogleFonts.sora(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),
                    //Text Field: Delivery Goal
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      child: SizedBox(
                        width: 300,
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

              Container(
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        margin: const EdgeInsets.only(
                          left: 20,
                          top: 10,
                          bottom: 5,
                        ),
                        child: Text(
                          "Speech Script",
                          style: GoogleFonts.sora(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            buildImageButton(
                              'images/script_btn.png',
                              'images/script_btn_hltd.png',
                              'script',
                              screenHeight * 0.1,
                            ),

                            Text(
                              "Upload my",
                              style: GoogleFonts.sora(
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              "script",
                              style: GoogleFonts.sora(
                                fontSize: 10,
                                height: 1,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            buildImageButton(
                              'images/ai_btn.png',
                              'images/ai_btn_hltd.png',
                              'ai',
                              screenHeight * 0.1,
                            ),

                            Text(
                              "Generate from",
                              style: GoogleFonts.sora(
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              "AI",
                              style: GoogleFonts.sora(
                                fontSize: 10,
                                height: 1,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            buildImageButton(
                              'images/impromptu_btn.png',
                              'images/impromptu_btn_hltd.png',
                              'impromptu',
                              screenHeight * 0.1,
                            ),

                            Text(
                              "Impromptu/No",
                              style: GoogleFonts.sora(
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              "Script",
                              style: GoogleFonts.sora(
                                fontSize: 10,
                                height: 1,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      width: 250,
                      height: 45,
                      margin: const EdgeInsets.only(top: 20),
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
                          padding: const EdgeInsets.symmetric(
                            vertical: 12,
                            horizontal: 20,
                          ),
                          side: const BorderSide(color: Colors.black, width: 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          backgroundColor: details,
                        ),
                        child: Text(
                          "START CHALLENGE",
                          style: GoogleFonts.sora(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
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
