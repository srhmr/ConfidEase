import 'package:confidease/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _controller = PageController();
  bool isLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              quartenary, // white
              Colors.white70, // extra white stop (to stretch white area)
              secondary, // yellow
            ],
            stops: [0.0, 0.4, 1.0], // 30% white, then blend to yellow
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // PageView (images + text)
              Expanded(
                child: PageView(
                  controller: _controller,
                  onPageChanged: (index) {
                    setState(() => isLastPage = index == 4); // 5th page
                  },
                  children: [
                    buildPage(
                      'images/intro/first.png',
                      "Refine your English public speaking skills with AI assistance",
                    ),
                    buildPage(
                      'images/intro/second.png',
                      "Learn more about public speaking and earn rewards through mini quizzes",
                    ),
                    buildPage(
                      'images/intro/third.png',
                      "Need help with your speech script? We got you covered!",
                    ),
                    buildPage(
                      'images/intro/fourth.png',
                      "Practice your speech delivery with a friendly AI!",
                    ),
                    buildPage(
                      'images/intro/fifth.png',
                      "Gain more confidence and experience for your next public speaking event!",
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 15),

              // PAGE INDICATOR
              SmoothPageIndicator(
                controller: _controller,
                count: 5,
                effect: SlideEffect(
                  dotHeight: 10,
                  dotWidth: 10,
                  spacing: 20,
                  activeDotColor: dark,
                  dotColor: Colors.grey,
                  paintStyle: PaintingStyle.stroke,
                  strokeWidth: 1.5,
                ),
              ),

              const SizedBox(height: 50),

              // Next and Start button
              Padding(
                padding: const EdgeInsets.only(left: 230),
                child: SizedBox(
                  width: 100,
                  height: 40,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primary,
                      foregroundColor: quartenary,
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    child: Text(
                      isLastPage ? "Start" : "Next",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w700,
                        fontSize: 15,
                        color: quartenary,
                      )
                    ),
                    onPressed: () async {
                      if (isLastPage) {
                        final prefs = await SharedPreferences.getInstance();
                        prefs.setBool('seenOnboarding', true);
                        Navigator.pushReplacementNamed(context, "/landing");
                      } else {
                        _controller.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                        );
                      }
                    },
                  ),
                ),
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildPage(String asset, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 90), // space above image
          Image.asset(asset, height: 300),

          const Spacer(), // pushes text lower

          Text(
            text,
            style: GoogleFonts.sora(
              fontWeight: FontWeight.w600,
              fontSize: 18,
              color: details,
            ),
            textAlign: TextAlign.center,
          ),

          SizedBox(height: 30), // closer to dots
        ],
      ),
    );
  }
}
