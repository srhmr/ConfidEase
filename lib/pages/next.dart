import 'package:flutter/material.dart';
import 'package:confidease/styles/colors.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:google_fonts/google_fonts.dart';

class NextPage extends StatefulWidget {
  const NextPage({super.key});

  @override
  State<NextPage> createState() => _NextPageState();
}

class _NextPageState extends State<NextPage> {
  // inputs
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();


  @override
  void dispose() {
    _emailController.dispose();
    _nameController.dispose();

    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: details),

      //body
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Step indicator
          Padding(
            padding: const EdgeInsets.only(top: 30, left: 40, right: 40),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundColor: secondary,
                  child: Icon(TablerIcons.check, size: 20, color: quartenary),
                ),

                //lines between 
                  Expanded(
                    child: Container(
                      height: 3,
                      color: Colors.grey, // kulay ng linya (pwede palitan)
                    ),
                  ),

                CircleAvatar(
                  radius: 20,
                  backgroundColor: secondary,
                  child: Text('2', style: GoogleFonts.sora(color: quartenary)),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),

          //Instruction
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 40, right: 20),
            child: Text(
              'We will get back to you on provided email.',
              style: GoogleFonts.sora(
                fontSize: 17,
                fontWeight: FontWeight.w700,
                color: dark,
              ),
            ),
          ),

          SizedBox(height: 20),

          // Name Label
          Padding(
            padding: const EdgeInsets.only(left: 40, bottom: 8),
            child: Text(
              "Full Name",
              style: GoogleFonts.sofiaSans(
                fontWeight: FontWeight.w700,
                fontSize: 12,
                color: const Color(0xFF000000),
              ),
            ),
          ),

          // Name TextField
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35),
            child: SizedBox(
              width: 350,
              height: 45,
              child: TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: "Enter your name",
                  hintStyle: GoogleFonts.sofiaSans(
                    fontSize: 15,
                    color: lightgrey,
                    fontWeight: FontWeight.w400,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: details),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ),

        SizedBox(height: 25),
          // Label
          Padding(
            padding: const EdgeInsets.only(left: 40, bottom: 8),
            child: Text(
              "Email Address",
              style: GoogleFonts.sofiaSans(
                fontWeight: FontWeight.w700,
                fontSize: 12,
                color: const Color(0xFF000000),
              ),
            ),
          ),

          // Email TextField
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35),
            child: SizedBox(
              width: 350,
              height: 45,
              child: TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: "Enter your email",
                  hintStyle: GoogleFonts.sofiaSans(
                    fontSize: 15,
                    color: lightgrey,
                    fontWeight: FontWeight.w400,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: details),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ),

          SizedBox(height: 180),

          //Submit
            Padding(
              padding: const EdgeInsets.only(left: 270),
              child: SizedBox(
                width: 100,
                height: 45,
                child: ElevatedButton(
                onPressed: () {
                  if (_emailController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Please enter your email before submitting")),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Your report has been submitted. Thank you!")),
                    );
                    Navigator.pop(context); // optional: balik sa unang screen
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: details,
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  'Submit',
                  style: GoogleFonts.sofiaSans(
                    fontSize: 15,
                    color: quartenary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                          ),
              ),
            ),

        ],
      ),
    );
  }
}
