// ignore_for_file: prefer_adjacent_string_concatenation

import 'package:fire_auth/user_credential.dart';
import 'package:flutter/material.dart';
import 'package:fire_auth/sports/badminton.dart';

import 'package:fire_auth/sports/carrom.dart';
import 'package:fire_auth/sports/cricket.dart';
import 'package:fire_auth/sports/tennis.dart';
import 'package:fire_auth/sports/vollyball.dart';

class SelectSport extends StatefulWidget {
  const SelectSport({super.key});

  @override
  State<SelectSport> createState() => _SelectSportState();
}

class _SelectSportState extends State<SelectSport> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("select_sport"),
       
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const Image(
                      height: 100,
                      width: 100,
                      image: AssetImage('assets/images/b.jpg'),
                    ),
                    const SizedBox(width: 10),
                    const Text("  " + 'Badminton'),
                    const Padding(padding: EdgeInsets.only(left: 60)),
                    Expanded(
                        child: Align(
                      alignment: Alignment.centerRight,
                      child: ElevatedButton(
                        onPressed: () => {
                          globalsport = "Badminton",
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const BadmintonPage())),
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue),
                        child: const Text('Select'),
                      ),
                    )),
                    const Padding(padding: EdgeInsets.only(right: 10))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const Image(
                      height: 100,
                      width: 100,
                      image: AssetImage('assets/images/c.jpg'),
                    ),
                    const SizedBox(width: 20),
                    const Text(" " + 'Carrom'),
                    const Padding(padding: EdgeInsets.only(left: 80)),
                    Expanded(
                        child: Align(
                      alignment: Alignment.centerRight,
                      child: ElevatedButton(
                        onPressed: () => {
                          globalsport = "Carrom",
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const CarromPage())),
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue),
                        child: const Text('Select'),
                      ),
                    )),
                    const Padding(padding: EdgeInsets.only(right: 10))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const Image(
                      height: 100,
                      width: 100,
                      image: AssetImage('assets/images/cc.jpg'),
                    ),
                    const SizedBox(width: 10),
                    const Text("  " + 'Cricket'),
                    const Padding(padding: EdgeInsets.only(left: 60)),
                    Expanded(
                        child: Align(
                      alignment: Alignment.centerRight,
                      child: ElevatedButton(
                        onPressed: () => {
                          globalsport = "Cricket",
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const CricketPage())),
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue),
                        child: const Text('Select'),
                      ),
                    )),
                    const Padding(padding: EdgeInsets.only(right: 10))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const Image(
                      height: 100,
                      width: 100,
                      image: AssetImage('assets/images/t.jpg'),
                    ),
                    const SizedBox(width: 10),
                    const Text("  " + 'Tennis'),
                    const Padding(padding: EdgeInsets.only(left: 60)),
                    Expanded(
                        child: Align(
                      alignment: Alignment.centerRight,
                      child: ElevatedButton(
                        onPressed: () => {
                          globalsport = "Tennis",
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const TennisPage())),
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue),
                        child: const Text('Select'),
                      ),
                    )),
                    const Padding(padding: EdgeInsets.only(right: 10)),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const Image(
                      height: 100,
                      width: 100,
                      image: AssetImage('assets/images/v.jpg'),
                    ),
                    const SizedBox(width: 10),
                    const Text("  " + 'Vollyball'),
                    const Padding(padding: EdgeInsets.only(left: 60)),
                    Expanded(
                        child: Align(
                      alignment: Alignment.centerRight,
                      child: ElevatedButton(
                        onPressed: () => {
                          globalsport = "Vollyball",
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const VollyballPage())),
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue),
                        child: const Text('Select'),
                      ),
                    )),
                    const Padding(padding: EdgeInsets.only(right: 10))
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
