import 'package:confidease/pages/screens/speech_recog.dart';
import 'package:flutter/material.dart';
import 'package:confidease/styles/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class FinalScript extends StatefulWidget {
  const FinalScript({super.key});

  @override
  State<FinalScript> createState() => _FinalScriptState();
}

class _FinalScriptState extends State<FinalScript> {
  final TextEditingController _scriptController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: screenHeight * 0.12,
        backgroundColor: primary,
        title: FittedBox(
          fit: BoxFit.scaleDown,
          alignment: Alignment.centerLeft,
          child: Text(
            "Here's your final\nscript.",
            style: GoogleFonts.sora(
              fontSize: screenWidth * 0.06, // responsive font
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
        ),
        elevation: 0, // remove default shadow
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0), // height of the border
          child: Container(
            color: Colors.black, // border color
            height: 1.0, // thickness
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: screenHeight * 0.7, // responsive height
            child: ScrollbarTheme(
              data: ScrollbarThemeData(
                thumbColor: WidgetStateProperty.all(secondary),
                thickness: WidgetStateProperty.all(6),
                radius: const Radius.circular(8),
              ),
              child: Container(
                width: screenWidth * 0.9, // responsive width
                height: screenHeight * 0.01, // responsive height
                margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
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
                          fontSize: screenWidth * 0.04, // responsive text size
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: screenWidth * 0.6,
            height: screenHeight * 0.06,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SpeechRecog()),
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
                "START RECORDING",
                style: GoogleFonts.sora(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: screenWidth * 0.04,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
