import 'package:confidease/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:confidease/pages/screens/feedback.dart';

class SpeechRecog extends StatefulWidget {
  const SpeechRecog({super.key});

  @override
  State<SpeechRecog> createState() => _SpeechRecogState();
}

class _SpeechRecogState extends State<SpeechRecog> {
  bool _isListening = false;
  String _text = "Press the mic and start speaking...";

  void _toggleMic() {
    setState(() {
      _isListening = !_isListening;
      _text = _isListening
          ? "Listening..."
          : "Press the mic and start speaking...";
    });
  }

  void _discard() {
    setState(() {
      _text = "Press the mic and start speaking...";
      _isListening = false;
    });
    print("Speech discarded");
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: details,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xff1E155B), details, Color(0xff1E155B)],
            stops: [0.0, 0.5, 1.0],
          ),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Text content
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.05,
                vertical: screenHeight * 0.10,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: screenHeight * 0.03),
                  Text(
                    "Good day, everyone.",
                    style: GoogleFonts.sora(
                      color: Colors.white,
                      fontSize: screenWidth * 0.055,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Text(
                    "Let me ask you a simple question: When was the last time you took a walk—not to rush somewhere, but simply to move, breathe, and be present?",
                    style: GoogleFonts.sora(
                      color: Colors.white,
                      fontSize: screenWidth * 0.055,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Text(
                    "Walking is one of the easiest yet most powerful habits you can develop. Just 30 minutes a day can improve your heart health, reduce stress, strengthen your...",
                    style: GoogleFonts.sora(
                      color: Colors.white70,
                      fontSize: screenWidth * 0.055,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),

            // Bottom panel
            Positioned(
              bottom: 0,
              child: Container(
                width: screenWidth,
                height: screenHeight * 0.3,
                decoration: BoxDecoration(
                  color: const Color(0xff584DA6),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "00:00:00",
                      style: GoogleFonts.sora(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: screenWidth * 0.05,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.03),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Cancel button
                        CircleAvatar(
                          backgroundColor: Colors.yellow[200],
                          radius: screenWidth * 0.06,
                          child: IconButton(
                            icon: const Icon(Icons.close, color: Colors.black),
                            iconSize: screenWidth * 0.045,
                            onPressed: _discard,
                          ),
                        ),
                        SizedBox(width: screenWidth * 0.05),

                        // Mic button
                        CircleAvatar(
                          backgroundColor: _isListening
                              ? Colors.red
                              : Colors.yellow,
                          radius: 35,
                          child: IconButton(
                            icon: Icon(
                              _isListening ? Icons.mic : Icons.mic_none,
                              color: Colors.white,
                              size: screenWidth * 0.1,
                            ),
                            onPressed: _toggleMic,
                          ),
                        ),
                        SizedBox(width: screenWidth * 0.05),

                        // Confirm button
                        CircleAvatar(
                          backgroundColor: Colors.yellow[200],
                          radius: screenWidth * 0.06,
                          child: IconButton(
                            icon: Icon(
                              Icons.check,
                              color: Colors.black,
                              size: screenWidth * 0.045,
                            ),
                            onPressed: () {
                              setState(() => _isListening = false);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const FeedbackPage(),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
