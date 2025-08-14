import 'package:flutter/material.dart';
import 'package:confidease/styles/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //app bar
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
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(
          'Edit Profile',
          //textAlign: TextAlign.center,
          style: GoogleFonts.sora(
            fontWeight: FontWeight.w600,
            fontSize: 25,
            color: quartenary,
          ),
        ),
      ),
    
      //body
      
    );
  }
}