import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fire_auth/user_credential.dart';
import 'package:fire_auth/UI/auth/login_screen.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          buildTop(),
          buildContent(),
        ],
      ),
    );
  }
}

Widget buildCoverImage() => Container(
      color: Colors.grey,
      child: Image.asset(
        'assets/images/p.png',
        width: double.infinity,
        // height:coverHeight ,
        height: 200,
        fit: BoxFit.cover,
      ),
    );

Widget buildProfileImage() => CircleAvatar(
      // radius: profileHeight/2,
      radius: 60,
      backgroundColor: Colors.grey.shade800,
      backgroundImage: const AssetImage('assets/images/p2.png'),
      //backgroundImage:NetworkImage('https://play-lh.googleusercontent.com/UjaAdTYsArv7zAJbqGWjQw2ftuOtnAlvokffC3TQQ2K12mwk0YdXUF2wZBTBA2kDZIk '
      // ),
    );

Widget buildTop() {
  //final top=coverHeight-profileHeight/2;
  return Stack(
    clipBehavior: Clip.none,
    alignment: Alignment.center,
    children: [
      Container(margin: const EdgeInsets.only(bottom: 58), child: buildCoverImage()),
      Positioned(
        top: 150,
        child: buildProfileImage(),
      ),
    ],
  );
}

Widget buildContent() => Column(
      children: [
        const SizedBox(
          height: 8,
        ),
         Text(
          globalusername.toString(),
           style: const TextStyle(
               fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        const SizedBox(
          height: 8,
        ),
        globaladmin ? const Text(
          'Administrator',
          style: TextStyle(fontSize: 20, color: Colors.black),
        ):const Text(
          'Student',
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
        
        const Padding(padding: EdgeInsets.only(top: 25)),
        const SizedBox(
          height: 16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(padding: EdgeInsets.all(5)),
            buildSocialIcon(FontAwesomeIcons.slack),
            const Padding(padding: EdgeInsets.all(5)),
            const SizedBox(
              height: 12,
            ),
            buildSocialIcon(FontAwesomeIcons.github),
            const Padding(padding: EdgeInsets.all(5)),
            const SizedBox(
              height: 12,
            ),
            buildSocialIcon(FontAwesomeIcons.instagram),
            const SizedBox(
              height: 12,
            ),
          ],
        ),
      ],
    );

Widget buildSocialIcon(IconData icon) => CircleAvatar(
      radius: 25,
      child: Material(
        shape: const CircleBorder(),
        clipBehavior: Clip.hardEdge,
        color: Colors.transparent,
        child: InkWell(
          onTap: () {},
          child: Center(child: Icon(icon, size: 32)),
        ),
      ),
    );
