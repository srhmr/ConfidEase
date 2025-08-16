import 'package:flutter/material.dart';
import 'package:confidease/styles/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  //Controllers Text Fields
  final TextEditingController currentPasswordController =
      TextEditingController();

  final TextEditingController newPasswordController = TextEditingController();

  final TextEditingController confirmPasswordController =
      TextEditingController();

  // Password visibility toggles
  bool _showCurrent = false;
  bool _showNew = false;
  bool _showConfirm = false;

  Widget _buildLabel(String text) {
    return Container(
      margin: const EdgeInsets.only(top: 10, bottom: 10),
      width: 285,
      child: Text(
        text,
        style: GoogleFonts.sofiaSans(
          fontWeight: FontWeight.w700,
          color: Colors.black,
          fontSize: 12,
        ),
      ),
    );
  }

  // TextField builder
  Widget _buildPasswordField({
    required TextEditingController controller,
    required bool show,
    required VoidCallback toggleShow,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SizedBox(
        height: 40,
        width: 285,
        child: TextField(
          controller: controller,
          obscureText: !show,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(left: 10),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: field, width: 2),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: field, width: 2),
            ),
            filled: true,
            fillColor: quartenary,
            suffixIcon: IconButton(
              icon: Icon(
                show ? Icons.visibility : Icons.visibility_off,
                size: 18,
              ),
              onPressed: toggleShow,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: details,
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              decoration: BoxDecoration(color: tertiary, shape: BoxShape.circle),
              child: IconButton(
                icon: const Icon(Icons.arrow_back, color: dark, size: 20),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ),
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: Text(
            '',
            style: GoogleFonts.sora(
              fontWeight: FontWeight.w600,
              fontSize: 20,
              color: quartenary,
            ),
          ),
        ),
      
        //body
        backgroundColor: tertiary,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 40, left: 60),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 30),
                  Text(
                    'Change Password',
                    style: GoogleFonts.sora(
                      fontSize: 27, 
                      fontWeight: FontWeight.w700, 
                      color: details, 
                    ),
                  ),
                  
                  SizedBox(height: 30),
      
                  _buildLabel('Current Password'),
                  _buildPasswordField(
                    controller: currentPasswordController,
                    show: _showCurrent,
                    toggleShow: () =>
                        setState(() => _showCurrent = !_showCurrent),
                  ),
                  _buildLabel('New Password'),
                  _buildPasswordField(
                    controller: newPasswordController,
                    show: _showNew,
                    toggleShow: () =>
                        setState(() => _showCurrent = !_showCurrent),
                  ),
                  _buildLabel('Confirm New Password'),
                  _buildPasswordField(
                    controller: confirmPasswordController,
                    show: _showConfirm,
                    toggleShow: () =>
                        setState(() => _showCurrent = !_showCurrent),
                  ),
                  const SizedBox(height: 30),
                  // Save button
                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: SizedBox(
                      width: 250,
                      height: 45,
                      child: ElevatedButton(
                        onPressed: () {
                          // Handle password change logic here
                          String current = currentPasswordController.text;
                          String newPass = newPasswordController.text;
                          String confirm = confirmPasswordController.text;
      
                          if (newPass != confirm) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('New passwords do not match'),
                              ),
                            );
                          } else {
                            // Call API or update password
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Password changed successfully!'),
                              ),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: details,
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                            side: BorderSide(color: dark, width: 1),
                          ),
                        ),
                        child: Text(
                          'Update Password',
                          style: GoogleFonts.sora(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: quartenary,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
