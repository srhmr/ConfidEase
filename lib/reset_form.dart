import 'package:confidease/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResetForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 5.0),
      child: Container(
        width: 600,
        height: 40,
        margin: const EdgeInsets.only(top: 5),
        child: TextField(
          decoration: InputDecoration(
            hintText: 'Enter your email', 
            hintStyle: GoogleFonts.sofiaSans(
            color: const Color(0xFFD0D0E8)),
            border: const OutlineInputBorder(),
            filled: true,
            fillColor: quartenary,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12.0,
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: const Color(0xFFD0D0E8),
                width: 2,
              ),
            ),
            prefixIcon: Icon(Icons.email, color: const Color(0xFFD0D0E8)),
          ),
        ),
      ),
    );
  }
}
