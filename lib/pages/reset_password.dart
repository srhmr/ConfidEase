import 'package:confidease/pages/login.dart';
import 'package:confidease/reset_form.dart';
import 'package:confidease/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:confidease/services/email_services.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  String email = '';
  bool isButtonEnabled = false;

  // Simple email validation
  bool isValidEmail(String input) {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(input);
  }

  void _onEmailChanged(String value) {
    setState(() {
      email = value.trim();
      isButtonEnabled = isValidEmail(email);
    });
  }

  Future<void> _resetPassword() async {
  try {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('📩 Password reset email has been sent!'),
      ),
    );

    // Optional: go back to login screen
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('❌ Error: $e')),
    );
  }
}



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: tertiary,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              color: details,
              shape: BoxShape.circle,
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
      ),
      backgroundColor: tertiary,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            Text(
              "Reset Password",
              style: GoogleFonts.sora(
                fontSize: 27,
                color: details,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              "Enter your registered email for reset password instructions.",
              style: GoogleFonts.sofiaSans(
                fontSize: 15,
                color: Colors.black,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 10),
            // Pass the onChanged callback to ResetForm
            ResetForm(onChanged: _onEmailChanged),
            const SizedBox(height: 10.0),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                width: 170,
                height: 45,
                margin: const EdgeInsets.only(top: 20),
                child: ElevatedButton(
                  onPressed: isButtonEnabled ? _resetPassword : null,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 20,
                    ),
                    side: const BorderSide(color: Colors.black, width: 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    backgroundColor: isButtonEnabled ? details : Colors.grey,
                  ),
                  child: Text(
                    "Send link to email",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.sora(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                    ),
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

class ResetForm extends StatelessWidget {
  final Function(String) onChanged;

  const ResetForm({super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: 'Enter your email',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
