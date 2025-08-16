import 'package:confidease/pages/screens/improve_script.dart';
import 'package:flutter/material.dart';
import 'package:confidease/styles/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class UploadScript extends StatefulWidget {
  const UploadScript({super.key});

  @override
  State<UploadScript> createState() => _UploadScriptState();
}

class _UploadScriptState extends State<UploadScript> {
  final TextEditingController _scriptController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 120,
        backgroundColor: primary,
        title: FittedBox(
          fit: BoxFit.scaleDown,
          alignment: Alignment.centerLeft,
          child: Text(
            "Here's your\nuploaded script.",
            style: GoogleFonts.sora(
              fontSize: screenWidth * 0.06, // responsive font
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
        ),
        elevation: 0, 
        leading: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            decoration: BoxDecoration(
              color: details,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: quartenary, size: 20),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          
        ),// remove default shadow
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0), // height of the border
          child: Container(
            color: Colors.black, // border color
            height: 1.0, // thickness
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(screenWidth * 0.04),
        child: Column(
          children: [
            SizedBox(
              width: screenWidth * 0.99, // responsive width
              height: screenHeight * 0.60, // responsive height
              child: Expanded(
                child: ScrollbarTheme(
                  data: ScrollbarThemeData(
                    thumbColor: WidgetStateProperty.all(secondary),
                    thickness: WidgetStateProperty.all(6),
                    radius: const Radius.circular(8),
                  ),
                  child: Scrollbar(
                    controller: _scrollController,
                    thumbVisibility: true,
                    child: TextField(
                      controller: _scriptController,
                      scrollController: _scrollController,
                      maxLines: null,
                      expands: true,
                      keyboardType: TextInputType.multiline,
                      textAlignVertical: TextAlignVertical.top,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        alignLabelWithHint: true,
                        hintText: 'Type or paste your script...',
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            SizedBox(
              width: screenWidth * 0.6,
              height: screenHeight * 0.06,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ImproveScript()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                    vertical: screenHeight * 0.015,
                    horizontal: screenWidth * 0.05,
                  ),
                  side: const BorderSide(color: Colors.black, width: 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  backgroundColor: details,
                ),
                child: Text(
                  "ANALYZE",
                  style: GoogleFonts.sora(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: screenWidth * 0.04,
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
