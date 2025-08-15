import 'package:flutter/material.dart';
import 'package:confidease/styles/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class Badges extends StatefulWidget {
  const Badges({super.key});

  @override
  State<Badges> createState() => _BadgesState();
}

class _BadgesState extends State<Badges> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tertiary,
      //app bar
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
          centerTitle: true,
          title: Text(
            'Badges',
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