import 'dart:io';

import 'package:flutter/material.dart';
import 'package:confidease/styles/colors.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:file_picker/file_picker.dart';

import 'package:confidease/pages/next.dart';

class Report extends StatefulWidget {
  const Report({super.key});

  @override
  State<Report> createState() => _ReportState();
}

class _ReportState extends State<Report> {
  final TextEditingController _controller = TextEditingController();

  // 👇 declare these so they’re available in build()
  String? _fileName;
  String? _filePath;

  Future<void> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'png', 'txt', 'pdf'],
    );

    if (result != null && result.files.single.path != null) {
      setState(() {
        _filePath = result.files.single.path!;
        _fileName = result.files.single.name;
      });
    }
  }

  // check kung image
  bool _isImage(String fileName) {
    final lower = fileName.toLowerCase();
    return lower.endsWith(".jpg") ||
        lower.endsWith(".jpeg") ||
        lower.endsWith(".png");
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: quartenary,
        appBar: AppBar(backgroundColor: details),

        //body
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Step indicator
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 40, right: 40),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: secondary,
                    child: Text(
                      '1',
                      style: GoogleFonts.sora(color: quartenary),
                    ),
                  ),

                  //lines between
                  Expanded(
                    child: Container(
                      height: 3,
                      color: Colors.grey, // kulay ng linya (pwede palitan)
                    ),
                  ),

                  CircleAvatar(
                    radius: 20,
                    backgroundColor: lightgrey,
                    child: Text(
                      '2',
                      style: GoogleFonts.sora(color: quartenary),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            //Instruction
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 30, right: 20),
              child: Text(
                'Describe the problem you have encountered. Please be as specific as possible',
                style: GoogleFonts.sora(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: dark,
                ),
              ),
            ),

            SizedBox(height: 20),
            //Input box
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: TextField(
                controller: _controller,
                maxLines: 8,
                decoration: InputDecoration(
                  hintText: "Describe your issue/problem here...",
                  contentPadding: EdgeInsets.only(left: 12, top: 15),
                  border: InputBorder.none,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: dark),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: dark, width: 1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),

            SizedBox(height: 10),

            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Text(
                '(Optional)',
                style: GoogleFonts.sofiaSans(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: lightgrey
                ),
              ),
            ),

            SizedBox(height: 5),

            // Attach file section
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 350,
                    height: 50,
                    child: TextButton.icon(
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        backgroundColor: lightgrey,
                      ),
                      onPressed: pickFile,
                      icon: Icon(
                        TablerIcons.paperclip,
                        color: dark,
                        size: 18,
                      ),
                      label: Text(
                        'Attach File',
                        style: GoogleFonts.sofiaSans(
                          color: dark,
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),

                 //For showing file name if there's an attached
                 if (_filePath != null && _fileName !=null) ...[
                  SizedBox(height: 8),
                  Text(
                    'Attached: $_fileName',
                    style: GoogleFonts.sofiaSans(
                      color: dark,
                      fontSize: 15,
                    ),
                  ),

                  // if preview shown
                  if (_isImage(_fileName!)) ...[
                    SizedBox(height: 8),
                    SizedBox(
                      height: 100,
                      child: Image.file(File(_filePath!)),
                    )
                  ]
                 ]

                ],
              ),
            ),

            SizedBox(height: 80),

            //Next
            Padding(
              padding: const EdgeInsets.only(left: 270),
              child: SizedBox(
                width: 115,
                height: 45,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const NextPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: details,
                    padding: EdgeInsets.symmetric(vertical: 5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(8),
                    ),
                  ),
                  child: Text(
                    'Next',
                    style: GoogleFonts.sofiaSans(
                      fontSize: 15,
                      color: quartenary,
                      fontWeight: FontWeight.w600,
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
