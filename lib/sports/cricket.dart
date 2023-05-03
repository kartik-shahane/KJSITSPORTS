// ignore_for_file: sort_child_properties_last, prefer_const_constructors

import 'package:fire_auth/Pages/return.dart';
import 'package:fire_auth/user_credential.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fire_auth/Pages/issued.dart';
import 'package:fire_auth/UI/auth/login_screen.dart';

class CricketPage extends StatefulWidget {
  const CricketPage({super.key});

  @override
  State<CricketPage> createState() => _CricketPageState();
}

class _CricketPageState extends State<CricketPage> {
  final databaseRef = FirebaseDatabase.instance.ref('$globalusername');
  final auth = FirebaseDatabase.instance.ref('$globalusername');

//final $globalusername=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(globalsport.toString()),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(padding: EdgeInsets.only(top: 20)),
            // ignore: avoid_unnecessary_containers
            Container(
              child:
                  const Image(image: AssetImage('assets/images/cricket.jpg')),
            ),
            const Padding(padding: EdgeInsets.only(top: 30)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 100,
                  height: 80,
                  child: Center(
                    child: Text(
                      'Total= 10',
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.lightBlue[100],
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                Container(
                  width: 100,
                  height: 80,
                  child: Center(
                    child: Text(
                      'Issued=${Tcricketkit - cricketkit}',
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.lightBlue[100],
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                Container(
                  width: 120,
                  height: 80,
                  child: Center(
                    child: Text(
                      'Remained = $cricketkit',
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.lightBlue[100],
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ],
            ),
            Padding(padding: EdgeInsets.all(40)),
            Row(
              children: [
                Expanded(
                    child: Align(
                        alignment: Alignment.bottomCenter,
                        child: ElevatedButton(
                          onPressed: () {
                            if (!issued) {
                              setState(() {
                                cricketkit--;
                                issued = true;
                              });

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const IssuedPage()),
                              );
                            }
                          },
                          child: Text('Issue'),
                          style: ButtonStyle(
                            minimumSize:
                                MaterialStateProperty.all(const Size(160, 50)),
                            backgroundColor: MaterialStateProperty.all(
                                Colors.lightBlue[500]),
                          ),
                        ))),
                Expanded(
                    child: Align(
                        alignment: Alignment.bottomCenter,
                        child: ElevatedButton(
                          onPressed: () {
                            if (issued) {
                              setState(() {
                                cricketkit++;
                                issued = false;
                              });

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const ReturnPage()),
                              );
                            }
                          },
                          child: Text('Return'),
                          style: ButtonStyle(
                            minimumSize:
                                MaterialStateProperty.all(const Size(160, 50)),
                            backgroundColor: MaterialStateProperty.all(
                                Colors.lightBlue[500]),
                          ),
                        ))),
              ],
            ),
            const Padding(padding: EdgeInsets.only(bottom: 70)),
          ],
        ),
      ),
    );
  }
}
