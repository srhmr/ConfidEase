import 'package:flutter/material.dart';
import 'package:confidease/styles/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupState(); //generic type
}

class _SignupState extends State<SignupPage> {
  final TextEditingController _dateController = TextEditingController();

  @override
  void dispose() {
    _dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: tertiary,
      appBar: AppBar(
        backgroundColor: tertiary,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              color: secondary,
              shape: BoxShape.circle,
              border: Border.all(color: const Color(0xFF000000), width: 1),
            ),
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Color(0xFF000000), size: 20),
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
                margin: const EdgeInsets.only(bottom: 10),
                child: const Image(image: AssetImage('images/soundwave2.png')),
              ),
              SizedBox(
                width: 300,
                child: Text(
                  "SIGN UP",
                  style: GoogleFonts.sora(
                    fontWeight: FontWeight.w700,
                    fontSize: 30,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                width: 350,
                child: const Text(
                  "Create your account",
                  style: TextStyle(color: Colors.black, fontSize: 12),
                  textAlign: TextAlign.center,
                ),
              ),
              _buildLabel("Email Address"),
              _buildTextField(),
              _buildLabel("First Name"),
              _buildTextField(),
              _buildLabel("Last Name"),
              _buildTextField(),
              _buildLabel("Birthday"),
              SizedBox(
                height: 40,
                width: 300,
                child: TextField(
                  controller: _dateController,
                  readOnly: true,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 12.0),
                    suffixIcon: Icon(Icons.calendar_today),
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1950),
                      lastDate: DateTime(2100),
                    );
                    if (pickedDate != null) {
                      setState(() {
                        _dateController.text = "${pickedDate.toLocal()}".split(' ')[0];
                      });
                    }
                  },
                ),
              ),
              _buildLabel("Password"),
              _buildTextField(obscure: true),
              _buildLabel("Confirm Password"),
              _buildTextField(obscure: true),
              Container(
                width: 100,
                height: 50,
                margin: const EdgeInsets.only(top: 25),
                child: OutlinedButton(
                  onPressed: () {
                    // Sign up logic here
                  },
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                    side: const BorderSide(color: Colors.black, width: 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    backgroundColor: secondary,
                  ),
                  child: Text(
                    "Sign Up",
                    style: GoogleFonts.sora(
                      color: details,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      width: 300,
      child: Text(
        text,
        style: const TextStyle(color: Colors.black, fontSize: 12),
      ),
    );
  }

  Widget _buildTextField({bool obscure = false}) {
    return Container(
      width: 300,
      height: 40,
      margin: const EdgeInsets.only(top: 2),
      child: TextField(
        obscureText: obscure,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.symmetric(horizontal: 12.0),
        ),
      ),
    );
  }
}
