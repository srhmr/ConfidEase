import 'package:flutter/material.dart';
import 'package:confidease/styles/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:confidease/userdata.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupState(); 
}

class _SignupState extends State<SignupPage> {
  // inputs
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
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
              icon: const Icon(
                Icons.arrow_back,
                color: Color(0xFF000000),
                size: 20,
              ),
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/login');
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
                child: Text(
                  "Create your account",
                  style: GoogleFonts.sofiaSans(
                    fontWeight: FontWeight.w400,
                    color: Colors.black, fontSize: 12),
                  textAlign: TextAlign.center,
                ),
              ),
              
              _buildLabel("Email Address", style: GoogleFonts.sofiaSans(fontWeight: FontWeight.w700, fontSize: 12, color: Color(0xFF000000))), 
              _buildTextField(controller: _emailController),

              _buildLabel("First Name", style: GoogleFonts.sofiaSans(fontWeight: FontWeight.w700, fontSize: 12, color: Color(0xFF000000))),
              _buildTextField(controller: _firstNameController),

              _buildLabel("Last Name", style: GoogleFonts.sofiaSans(fontWeight: FontWeight.w700, fontSize: 12, color: Color(0xFF000000))),
              _buildTextField(controller: _lastNameController),

              _buildLabel("Birthday", style: GoogleFonts.sofiaSans(fontWeight: FontWeight.w700, fontSize: 12, color: Color(0xFF000000))),
              SizedBox(
                height: 40,
                width: 300,
                child: TextField(
                  controller: _dateController,
                  readOnly: true,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 5.0,
                      horizontal: 12.0,
                    ),
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
                        _dateController.text = "${pickedDate.toLocal()}".split(
                          ' ',
                        )[0];
                      });
                    }
                  },
                ),
              ),
              _buildLabel("Password", style: GoogleFonts.sofiaSans(fontWeight: FontWeight.w700, fontSize: 12, color: Color(0xFF000000))),
              _buildTextField(obscure: true, controller: _passwordController),

              _buildLabel("Confirm Password", style: GoogleFonts.sofiaSans(fontWeight: FontWeight.w700, fontSize: 12, color: Color(0xFF000000))),
              _buildTextField(
                obscure: true,
                controller: _confirmPasswordController,
              ),
              Container(
                width: 114,
                height: 45,
                margin: const EdgeInsets.only(top: 25),
                child: OutlinedButton(
                  onPressed: () {
                    if (_passwordController.text !=
                        _confirmPasswordController.text) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Passwords do not match")),
                      );
                      return;
                    }
                    //save the users input to Userdata
                    UserData.email = _emailController.text;
                    UserData.firstName = _firstNameController.text;
                    UserData.lastName = _lastNameController.text;
                    UserData.password = _passwordController.text;

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Account created successfully!"),
                      ),
                    );

                    //to redirect to landing
                    Navigator.pushReplacementNamed(context, '/login');

                    // Sign up logic 
                  },
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 20,
                    ),
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

  Widget _buildLabel(String text, {TextStyle? style}) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      width: 300,
      child: Text(
        text,
        style: style?? GoogleFonts.sofiaSans(
          fontWeight: FontWeight.w700,
          color: Colors.black, 
          fontSize: 12),
      ),
    );
  }

  Widget _buildTextField({
    bool obscure = false,
    TextEditingController? controller,
  }) {
    return Container(
      width: 300,
      height: 40,
      margin: const EdgeInsets.only(top: 2),
      child: TextField(
        controller: controller, //connected to controllers
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
