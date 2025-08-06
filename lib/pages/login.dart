import 'package:flutter/material.dart';
import 'package:confidease/styles/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:confidease/userdata.dart';
import 'package:confidease/pages/dashboard.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() {
    if (_emailController.text == UserData.email &&
        _passwordController.text == UserData.password) {
      // Redirect to dashboard with user's full name
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Dashboard(
            name: "${UserData.firstName} ${UserData.lastName}",
          ),
        ),
      );
    } else {
      // Show error message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Invalid email or password")),
      );
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
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              color: details,
              shape: BoxShape.circle,
              border: Border.all(color: const Color(0xFF000000), width: 1),
            ),
            child: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Color(0xFF000000),
                size: 20,
              ),
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
                    fontSize: 12,),
                    textAlign: TextAlign.center,
                ),
              ),
              // Email
              Container(
                margin: const EdgeInsets.only(top: 50),
                width: 300,
                child:  Text(
                  "Email Address",
                  style: GoogleFonts.sofiaSans(
                    fontWeight: FontWeight.w700,
                    color: quartenary,
                    fontSize: 12,),
   

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
                    contentPadding: const EdgeInsets.symmetric(horizontal: 12.0),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFFFC419), width: 2),
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
                margin: const EdgeInsets.only(top: 5, bottom: 25),
                child: TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    filled: true,
                    fillColor: quartenary,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 12.0),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFFFC419), width: 2),
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
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
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
