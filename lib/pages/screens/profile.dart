import 'package:confidease/pages/edit_profile.dart';
import 'package:confidease/pages/set_reminder.dart';
import 'package:flutter/material.dart';
import 'package:confidease/styles/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

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
                CircleAvatar(
                  radius: 35,
                  backgroundColor: secondary,
                  child: Icon(
                    LucideIcons.userRound500,
                    size: 40,
                    color: quartenary,
                  ),
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
              contentPadding: EdgeInsets.only(left: 3, right: 30),
              leading: Icon(TablerIcons.user_circle, size: 30, color: dark),
              title: Text(
                'Edit Profile',
                style: GoogleFonts.sora(fontWeight: FontWeight.w600),
              ),
              trailing: Icon(TablerIcons.chevron_right, size: 25),
              onTap: () {
                //navigate
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const EditProfile()),
                );
              },
            ),
            ListTile(
              contentPadding: EdgeInsets.only(left: 3, right: 30),
              leading: Icon(TablerIcons.user_edit, size: 30, color: dark),
              title: Text(
                'Delete Profile',
                style: GoogleFonts.sora(fontWeight: FontWeight.w600),
              ),
              trailing: Icon(TablerIcons.chevron_right, size: 25),
              onTap: () {
                //navigate
              },
            ),
            ListTile(
              contentPadding: EdgeInsets.only(left: 3, right: 30),
              leading: Icon(LucideIcons.keyRound, size: 28, color: dark),
              title: Text(
                'Change Password',
                style: GoogleFonts.sora(fontWeight: FontWeight.w600),
              ),
              trailing: Icon(TablerIcons.chevron_right, size: 25),
              onTap: () {
                //navigate
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
            ListTile(
              contentPadding: EdgeInsets.only(left: -1, right: 30),
              leading: Icon(TablerIcons.bell_minus, size: 30, color: dark),
              title: Text(
                'Set Reminder',
                style: GoogleFonts.sora(fontWeight: FontWeight.w600),
              ),
              trailing: Icon(TablerIcons.chevron_right, size: 25),
              onTap: () {
                //navigate
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SetReminder()),
                );
              },
            ),
            SwitchListTile(
              contentPadding: EdgeInsets.only(left: 3, right: 10),
              title: Text(
                'Push Notifications',
                style: GoogleFonts.sora(fontWeight: FontWeight.w600),
              ),
              secondary: Icon(TablerIcons.bell_ringing_filled),
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
              contentPadding: EdgeInsets.only(left: 3, right: 30),
              leading: Icon(TablerIcons.file_info, size: 30, color: dark),
              title: Text(
                'FAQs',
                style: GoogleFonts.sora(fontWeight: FontWeight.w600),
              ),
              trailing: Icon(TablerIcons.chevron_right, size: 25),
              onTap: () {
                //navigate
              },
            ),
            SizedBox(height: 20),

            //Logout Button
            ListTile(
              contentPadding: EdgeInsets.only(left: 6, right: 30),
              leading: Icon(TablerIcons.logout, size: 30, color: logout),
              title: Text(
                'Log Out',
                style: GoogleFonts.sora(
                  fontWeight: FontWeight.w600,
                  color: logout,
                ),
              ),
              trailing: Icon(TablerIcons.chevron_right, size: 25),
              onTap: () {
                //navigate
              },
            ),
          ],
        ),
      ),
    );
  }
}
