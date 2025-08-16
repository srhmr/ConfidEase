import 'package:flutter/material.dart';
import 'package:confidease/styles/colors.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:google_fonts/google_fonts.dart';

class Faqs extends StatefulWidget {
  const Faqs({super.key});

  @override
  State<Faqs> createState() => _FaqsState();
}

class _FaqsState extends State<Faqs> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //app bar
        appBar: AppBar(
          backgroundColor: primary,
          elevation: 5,
          leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              color: details,
              shape: BoxShape.circle,
              //border: Border.all(color: const Color(0xFF000000), width: 1),
            ),
            child: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: quartenary,
                size: 20,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: Text(
            'FAQs',
            //textAlign: TextAlign.center,
            style: GoogleFonts.sora(
              fontWeight: FontWeight.w600,
              fontSize: 20,
              color: quartenary,
            ),
          ),
        ),
      
        //body
      
        body: ListView(
          padding: EdgeInsets.all(20),
          children: [
            // About the App header
            SizedBox(height: 5),
            Text(
              'About the App',
              style: GoogleFonts.sora(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: title,
              ),
            ),
            SizedBox(height: 15),
      
            // About the App Container
            Container(
              decoration: BoxDecoration(
                color: quartenary,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: grey,
                    blurRadius: 5,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                children: [
                  ExpansionTile(
                    tilePadding: EdgeInsets.only(left: 10, right: 15),
                    title: Text(
                      'What is ConfidEase for ?',
                      style: GoogleFonts.sora(fontWeight: FontWeight.w500, fontSize: 15),
                    ),
                    trailing: Icon(TablerIcons.chevron_down),
                    children: [
                      Container(
                        padding: EdgeInsets.all(15),
                        color: quartenary.withOpacity(0.9),
                        child: Text(
                          'ConfidEase is an AI-powered practice arena for your English public speaking skills. The application offers easy-to-understand lessons and visual examples with mini quizzes to enhance your knowledge, and it also features a speech challenge area where you can provide your script, record your speech, and receive AI-assisted feedback on script construction and speech delivery through useful and quick suggestions.',
                          style: GoogleFonts.sora(fontSize: 14, color: dark),
                        ),
                      ),
                    ],
                  ),
                  Divider(height: 1),
      
                  ExpansionTile(
                    tilePadding: EdgeInsets.only(left: 10, right: 15),
                    title: Text(
                      'Who can use ConfidEase ?',
                      style: GoogleFonts.sora(fontWeight: FontWeight.w500, fontSize: 15),
                    ),
                    trailing: Icon(TablerIcons.chevron_down),
                    children: [
                      Container(
                        padding: EdgeInsets.all(15),
                        color: quartenary.withOpacity(0.9),
                        child: Text(
                          'ConfidEase is free to use for anyone who wants to enhance their public speaking skills. As long as you are ready to learn, we can help you out with your script writing and speech delivery practice. \n\n For minors, we recommend having your guardian guide you while using the application to ensure that your learning and training are effortless.',
                          style: GoogleFonts.sora(fontSize: 14,  color: dark),
                        ),
                      ),
                    ],
                  ),
                  Divider(height: 1),
      
                  ExpansionTile(
                    tilePadding: EdgeInsets.only(left: 10, right: 15),
                    title: Text(
                      'What language can I use for the app ?',
                      style: GoogleFonts.sora(fontWeight: FontWeight.w500, fontSize: 15),
                    ),
                    trailing: Icon(TablerIcons.chevron_down),
                    children: [
                      Container(
                        padding: EdgeInsets.all(15),
                        color: quartenary.withOpacity(0.9),
                        child: Text(
                          'The application focuses on using the English language for both script and speech recording. It doesn’t matter if you don’t feel confident in your English yet; we aim to help you improve and not judge your progress!',
                          style: GoogleFonts.sora(fontSize: 14,  color: dark),
                        ),
                      ),
                    ],
                  ),
                  Divider(height: 1),
      
                  ExpansionTile(
                    tilePadding: EdgeInsets.only(left: 10, right: 15),
                    title: Text(
                      'What is the Learner s Corner for ?',
                      style: GoogleFonts.sora(fontWeight: FontWeight.w500, fontSize: 15),
                    ),
                    trailing: Icon(TablerIcons.chevron_down),
                    children: [
                      Container(
                        padding: EdgeInsets.all(15),
                        color: quartenary.withOpacity(0.9),
                        child: Text(
                          'The Learner’s Corner is your information base. This section covers several lessons related to public speaking, including the different types of speeches, types of audience, and a few examples of famous speeches delivered. After every lesson, we have a mini quiz to test your understanding, where you can receive mini-XP rewards!',
                          style: GoogleFonts.sora(fontSize: 14,  color: dark),
                        ),
                      ),
                    ],
                  ),
                  Divider(height: 1),
      
                  ExpansionTile(
                    tilePadding: EdgeInsets.only(left: 10, right: 15),
                    title: Text(
                      'What is the Challenge Time for ?',
                      style: GoogleFonts.sora(fontWeight: FontWeight.w500, fontSize: 15),
                    ),
                    trailing: Icon(TablerIcons.chevron_down),
                    children: [
                      Container(
                        padding: EdgeInsets.all(15),
                        color: quartenary.withOpacity(0.9),
                        child: Text(
                          'The Challenge Time is where you work your magic! In here, the application assists you with creating your script, recording your speech, and provides you with both a graded report on your tone delivery, clarity, pacing, and emotions, as well as a verbal report on particular feedback that you can take note of.',
                          style: GoogleFonts.sora(fontSize: 14,  color: dark),
                        ),
                      ),
                    ],
                  ),
                  Divider(height: 1),
      
                  ExpansionTile(
                    tilePadding: EdgeInsets.only(left: 10, right: 15),
                    title: Text(
                      'What is the Progress Tracker for ?',
                      style: GoogleFonts.sora(fontWeight: FontWeight.w500, fontSize: 15),
                    ),
                    trailing: Icon(TablerIcons.chevron_down),
                    children: [
                      Container(
                        padding: EdgeInsets.all(15),
                        color: quartenary.withOpacity(0.9),
                        child: Text(
                          'The Progress Tracker contains all of your previous speech recording sessions along with their feedback reports. It keeps your progress visible for you to review the areas that you want to improve more.',
                          style: GoogleFonts.sora(fontSize: 14,  color: dark),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
      
            SizedBox(height: 25),
      
            // App Navigation header
            Text(
              'App Navigation',
              style: GoogleFonts.sora(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: grey,
              ),
            ),
            SizedBox(height: 10),
      
            // App Navigation Container
            Container(
              decoration: BoxDecoration(
                color: quartenary,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: lightgrey,
                    blurRadius: 5,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                children: [
                  ExpansionTile(
                    tilePadding: EdgeInsets.only(left: 10, right: 15),
                    title: Text(
                      'How can I increase my level and gain more badges ?',
                      style: GoogleFonts.sora(fontWeight: FontWeight.w500, fontSize: 15),
                    ),
                    trailing: Icon(TablerIcons.chevron_down),
                    children: [
                      Container(
                        padding: EdgeInsets.all(15),
                        color: quartenary.withOpacity(0.9),
                        child: Text(
                          'You can increase your level and gain badges mainly by doing more challenges! By doing so, you continuously improve your public speaking, then receive experience points (XP) that increase your progress level. Another way to gain XP points is to complete mini quizzes after lessons for a small XP reward.',
                          style: GoogleFonts.sora(fontSize: 14,  color: dark),
                        ),
                      ),
                    ],
                  ),
                  Divider(height: 1),
      
                  ExpansionTile(
                    tilePadding: EdgeInsets.only(left: 10, right: 15),
                    title: Text(
                      'How do you use the Learner s Corner ?',
                      style: GoogleFonts.sora(fontWeight: FontWeight.w500, fontSize: 15),
                    ),
                    trailing: Icon(TablerIcons.chevron_down),
                    children: [
                      Container(
                        padding: EdgeInsets.all(15),
                        color: quartenary.withOpacity(0.9),
                        child: Text(
                          'To access the Learner’s Corner, navigate to the second icon on the navigation bar. For additional information on the page, click on the info icon located in the upper right area of the page. \n\nTo get started with a lesson, simply click on a module that you would like to learn more about. This opens another page containing the information for your chosen topic, with an embedded video link for visual learning to help you grasp the topic better. Take your time to read and understand its contents until you feel satisfied!',
                          //maxLines: 2,
                          style: GoogleFonts.sora(fontSize: 14,  color: dark),
                        ),
                      ),
                    ],
                  ),
                  Divider(height: 1),
                  ExpansionTile(
                    tilePadding: EdgeInsets.only(left: 10, right: 15),
                    title: Text(
                      'How can I access the mini quizzes ?',
                      style: GoogleFonts.sora(fontWeight: FontWeight.w500, fontSize: 15),
                    ),
                    trailing: Icon(TablerIcons.chevron_down),
                    children: [
                      Container(
                        padding: EdgeInsets.all(15),
                        color: quartenary.withOpacity(0.9),
                        child: Text(
                          'On the bottom of the lesson page, there will be a ‘Take Quiz’ button that will direct you to the lesson’s mini quiz. Remember, unfinished quizzes will not be recorded and will not grant you your XP reward.',
                          style: GoogleFonts.sora(fontSize: 14,  color: dark),
                        ),
                      ),
                    ],
                  ),
                  Divider(height: 1),
      
                  ExpansionTile(
                    tilePadding: EdgeInsets.only(left: 10, right: 15),
                    title: Text(
                      'How do you use the Challenge Time ?',
                      style: GoogleFonts.sora(fontWeight: FontWeight.w500, fontSize: 15),
                    ),
                    trailing: Icon(TablerIcons.chevron_down),
                    children: [
                      Container(
                        padding: EdgeInsets.all(15),
                        color: quartenary.withOpacity(0.9),
                        child: Text(
                          'To access the Challenge Time, navigate to the third icon on the navigation bar. For more information on what you can do, click on the info icon in the upper right area of the page. \n\n To get started, fill out the fields inside the speech parameters and choose how you want to create your script. This will help our AI to identify your speech goal to provide the best guidance and feedback possible. \n\n Uploaded scripts will undergo AI analysis for improvement suggestions before you proceed with recording. Once you are ready, you may start recording your speech. Fear not, because you can try recording as many times until you are satisfied with your performance, then click the check button to submit. Submitted recordings are then analyzed by our AI companion to produce your feedback report.',
                          style: GoogleFonts.sora(fontSize: 14,  color: dark),
                        ),
                      ),
                    ],
                  ),
                  Divider(height: 1),
      
                  ExpansionTile(
                    tilePadding: EdgeInsets.only(left: 10, right: 15),
                    title: Text(
                      'How are my recordings graded ?',
                      style: GoogleFonts.sora(fontWeight: FontWeight.w500, fontSize: 15),
                    ),
                    trailing: Icon(TablerIcons.chevron_down),
                    children: [
                      Container(
                        padding: EdgeInsets.all(15),
                        color: quartenary.withOpacity(0.9),
                        child: Text(
                          'The grading system follows the Toastmasters International point equivalent system, with points ranging from 1 (lowest) and 5 (highest). Grading focuses on the aspects of tone delivery, clarity, pacing, and emotions; while the written feedback provides an in-depth explanation for both the good areas and those to improve.',
                          style: GoogleFonts.sora(fontSize: 14,  color: dark),
                        ),
                      ),
                    ],
                  ),
                  Divider(height: 1),
      
                  ExpansionTile(
                    tilePadding: EdgeInsets.only(left: 10, right: 15),
                    title: Text(
                      'How do I gain XP points ?',
                      style: GoogleFonts.sora(fontWeight: FontWeight.w500, fontSize: 15),
                    ),
                    trailing: Icon(TablerIcons.chevron_down),
                    children: [
                      Container(
                        padding: EdgeInsets.all(15),
                        color: quartenary.withOpacity(0.9),
                        child: Text(
                          'XP Points or experience points are mainly acquired through doing challenges. By engaging with the Challenge Time section, higher XP points are guaranteed. Moreover, mini quizzes also give you additional XP points when you complete them!',
                          style: GoogleFonts.sora(fontSize: 14,  color: dark),
                        ),
                      ),
                    ],
                  ),
                  Divider(height: 1),
      
                  ExpansionTile(
                    tilePadding: EdgeInsets.only(left: 10, right: 15),
                    title: Text(
                      'Where can I see my previous recordings and progress ?',
                      style: GoogleFonts.sora(fontWeight: FontWeight.w500, fontSize: 15),
                    ),
                    trailing: Icon(TablerIcons.chevron_down),
                    children: [
                      Container(
                        padding: EdgeInsets.all(15),
                        color: quartenary.withOpacity(0.9),
                        child: Text(
                          'Your previous recordings and progress are available on the Progress Tracker, the fourth icon on the navigation bar.',
                          style: GoogleFonts.sora(fontSize: 14,  color: dark),
                        ),
                      ),
                    ],
                  ),
                  Divider(height: 1),
      
                  ExpansionTile(
                    tilePadding: EdgeInsets.only(left: 10, right: 15),
                    title: Text(
                      'Can I edit my profile and passwords ?',
                      style: GoogleFonts.sora(fontWeight: FontWeight.w500, fontSize: 15),
                    ),
                    trailing: Icon(TablerIcons.chevron_down),
                    children: [
                      Container(
                        padding: EdgeInsets.all(15),
                        color: quartenary.withOpacity(0.9),
                        child: Text(
                          'Yes, you can! Navigate to the settings page to see the different account modification options that you may need.',
                          style: GoogleFonts.sora(fontSize: 14,  color: dark),
                        ),
                      ),
                    ],
                  ),
                  Divider(height: 1),
      
                  ExpansionTile(
                    tilePadding: EdgeInsets.only(left: 10, right: 15),
                    title: Text(
                      'Can I set a practice reminder ?',
                      style: GoogleFonts.sora(fontWeight: FontWeight.w500, fontSize: 15),
                    ),
                    trailing: Icon(TablerIcons.chevron_down),
                    children: [
                      Container(
                        padding: EdgeInsets.all(15),
                        color: quartenary.withOpacity(0.9),
                        child: Text(
                          'Of course! The practice reminder setting is also within the settings page. You can pick your desired time and date to take your daily speech practice sessions!',
                          style: GoogleFonts.sora(fontSize: 14,  color: dark),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
      
            SizedBox(height: 25),
      
            // App Errors header
            Text(
              'App Errors',
              style: GoogleFonts.sora(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: grey,
              ),
            ),
            SizedBox(height: 10),
      
            // App Errors Container
            Container(
              decoration: BoxDecoration(
                color: quartenary,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: lightgrey,
                    blurRadius: 5,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                children: [
                  ExpansionTile(
                    tilePadding: EdgeInsets.only(left: 10, right: 15),
                    title: Text(
                      'What should I do if an error occurs as I use the app ?',
                      style: GoogleFonts.sora(fontWeight: FontWeight.w500, fontSize: 15),
                    ),
                    trailing: Icon(TablerIcons.chevron_down),
                    children: [
                      Container(
                        padding: EdgeInsets.all(15),
                        color: quartenary.withOpacity(0.9),
                        child: Text(
                          'When encountering an error, pop-up messages will advise you on your next action. If the error is not addressed with the given instruction, then you may navigate to the settings page to report a problem for us to review and resolve.',
                          style: GoogleFonts.sora(fontSize: 14,  color: dark),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      
      ),
    );
  }
}