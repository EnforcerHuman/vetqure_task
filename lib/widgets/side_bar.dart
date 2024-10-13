import 'package:flutter/material.dart';
import 'package:vetqure_task/constants/colors.dart';

class SideBarWidget extends StatelessWidget {
  const SideBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      color: AppColors.drawerColor,
      child: const Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ProfileSection(),
              SideBarTitle(icon: Icons.dashboard, categoryname: 'DashBoard'),
              SizedBox(
                height: 10,
              ),
              SideBarTitle(
                  icon: Icons.calendar_month, categoryname: 'Calender'),
              SizedBox(
                height: 10,
              ),
              SideBarTitle(icon: Icons.folder, categoryname: 'Client'),
              SizedBox(
                height: 10,
              ),
              SideBarTitle(icon: Icons.person, categoryname: 'Profile'),
              SizedBox(
                height: 10,
              ),
              SideBarTitle(
                  icon: Icons.network_cell_sharp, categoryname: 'Finance'),
              SizedBox(
                height: 10,
              ),
              SideBarTitle(
                  icon: Icons.local_shipping, categoryname: 'Inventory'),
              SizedBox(
                height: 10,
              ),
              SideBarTitle(icon: Icons.shopping_bag, categoryname: 'Order'),
              SizedBox(
                height: 40,
              ),
              SideBarTitle(icon: Icons.logout, categoryname: 'Logout'),
            ],
          )),
    );
  }
}

class ProfileSection extends StatelessWidget {
  const ProfileSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          child: Image.asset('assets/images/Img.png'),
        ),
        TextButton.icon(
          icon: const Text(
            'Name',
            style: TextStyle(color: AppColors.primaryColor),
          ),
          label: const Icon(
            Icons.edit_square,
            color: AppColors.primaryColor,
          ),
          onPressed: () {},
        )
      ],
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
          style: const TextStyle(color: AppColors.primaryColor, fontSize: 18),
        )
      ]),
    );
  }
}
