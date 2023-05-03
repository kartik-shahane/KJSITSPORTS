// ignore_for_file: prefer_const_constructors

import 'package:fire_auth/Pages/Profile.dart';
import 'package:fire_auth/Pages/home.dart';
import 'package:fire_auth/Pages/my_drawer_header.dart';
import 'package:fire_auth/Pages/student_info.dart';
import 'package:fire_auth/Pages/settings.dart';
import 'package:fire_auth/Pages/splash.dart';
import 'package:fire_auth/UI/auth/posts/post_screen.dart';
// ignore: unused_import
import 'package:fire_auth/user_credential.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
// ignore: unused_import
import 'package:fire_auth/UI/auth/login_screen.dart';
import 'UI/auth/posts/calendar.dart';

// Future main() async {
//   WidgetsFlutterBinding.ensureInitialized();
// await Firebase.initializeApp();

//   runApp(const MyApp());
// }

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       debugShowCheckedModeBanner: false,
      title: 'KJSIT Sports',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: SplashPage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  get text => null;
  var currentPage = DrawerSections.home;

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_typing_uninitialized_variables
    var container;
    if (currentPage == DrawerSections.home) {
      container = const StartPage();
    } else if (currentPage == DrawerSections.dashboard) {
      container = const DashboardPage();
    } else if (currentPage == DrawerSections.events) {
      container = const Calendar();
    } else if (currentPage == DrawerSections.student_info) {
      container = const NotesPage();
    } else if (currentPage == DrawerSections.settings) {
      container = SettingsScreen();
    } else if (currentPage == DrawerSections.notification) {
      container = const PostScreen();
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('KJSIT Sports'),
      ),
      body: container,
      drawer: Drawer(
          child: SingleChildScrollView(
              // ignore: avoid_unnecessary_containers
              child: Container(
        child: Column(children: [
          const MyHeaderDrawer(),
          MyDrawerList(),
        ]),
      ))),
    );
  }

  // ignore: non_constant_identifier_names
  Widget MyDrawerList() {
    return Container(
      padding: const EdgeInsets.only(
        top: 15,
      ),
      child: Column(
        children: [
          menuItem(1, "Home", Icons.dashboard_outlined,
              currentPage == DrawerSections.home ? true : false),
          menuItem(2, "Profile", Icons.people_alt_outlined,
              currentPage == DrawerSections.dashboard ? true : false),
          menuItem(3, "Events", Icons.event,
              currentPage == DrawerSections.events ? true : false),
          menuItem(4, "Student_info", Icons.notes,
              currentPage == DrawerSections.student_info ? true : false),
          //const Divider(),
          menuItem(5, "Settings", Icons.settings_outlined,
              currentPage == DrawerSections.settings ? true : false),
          menuItem(6, "Notification", Icons.notifications_outlined,
              currentPage == DrawerSections.notification ? true : false),
        ],
      ),
    );
  }

  Widget menuItem(int id, String title, IconData icon, bool selected) {
    return Material(
      color: selected ? Colors.grey[300] : Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          setState(() {
            if (id == 1) {
              currentPage = DrawerSections.home;
            } else if (id == 2) {
              currentPage = DrawerSections.dashboard;
            } else if (id == 3) {
              currentPage = DrawerSections.events;
            } else if (id == 4) {
              currentPage = DrawerSections.student_info;
            } else if (id == 5) {
              currentPage = DrawerSections.settings;
            } else if (id == 6) {
              currentPage = DrawerSections.notification;
            }
          });
        },
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            children: [
              Expanded(
                child: Icon(
                  icon,
                  size: 25,
                  color: Colors.black,
                ),
              ),
              Expanded(
                flex: 4,
                child: Text(
                  title,
                  style: const TextStyle(color: Colors.black, fontSize: 20),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

enum DrawerSections {
  home,
  dashboard,
  events,
  // ignore: constant_identifier_names
  student_info,
  settings,
  notification,
  // ignore: constant_identifier_names
  privacy_policy,
  // ignore: constant_identifier_names
  send_feedback,
  contacts,
}
