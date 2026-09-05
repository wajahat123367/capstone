import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() =>
      _SettingsScreenState();
}

class _SettingsScreenState
    extends State<SettingsScreen> {
  bool darkMode = false;
  bool notifications = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        children: [
          SwitchListTile(
            title: const Text('Dark Mode'),
            subtitle: const Text(
              'Enable dark mode',
            ),
            value: darkMode,
            onChanged: (value) {
              setState(() {
                darkMode = value;
              });
            },
          ),

          SwitchListTile(
            title: const Text('Notifications'),
            subtitle: const Text(
              'Enable notifications',
            ),
            value: notifications,
            onChanged: (value) {
              setState(() {
                notifications = value;
              });
            },
          ),

          const ListTile(
            leading: Icon(Icons.language),
            title: Text('Language'),
            subtitle: Text('English'),
          ),

          const ListTile(
            leading: Icon(Icons.privacy_tip),
            title: Text('Privacy'),
          ),
        ],
      ),
    );
  }
}