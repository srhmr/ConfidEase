import 'package:flutter/material.dart';
import 'package:confidease/styles/colors.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

class CustomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemTap;

  const CustomNavigationBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTap,
  });

  @override
  Widget build(BuildContext context) {
    List<IconData> icons = [
      TablerIcons.layout_dashboard,
      TablerIcons.book_2,
      TablerIcons.target_arrow,
      TablerIcons.chart_bar,
      TablerIcons.settings,
    ];

    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: primary,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
        border: Border.all(color: Color(0xFF000000), width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, -3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(icons.length, (index) {
          return GestureDetector(
            onTap: () => onItemTap(index),
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: selectedIndex == index ? secondary : Colors.transparent,
                border: selectedIndex == index
                    ? Border.all(color: details, width: 2)
                    : null,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(icons[index], size: 40, color: quartenary),
            ),
          );
        }),
      ),
    );
  }
}
