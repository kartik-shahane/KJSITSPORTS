// ignore_for_file: sort_child_properties_last, prefer_const_constructors

import 'package:fire_auth/Pages/return.dart';
import 'package:fire_auth/user_credential.dart';
import 'package:flutter/material.dart';
import 'package:fire_auth/Pages/issued.dart';

class VollyballPage extends StatefulWidget {
  const VollyballPage({super.key});

  @override
  State<VollyballPage> createState() => _VollyballPageState();
}

class _VollyballPageState extends State<VollyballPage> {
  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vollyball Equipment'),
      ),
      // ignore: avoid_unnecessary_containers
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(padding: EdgeInsets.only(top: 20)),

            // ignore: avoid_unnecessary_containers
            Container(
              child:
                  const Image(image: AssetImage('assets/images/vollyball.jpg')),
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
                      'Total= $Tvollyball',
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
                      'Issued= ${Tvollyball-vollyball}',
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
                      'Remained = $vollyball',
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
                                vollyball--;
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
                          onPressed: () {if (issued) {
                              setState(() {
                                vollyball++;
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
