import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TypesOfSpeechScreen extends StatefulWidget {
  const TypesOfSpeechScreen({super.key});

  @override
  State<TypesOfSpeechScreen> createState() => _TypesOfSpeechScreenState();
}

class _TypesOfSpeechScreenState extends State<TypesOfSpeechScreen> {
  String? _selectedReference;
  final List<Map<String, String>> _references = [
    {"title": "Public Speaking Basics", "link": "https://example.com/1"},
    {"title": "Persuasive Techniques", "link": "https://example.com/2"},
    {"title": "Famous Speeches", "link": "https://example.com/3"},
  ];

  @override
  Widget build(BuildContext context) {
    const yellowBg = Color(0xFFFFF9C4);
    const purpleBorder = Color(0xFF7E81D4);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF7E81D4),
        centerTitle: true, // <-- Center the title
        leading: IconButton(
          icon: Image.asset(
            "images/backbtn_popup.png",
            height: 31,
            width: 32,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Types of Speech',
          style: GoogleFonts.sora(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Yellow Box
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: yellowBg,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: purpleBorder, width: 1),
                ),
                child: Row(
                  children: [
                    Image.asset(
                      'images/persuasive.png',
                      height: 168,
                      width: 177,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Tips and Tricks for',
                            style: GoogleFonts.sora(
                              fontSize: 10,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Persuasive Speech',
                            style: GoogleFonts.sora(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // Intro Text
              Text(
                'Persuasive speech is a speech that is given with the intention of convincing the audience to believe or do something.',
                style: GoogleFonts.sora(fontSize: 14, color: Colors.black87),
              ),
              const SizedBox(height: 16),

              Text(
                '3 main approaches to convince others:',
                style: GoogleFonts.sora(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 8),

              // 3 APPROACHES
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: yellowBg,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: purpleBorder, width: 1),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildApproachItem(
                      number: '1.',
                      title: 'Ethos',
                      description:
                          'Ethos approach appeals to the audience\'s ethics and morals, such as what is the "right thing to do" for humanity, saving the environment, etc.',
                    ),
                    const SizedBox(height: 8),
                    _buildApproachItem(
                      number: '2.',
                      title: 'Pathos',
                      description:
                          'Pathos persuasion is when you appeal to the audience\'s emotions, such as when you tell a difficult situation, then the main character in a story that makes them feel empathy.',
                    ),
                    const SizedBox(height: 8),
                    _buildApproachItem(
                      number: '3.',
                      title: 'Logos',
                      description:
                          'Logos approach to giving a persuasive speech is when you appeal to the audience\'s logic - i.e. the approach is essentially more driven by facts and logic.',
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // References Dropdown
              Center(
                child: DropdownButton<String>(
                  value: _selectedReference,
                  hint: Text(
                    "References",
                    style: GoogleFonts.sora(
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                    ),
                  ),
                  items: _references.map((ref) {
                    return DropdownMenuItem<String>(
                      value: ref["link"],
                      child: Text(
                        ref["title"]!,
                        style: GoogleFonts.sora(
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                        ),
                      ),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedReference = value;
                    });
                  },
                ),
              ),
              const SizedBox(height: 16),

              // Video Placeholder
              Text(
                'Watch this sample clip',
                style: GoogleFonts.sora(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xFF9370DB),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Center(
                  child: Icon(
                    Icons.play_arrow,
                    color: Colors.white,
                    size: 48,
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // Take Quiz Button
              Center(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF9370DB),
                    minimumSize: const Size(240, 40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child: Text(
                    'TAKE QUIZ',
                    style: GoogleFonts.sora(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildApproachItem({
    required String number,
    required String title,
    required String description,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$number ',
          style: GoogleFonts.sora(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.sora(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                description,
                style: GoogleFonts.sora(
                  fontSize: 14,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
