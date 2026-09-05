import 'package:flutter/material.dart';

class SettingsMenu extends StatelessWidget {
  const SettingsMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      icon: const Icon(Icons.menu),
      onSelected: (value) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('$value selected'),
          ),
        );
      },
      itemBuilder: (context) => [
        const PopupMenuItem(
          value: 'Settings',
          child: Text('Settings'),
        ),
        const PopupMenuItem(
          value: 'Notifications',
          child: Text('Notifications'),
        ),
        const PopupMenuItem(
          value: 'Profile',
          child: Text('Profile'),
        ),
        const PopupMenuItem(
          value: 'Logout',
          child: Text('Logout'),
        ),
      ],
    );
  }
}