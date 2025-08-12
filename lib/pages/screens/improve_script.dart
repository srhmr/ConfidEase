import 'package:flutter/material.dart';
import 'package:confidease/styles/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class ImproveScript extends StatefulWidget {
  const ImproveScript({super.key});

  @override
  State<ImproveScript> createState() => _ImproveScriptState();
}

class _ImproveScriptState extends State<ImproveScript> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: primary,
        title: Text(
          'Improve Your Script',
          style: GoogleFonts.sora(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: Text(
          'This is where you can improve your script.',
          style: GoogleFonts.sora(fontSize: 18, color: Colors.black),
        ),
      ),
    );
  }
}
