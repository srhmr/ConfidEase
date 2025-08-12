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
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: primary,
        title: Text(
          'Here\'s your\nuploaded script.',
          style: GoogleFonts.sora(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(
              height: 500,
              child: ScrollbarTheme(
                data: ScrollbarThemeData(
                  thumbColor: WidgetStateProperty.all(primary),
                  thickness: WidgetStateProperty.all(6),
                  radius: const Radius.circular(8),
                ),
                child: Scrollbar(
                  controller: _scrollController,
                  thumbVisibility: true,
                  child: TextField(
                    controller: _scriptController,
                    scrollController: _scrollController, // attach here
                    maxLines: null,
                    expands: true, // makes it fill the height
                    keyboardType: TextInputType.multiline,
                    textAlignVertical: TextAlignVertical.top,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      alignLabelWithHint: true,
                      hintText: 'Type or paste your script...',
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: 20),
            Container(
              width: 250,
              height: 45,
              margin: const EdgeInsets.only(top: 20),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ImproveScript()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 20,
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
                    fontSize: 15,
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
