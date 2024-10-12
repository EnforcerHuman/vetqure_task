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
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Fixit Admin',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            onTap: () {
              // Navigator.of(context).pushAndRemoveUntil(
              //     MaterialPageRoute(builder: (ctx) => ApplicationsScreen()),
              //     (route) => false);
            },
            leading: const Icon(Icons.dashboard),
            title: const Text('Applications'),
          ),
          ListTile(
            onTap: () {
              // Navigator.of(context).pushAndRemoveUntil(
              //     MaterialPageRoute(builder: (ctx) => const LoginScreen()),
              //     (route) => false);
            },
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Logout'),
          ),
        ],
      ),
    );
  }
}
