import 'package:confidease/pages/custom_navbar.dart';
import 'package:flutter/material.dart';

//screens
import 'pages/screens/dashboard.dart';
import 'pages/screens/second.dart';
import 'pages/screens/challenge.dart'; ///challenge
import 'pages/screens/fourth.dart';
import 'pages/screens/profile.dart';

class MainNavigator extends StatefulWidget {
  final String name;
  const MainNavigator({super.key, required this.name});

  @override
  State<MainNavigator> createState() => _MainNavigatorState();
}

class _MainNavigatorState extends State<MainNavigator> {
  int _selectedIndex = 0;

  late final List<Widget> _screens;

  @override
  void initState() {
    super.initState();
    _screens = [
      Dashboard(name: widget.name),  //dashboard
      SecondScreen(),  //learners corner
      Challenge(),  //challenge
      FourthScreen(),  //progress
      Profile(name: widget.name),  //profile settings
    ];
  }

  
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _screens[_selectedIndex],
        bottomNavigationBar: CustomNavigationBar(
          selectedIndex: _selectedIndex,
          onItemTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
      ),
    );
  }
}
