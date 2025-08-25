import 'package:confidease/pages/landing.dart';
import 'package:confidease/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
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
  int currentPage = 0;

  final List<String> images = [
    'images/intro/first.png',
    'images/intro/second.png',
    'images/intro/third.png',
    'images/intro/fourth.png',
    'images/intro/fifth.png',
  ];

  final List<String> texts = [
    "Refine your English public speaking skills with AI assistance",
    "Learn more about public speaking and earn rewards through mini quizzes",
    "Need help with your speech script? We got you covered!",
    "Practice your speech delivery with a friendly AI!",
    "Gain more confidence and experience for your next public speaking event!",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: quartenary,
        leading: currentPage > 0
            ? IconButton(
                icon: Icon(TablerIcons.chevron_left),
                onPressed: () {
                  _controller.previousPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
              )
            : null,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LandingPage()),
              );
            },
            child: Text(
              'Skip',
              style: GoogleFonts.sofiaSans(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: dark,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [quartenary, Colors.white70, secondary],
            stops: [0.0, 0.3, 1.0],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: _controller,
                  itemCount: images.length,
                  onPageChanged: (index) {
                    setState(() {
                      isLastPage = index == images.length - 1;
                      currentPage = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    bool isCurrent = index == currentPage;
                    return buildAnimatedPage(images[index], texts[index], isCurrent);
                  },
                ),
              ),

              SizedBox(height: 15),

              SmoothPageIndicator(
                controller: _controller,
                count: images.length,
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

              SizedBox(height: 50),

              Padding(
                padding: EdgeInsets.only(left: 230),
                child: SizedBox(
                  width: 100,
                  height: 40,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primary,
                      foregroundColor: quartenary,
                      padding: EdgeInsets.symmetric(vertical: 8),
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
                      ),
                    ),
                    onPressed: () async {
                      if (isLastPage) {
                        final prefs = await SharedPreferences.getInstance();
                        prefs.setBool('seenOnboarding', true);
                        Navigator.pushReplacementNamed(context, "/landing");
                      } else {
                        _controller.nextPage(
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                        );
                      }
                    },
                  ),
                ),
              ),

              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildAnimatedPage(String asset, String text, bool isCurrent) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 20),

          // Image with Fade + Scale Animation
          AnimatedOpacity(
            duration: Duration(milliseconds: 500),
            opacity: isCurrent ? 1.0 : 0.5,
            child: AnimatedScale(
              duration: Duration(milliseconds: 500),
              scale: isCurrent ? 1.0 : 0.8,
              child: AspectRatio(
                aspectRatio: 1.0,
                child: Image.asset(
                  asset,
                  fit: BoxFit.contain,
                  width: double.infinity,
                ),
              ),
            ),
          ),

          Spacer(),
          Text(
            text,
            style: GoogleFonts.sora(
              fontWeight: FontWeight.w600,
              fontSize: 18,
              color: details,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 30),
        ],
      ),
    );
  }
}
