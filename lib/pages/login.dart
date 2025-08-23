import 'package:confidease/navigator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:confidease/pages/reset_password.dart';
import 'package:flutter/material.dart';
import 'package:confidease/styles/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();

}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _showPassword = false;


  void _login() async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      // If login successful → redirect to dashboard
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) =>
              MainNavigator(name: credential.user?.email ?? "User"),
        ),
      );
    } on FirebaseAuthException catch (e) {
      String message = "Login failed";
      if (e.code == 'user-not-found') {
        message = "No user found for that email.";
      } else if (e.code == 'wrong-password') {
        message = "Wrong password provided.";
      }
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(message)));
    }
  }

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: primary,
      appBar: AppBar(
        backgroundColor: primary,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            decoration: BoxDecoration(
              color: details,
              shape: BoxShape.circle,
              //border: Border.all(color: const Color(0xFF000000), width: 1),
            ),
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: quartenary, size: 20),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 400,
                height: 150,
                margin: const EdgeInsets.only(top: 40, bottom: 10),
                child: const Image(image: AssetImage('images/soundwave1.png')),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 50),
                width: 350,
                child: Text(
                  "WELCOME BACK",
                  style: GoogleFonts.sora(
                    fontWeight: FontWeight.w700,
                    fontSize: 30,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 50),
                width: 350,
                child: Text(
                  "Login to your account",
                  style: GoogleFonts.sofiaSans(
                    fontWeight: FontWeight.w400,
                    color: quartenary,
                    fontSize: 12,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              // Email
              Container(
                margin: const EdgeInsets.only(top: 50),
                width: 300,
                child: Text(
                  "Email Address",
                  style: GoogleFonts.sofiaSans(
                    fontWeight: FontWeight.w700,
                    color: quartenary,
                    fontSize: 12,
                  ),
                ),
              ),
              Container(
                width: 300,
                height: 40,
                margin: const EdgeInsets.only(top: 5),
                child: TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    filled: true,
                    fillColor: quartenary,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 12.0,
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFFFFC419),
                        width: 2,
                      ),
                    ),
                  ),
                ),
              ),

              // Password
              Container(
                margin: const EdgeInsets.only(top: 10),
                width: 300,
                child: Text(
                  "Password",
                  style: GoogleFonts.sofiaSans(
                    color: quartenary,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Container(
                width: 300,
                height: 40,
                margin: const EdgeInsets.only(top: 5, bottom: 10),
                child: TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    filled: true,
                    fillColor: quartenary,
                    suffixIcon: IconButton(
                      icon: Icon(
                        _showPassword ? Icons.visibility : Icons.visibility_off,
                        size: 18,
                      ),
                      onPressed: () {
                        setState(() {
                          _showPassword = !_showPassword;
                        });
                      },
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 12.0,
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFFFFC419),
                        width: 2,
                      ),
                    ),
                  ),
                ),
              ),

              //Forgot password
              Container(
                width: 300,
                alignment: Alignment.centerRight,
                margin: const EdgeInsets.only(bottom: 15),
                child: GestureDetector(
                  onTap: () {
                    // to implement forgot pw logic
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResetPasswordPage(),
                      ),
                    );
                  },
                  child: Text(
                    "Forgot Password?",
                    style: GoogleFonts.sofiaSans(
                      fontSize: 15,
                      color: quartenary,
                      //decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),

              // Login Button
              Container(
                width: 114,
                height: 45,
                margin: const EdgeInsets.only(top: 20),
                child: ElevatedButton(
                  onPressed: _login,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 20,
                    ),
                    side: const BorderSide(color: Colors.black, width: 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    backgroundColor: details,
                  ),
                  child: Text(
                    "Login",
                    style: GoogleFonts.sora(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
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
}
