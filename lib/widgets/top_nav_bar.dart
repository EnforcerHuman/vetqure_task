import 'package:flutter/material.dart';
import 'package:vetqure_task/widgets/nav_item.dart';
import 'package:vetqure_task/widgets/profile_view.dart';

class TopNavBar extends StatelessWidget {
  final double sidebarwidth;
  TopNavBar({super.key, required this.sidebarwidth});
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: screenWidth - sidebarwidth,
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(30),
          bottomLeft: Radius.circular(30),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (screenWidth < 1300)
            IconButton(
                onPressed: () {
                  _toggleDrawer(context);
                },
                icon: const Icon(Icons.menu)),
          Text(
            'Title',
            style: TextStyle(
              fontSize: screenWidth > 600 ? 24 : 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              NavItem(
                icon: Icon(Icons.message, size: screenWidth > 600 ? 28 : 20),
                title: screenWidth > 1300 ? 'Message' : '',
                fontSize: screenWidth > 600 ? 18 : 14,
                padding: screenWidth > 600 ? 16 : 8,
              ),
              const SizedBox(
                width: 5,
              ),
              NavItem(
                icon: Icon(Icons.shopping_cart,
                    size: screenWidth > 600 ? 28 : 20),
                title: screenWidth > 1300 ? 'Cart' : '',
                fontSize: screenWidth > 600 ? 18 : 14,
                padding: screenWidth > 600 ? 16 : 8,
              ),
              const SizedBox(
                width: 5,
              ),
              NavItem(
                icon: Icon(Icons.notifications_none,
                    size: screenWidth > 600 ? 28 : 20),
                title: screenWidth > 1300 ? 'notifications' : '',
                fontSize: screenWidth > 600 ? 18 : 14,
                padding: screenWidth > 600 ? 16 : 8,
              ),
              const ProfieViewWidget()
            ],
          ),
        ],
      ),
    );
  }

  void _toggleDrawer(BuildContext context) {
    if (_scaffoldKey.currentState!.isDrawerOpen) {
      Navigator.of(context).pop(); // Close the drawer
    } else {
      _scaffoldKey.currentState!.openDrawer(); // Open the drawer
    }
  }
}
