import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:confidease/styles/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:confidease/services/email_services.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  //inputs
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  String? selectedAvatar;

  List<String> avatarList = [
    'https://i.pinimg.com/736x/d7/a7/61/d7a761f988ccb4131ddc15a19844bc52.jpg',
    'https://i.pinimg.com/736x/d2/fa/c8/d2fac83f8aa6a7b7a6cf1be6a7430d01.jpg',
    'https://i.pinimg.com/1200x/84/21/3c/84213c274232612ea26c8809893b3c7f.jpg',
    'https://i.pinimg.com/736x/21/24/92/21249201424022cdd93cd144f099b056.jpg',
    'https://i.pinimg.com/1200x/0e/a8/29/0ea829c5094686085be3cc136b1bdc68.jpg',
  ];

  @override
  void dispose() {
    _emailController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _dateController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  void _loadUserData() async {
    final uid = FirebaseAuth.instance.currentUser!.uid;
    final userDoc = await FirebaseFirestore.instance
        .collection('user')
        .doc(uid)
        .get();

    if (userDoc.exists) {
      final data = userDoc.data()!;
      setState(() {
        _emailController.text = data['email'] ?? '';
        _firstNameController.text = data['user_fname'] ?? '';
        _lastNameController.text = data['user_lname'] ?? '';
        _dateController.text = data['user_bday'] ?? '';
        selectedAvatar = data['avatar'] ?? 
        'https://i.pinimg.com/736x/20/66/99/206699b44b5cbe16450c19da611d73c7.jpg';
      });
    }
  }

  Widget _buildLabel(String text, {TextStyle? style}) {
    return Container(
      margin: const EdgeInsets.only(top: 20, bottom: 5),
      width: 285,
      child: Text(
        text,
        style:
            style ??
            GoogleFonts.sofiaSans(
              fontWeight: FontWeight.w700,
              color: Colors.black,
              fontSize: 12,
            ),
      ),
    );
  }

  Widget _buildTextField({required TextEditingController controller}) {
    return SizedBox(
      height: 33,
      width: 285,
      child: TextField(
        controller: controller,
        //textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          //hintText: hintText,
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
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              //border: Border.all(color: dark, ),
            ),
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: quartenary, size: 20),
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
            fontSize: 20,
            color: quartenary,
          ),
        ),
      ),

      //body
      body: Container(
        padding: EdgeInsets.only(left: 80, top: 25, right: 80),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Center(
                child: Stack(
                  children: [
                    GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          context: context, 
                          builder: (context) {
                            return GridView.builder(
                              padding: const EdgeInsets.all(16),
                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                mainAxisSpacing: 10,
                                crossAxisSpacing: 10,
                                ),
                                itemCount: avatarList.length,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () async {
                                      final uid = FirebaseAuth.instance.currentUser!.uid;
                                      setState(() {
                                        selectedAvatar = avatarList[index];
                                      });
                                      await FirebaseFirestore.instance
                                        .collection('user')
                                        .doc(uid)
                                        .update({'avatar': selectedAvatar});
                                      Navigator.pop(context);
                                    },
                                    child: CircleAvatar(
                                      backgroundImage: NetworkImage(avatarList[index]),
                                      radius: 40,
                                    ),
                                  );
                                },
                              );
                          },
                        );
                      },
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          border: Border.all(width: 4, color: secondary),
                          boxShadow: [
                            BoxShadow(
                              spreadRadius: 2,
                              blurRadius: 10,
                              // ignore: deprecated_member_use
                              color: Colors.black.withOpacity(0.1),
                            ),
                          ],
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              selectedAvatar ??
                              'https://i.pinimg.com/736x/20/66/99/206699b44b5cbe16450c19da611d73c7.jpg',
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        height: 25,
                        width: 25,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(width: 1, color: profile),
                          color: lightgrey,
                        ),
                        child: Icon(
                          TablerIcons.pencil_minus,
                          color: dark,
                          size: 15,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),

              //text fields
              _buildLabel(
                'First Name',
                style: GoogleFonts.sofiaSans(
                  fontWeight: FontWeight.w700,
                  fontSize: 12,
                  color: dark,
                ),
              ),
              _buildTextField(controller: _firstNameController),

              _buildLabel(
                'Last Name',
                style: GoogleFonts.sofiaSans(
                  fontWeight: FontWeight.w700,
                  fontSize: 12,
                  color: dark,
                ),
              ),
              _buildTextField(controller: _lastNameController),

              _buildLabel(
                'Email Address',
                style: GoogleFonts.sofiaSans(
                  fontWeight: FontWeight.w700,
                  fontSize: 12,
                  color: dark,
                ),
              ),
              _buildTextField(controller: _emailController),

              _buildLabel(
                'Birthday',
                style: GoogleFonts.sofiaSans(
                  fontWeight: FontWeight.w700,
                  fontSize: 12,
                  color: dark,
                ),
              ),
              SizedBox(
                height: 33,
                width: 286,
                child: TextField(
                  controller: _dateController,
                  readOnly: true,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(left: 10),
                    suffixIcon: const Icon(Icons.calendar_today),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(color: field, width: 1),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(color: field, width: 2),
                    ),
                    filled: true,
                    fillColor: lightgrey,
                  ),
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate:
                          DateTime.tryParse(_dateController.text) ??
                          DateTime.now(),
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

              //Button
              Padding(
                padding: const EdgeInsets.only(left: 30.0, top: 45, right: 30),
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 20,
                    ),
                    side: const BorderSide(color: dark, width: 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    backgroundColor: details,
                  ),
                  onPressed: () async {
                    final uid = FirebaseAuth.instance.currentUser!.uid;
                    final user = FirebaseAuth.instance.currentUser!;

                    final userDoc = await FirebaseFirestore.instance
                        .collection('user')
                        .doc(uid)
                        .get();

                    final oldEmail = userDoc['email'];
                    final newEmail = _emailController.text.trim();

                    // 🔹 Step 1: If email is changed
                    if (newEmail != oldEmail) {
                      try {
                        // Ask Firebase to send a verification link before updating
                        await user.verifyBeforeUpdateEmail(newEmail);

                        // Optional: send a friendly email using Brevo
                        await sendNewEmailUp(
                          newEmail,
                          _firstNameController.text.trim(),
                          newEmail,
                        );

                        // Show info to the user
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              "We’ve sent a verification link to $newEmail. "
                              "Please verify to complete the update.",
                            ),
                          ),
                        );

                        return; // 🚨 stop here until the user verifies via email
                      } catch (e) {
                        print("❌ Failed to start email update: $e");
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Error: Unable to update email.")),
                        );
                        return;
                      }
                    }

                    // 🔹 Step 2: Update Firestore profile fields (if email didn't change, or later after verification)
                    await FirebaseFirestore.instance.collection('user').doc(uid).update({
                      'user_fname': _firstNameController.text.trim(),
                      'user_lname': _lastNameController.text.trim(),
                      'email': newEmail,
                      'user_bday': _dateController.text.trim(),
                      'avatar': selectedAvatar,
                    });

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Profile updated successfully!')),
                    );

                    Navigator.pop(context);
                  },


                  child: Text(
                    'SAVE CHANGES',
                    style: GoogleFonts.sora(
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                      color: savechanges,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
