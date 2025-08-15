import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:confidease/pages/change_pw.dart';
import 'package:confidease/pages/delete_profile.dart';
import 'package:confidease/pages/edit_profile.dart';
import 'package:confidease/pages/faqs.dart';
import 'package:confidease/pages/landing.dart';
import 'package:confidease/pages/set_reminder.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:confidease/styles/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
//import 'package:lucide_icons_flutter/lucide_icons.dart';

class Profile extends StatefulWidget {
  final String name;
  const Profile({super.key, required this.name});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool pushNotifications = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //app bar
        appBar: AppBar(
          backgroundColor: primary,
          elevation: 0,
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: Text(
            'Settings',
            //textAlign: TextAlign.center,
            style: GoogleFonts.sora(
              fontWeight: FontWeight.w600,
              fontSize: 25,
              color: quartenary,
            ),
          ),
        ),

        //body
        body: ListView(
          padding: EdgeInsets.all(20),
          children: [
            //Profile Row
            Row(
              children: [
                StreamBuilder<DocumentSnapshot>(
                  stream: FirebaseFirestore.instance
                  .collection('user')
                  .doc(FirebaseAuth.instance.currentUser!.uid)
                  .snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                    return CircleAvatar(
                        radius: 30,
                        backgroundColor: secondary,
                        child: Icon(Icons.person_2, size: 40, color: quartenary),
                      );
                    }

                    var userData = snapshot.data!.data() as Map<String, dynamic>?;
                    return CircleAvatar(
                      radius: 30,
                      backgroundColor: secondary,
                      backgroundImage: NetworkImage(
                        userData?['avatar'] ??
                        'https://i.pinimg.com/736x/20/66/99/206699b44b5cbe16450c19da611d73c7.jpg',
                      ),
                    );
                  }
                ),
                
                SizedBox(width: 15),
                Text(
                  widget.name,
                  style: GoogleFonts.sora(
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                    color: dark,
                  ),
                ),
              ],
            ),
            SizedBox(height: 25),

            //Account title
            Text(
              'Account',
              style: GoogleFonts.sora(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: title,
              ),
            ),

            //Account items
            ListTile(
              contentPadding: EdgeInsets.only(left: 5, right: 25),
              leading: Image.asset('images/icons/editprofile.png', height: 30),
              title: Text(
                'Edit Profile',
                style: GoogleFonts.sora(fontWeight: FontWeight.w600),
              ),
              trailing: Image.asset('images/icons/chevron.png', height: 30),
              onTap: () {
                //navigate
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const EditProfile()),
                );
              },
            ),
            ListTile(
              contentPadding: EdgeInsets.only(left: 5, right: 25),
              leading: Image.asset(
                'images/icons/deleteprofile.png',
                height: 30,
              ),
              title: Text(
                'Delete Profile',
                style: GoogleFonts.sora(fontWeight: FontWeight.w600),
              ),
              trailing: Image.asset('images/icons/chevron.png', height: 30),
              onTap: () {
                //showDialog code
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      contentPadding: const EdgeInsets.all(20),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Delete Profile',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.sora(
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                              color: dark,
                            ),
                          ),
                          const SizedBox(height: 15),
                          Text(
                            'Are you sure you want to delete your account?',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.sora(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: dark,
                            ),
                          ),
                          const SizedBox(height: 25),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                width: 87,
                                height: 35,
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                    backgroundColor: details,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                  onPressed: () async {
                                    try {
                                      //get current user email
                                      User? user =
                                          FirebaseAuth.instance.currentUser;
                                      if (user != null && user.email != null) {
                                        //Send verification email
                                        await user.sendEmailVerification();

                                        Navigator.pop(
                                          context,
                                        ); //close dialog temp

                                        //Success message
                                        ScaffoldMessenger.of(
                                          context,
                                        ).showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'A verification code has been sent to your ${user.email}',
                                            ),
                                          ),
                                        );

                                        //Navigate to code page
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => DeleteProfile(
                                              email: user.email!,
                                            ),
                                          ),
                                        );
                                      }
                                    } catch (e) {
                                      print('Error sending verification email: $e');
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(content: Text('Failed to send email. Please try again.')),
                                      );
                                    }
                                  },
                                  child: Text(
                                    'Yes',
                                    style: GoogleFonts.sora(
                                      fontWeight: FontWeight.w600,
                                      color: quartenary,
                                      fontSize: 13,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 87,
                                height: 35,
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                    backgroundColor: cancel,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context); // Cancel
                                  },
                                  child: Text(
                                    'No',
                                    style: GoogleFonts.sora(
                                      fontWeight: FontWeight.w600,
                                      color: quartenary,
                                      fontSize: 13,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
            ListTile(
              contentPadding: EdgeInsets.only(left: 3, right: 25),
              leading: Image.asset('images/icons/changepw.png', height: 30),
              title: Text(
                'Change Password',
                style: GoogleFonts.sora(fontWeight: FontWeight.w600),
              ),
              trailing: Image.asset('images/icons/chevron.png', height: 30),
              onTap: () {
                //navigate
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ChangePassword()),
                );
              },
            ),

            SizedBox(height: 20),

            //Notification header
            Text(
              'Notifications',
              style: GoogleFonts.sora(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: title,
              ),
            ),

            //Notification Items

            //Set Reminder
            ListTile(
              contentPadding: EdgeInsets.only(left: 5, right: 25),
              leading: Image.asset('images/icons/setreminder.png', height: 30),
              title: Text(
                'Set Reminder',
                style: GoogleFonts.sora(fontWeight: FontWeight.w600),
              ),
              trailing: Image.asset('images/icons/chevron.png', height: 30),
              onTap: () {
                //navigate
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SetReminder()),
                );
              },
            ),

            SwitchListTile(
              contentPadding: EdgeInsets.only(left: 5, right: 10),
              title: Text(
                'Push Notifications',
                style: GoogleFonts.sora(fontWeight: FontWeight.w600),
              ),
              secondary: Image.asset('images/icons/pushnotif.png', height: 30),
              value: pushNotifications,
              onChanged: (val) {
                setState(() {
                  pushNotifications = val;
                });
              },
            ),

            SizedBox(height: 20),

            //About header
            Text(
              'About',
              style: GoogleFonts.sora(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: title,
              ),
            ),

            //About item (faqs)
            ListTile(
              contentPadding: EdgeInsets.only(left: 5, right: 25),
              leading: Icon(TablerIcons.info_circle, size: 30, color: dark),
              title: Text(
                'FAQs',
                style: GoogleFonts.sora(fontWeight: FontWeight.w600),
              ),
              trailing: Image.asset('images/icons/chevron.png', height: 30),
              onTap: () {
                //navigate
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Faqs()),
                );
              },
            ),
            //SizedBox(height: 5),
            ListTile(
              contentPadding: EdgeInsets.only(left: 5, right: 25),
              leading: Icon(TablerIcons.flag_3, size: 30, color: dark),
              title: Text(
                'Report a problem',
                style: GoogleFonts.sora(fontWeight: FontWeight.w600),
              ),
              trailing: Image.asset('images/icons/chevron.png', height: 30),
              onTap: () {
                //navigate
              },
            ),
            SizedBox(height: 20),

            //Logout Button
            ListTile(
              contentPadding: EdgeInsets.only(left: 10, right: 25),
              leading: Image.asset('images/icons/logout.png', height: 30),
              title: Text(
                'Log Out',
                style: GoogleFonts.sora(
                  fontWeight: FontWeight.w600,
                  color: logout,
                ),
              ),
              trailing: Image.asset('images/icons/chevron.png', height: 30),

              onTap: () {
                //showDialog code
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      contentPadding: const EdgeInsets.all(20),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Logout',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.sora(
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                              color: dark,
                            ),
                          ),
                          const SizedBox(height: 15),
                          Text(
                            'Are you sure you want to logout of your account?',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.sora(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: dark,
                            ),
                          ),
                          const SizedBox(height: 25),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                width: 87,
                                height: 35,
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                    backgroundColor: cancel,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context); // Cancel
                                  },
                                  child: Text(
                                    'Cancel',
                                    style: GoogleFonts.sora(
                                      fontWeight: FontWeight.w600,
                                      color: quartenary,
                                      fontSize: 13,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 87,
                                height: 35,
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                    backgroundColor: details,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                  onPressed: () {
                                    FirebaseAuth.instance.signOut(); // Logout
                                    Navigator.of(context).pushAndRemoveUntil(
                                      MaterialPageRoute(
                                        builder: (context) => LandingPage(),
                                      ),
                                      (route) => false,
                                    );
                                  },
                                  child: Text(
                                    'Logout',
                                    style: GoogleFonts.sora(
                                      fontWeight: FontWeight.w600,
                                      color: quartenary,
                                      fontSize: 13,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
