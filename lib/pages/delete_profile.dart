import 'package:confidease/pages/landing.dart';
import 'package:confidease/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DeleteProfile extends StatefulWidget {
  final String email;
  const DeleteProfile({super.key, required this.email});

  @override
  State<DeleteProfile> createState() => _DeleteProfileState();
}

class _DeleteProfileState extends State<DeleteProfile> {
  final TextEditingController codeController = TextEditingController();

  void verifyCode() {
    //code verification logic
    if (codeController.text.trim() == "654321") {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Code verified. Deleting account...')),
      );

      //Simulate accounta deletion delay before redirecting
      Future.delayed(const Duration(seconds: 2), () {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context)
          => const LandingPage()),
          (route) => false,
        );
      });

      //Delete account
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Invalid code. Please try again.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tertiary,
      appBar: AppBar(
        backgroundColor: tertiary,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: dark, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30),
            Text(
              "Enter Verification Code",
              style: GoogleFonts.sora(
                fontSize: 27,
                color: details,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 5),
            Text(
              "We have sent a verification code to ${widget.email}. Please enter it below to confirm account deletion.",
              style: GoogleFonts.sofiaSans(
                fontSize: 15,
                color: Colors.black,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: codeController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Enter 6-digit code',
                hintStyle: GoogleFonts.sofiaSans(
                  color: const Color(0xFFD0D0E8),
                ),
                border: const OutlineInputBorder(),
                filled: true,
                fillColor: quartenary,
                contentPadding: const EdgeInsets.symmetric(horizontal: 12.0),
                prefixIcon: Icon(Icons.lock, color: const Color(0xFFD0D0E8)),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 45,
              child: ElevatedButton(
                onPressed: verifyCode,
                style: ElevatedButton.styleFrom(
                  backgroundColor: details,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  "Verify Code",
                  style: GoogleFonts.sora(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
