import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LearnersPopup extends StatelessWidget {
  const LearnersPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.all(16),
      backgroundColor: Colors.transparent, 
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15), // Soft shadow
              blurRadius: 12,
              offset: Offset(0, 6),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Header
            Container(
              decoration: BoxDecoration(
                color: Color(0xFFB3A4F9), // Purple header
                borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              ),
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Image.asset(
                      'images/backbtn_popup.png',
                      height: 30,
                      width: 32.64,
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        'What can I do?',
                        style: GoogleFonts.sora(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 24), //title sa center
                ],
              ),
            ),

            // Content
            Flexible(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Column(
                    children: [
                      _buildSection(
                        title: 'Choose a learning module',
                        description:
                            'Read through the material and learn more about public speaking. Watch the videos to gain ideas through learning by example.',
                      ),
                      _buildSection(
                        title: 'Answer the quizzes',
                        description:
                            'Mini quizzes are one way for you to test your knowledge and gain extra points. Be sure to complete and submit to secure these.',
                      ),
                      _buildSection(
                        title: 'Listen to famous speeches',
                        description:
                            'Tune in to some of the well-known speeches ever delivered and submerge yourself in the world of public speaking.',
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection({required String title, required String description}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Yellow title background - Centered text
          Container(
            width: double.infinity,
            color: Color(0xFFFFE082),
            padding: EdgeInsets.all(12),
            child: Center(
              child: Text(
                title,
                style: GoogleFonts.sora(fontWeight: FontWeight.bold, fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          // White description - Centered text
          Container(
            width: double.infinity,
            color: Colors.white,
            padding: EdgeInsets.all(12),
            child: Center(
              child: Text(
                description,
                style: GoogleFonts.sora(fontSize: 12),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
