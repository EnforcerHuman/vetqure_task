import 'package:flutter/material.dart';
import 'package:vetqure_task/constants/colors.dart';

class SideBarWidget extends StatelessWidget {
  const SideBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      color: AppColors.drawerColor,
      child: Column(
        children: [
          Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  CircleAvatar(
                    child: Image.asset('assets/images/Img.png'),
                  ),
                  const Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Name',
                        style: TextStyle(color: Colors.white),
                      ),
                      Icon(Icons.edit_square)
                    ],
                  ),
                  const SideBarTitle(
                      icon: Icons.dashboard, categoryname: 'DashBoard'),
                  const SideBarTitle(
                      icon: Icons.calendar_month, categoryname: 'Calender'),
                  const SideBarTitle(
                      icon: Icons.folder, categoryname: 'Client'),
                  const SideBarTitle(
                      icon: Icons.person, categoryname: 'Profile'),
                  // const SideBarTitle(
                  //     icon: Icons., categoryname: 'DashBoard'),
                  const SideBarTitle(
                      icon: Icons.calendar_month, categoryname: 'Calender'),
                  const SideBarTitle(
                      icon: Icons.dashboard, categoryname: 'DashBoard'),
                  const SideBarTitle(
                      icon: Icons.calendar_month, categoryname: 'Calender'),
                ],
              )),
        ],
      ),
    );
  }
}

class SideBarTitle extends StatelessWidget {
  final IconData icon;
  final String categoryname;
  const SideBarTitle(
      {super.key, required this.icon, required this.categoryname});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(children: [
        Icon(
          icon,
          color: Colors.white,
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          categoryname,
          style: const TextStyle(color: Colors.white, fontSize: 18),
        )
      ]),
    );
  }
}
