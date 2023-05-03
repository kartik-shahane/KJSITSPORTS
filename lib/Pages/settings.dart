import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:fire_auth/example/ed_pro.dart';
import 'package:fire_auth/pages/settings_tile.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //automaticallyImplyLeading: false,
      title:const Text('Log Out')
      ),
      // body: SafeArea(
      //   child: Padding(
      //     padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      //     child: Column(
      //       crossAxisAlignment: CrossAxisAlignment.start,
      //       children: [
      //         ElevatedButton(
      //           onPressed: (() {
      //             SettingsUI();
      //           }),
      //           child: const Text(
      //             "Settings",
      //             style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
      //           ),
      //         ),
      //         const SizedBox(height: 40),
      //         SettingsTile(
      //           color: Colors.blue,
      //           icon: Ionicons.person_circle_outline,
      //           title: "Account",
      //           onTap: () {},
      //         ),
      //         const SizedBox(
      //           height: 15,
      //         ),
      //         SettingsTile(
      //           color: Colors.green,
      //           icon: Ionicons.pencil_outline,
      //           title: "Edit Information",
      //           onTap: () {},
      //         ),
      //         const SizedBox(
      //           height: 40,
      //         ),
      //         SettingsTile(
      //           color: Colors.black,
      //           icon: Ionicons.moon_outline,
      //           title: "Theme",
      //           onTap: () {},
      //         ),
      //         const SizedBox(
      //           height: 10,
      //         ),
      //         SettingsTile(
      //           color: Colors.purple,
      //           icon: Ionicons.language_outline,
      //           title: "Language",
      //           onTap: () {},
      //         ),
      //         const SizedBox(
      //           height: 40,
      //         ),
      //         SettingsTile(
      //           color: Colors.red,
      //           icon: Ionicons.log_out_outline,
      //           title: "Logout",
      //           onTap: () {},
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
