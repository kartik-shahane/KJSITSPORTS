// ignore_for_file: sort_child_properties_last, prefer_const_constructors, avoid_unnecessary_containers

import 'package:fire_auth/Pages/return.dart';
import 'package:flutter/material.dart';
import 'package:fire_auth/Pages/issued.dart';
import 'package:fire_auth/user_credential.dart';

class CarromPage extends StatefulWidget {
  const CarromPage({super.key});

  @override
  State<CarromPage> createState() => _CarromPageState();
}

class _CarromPageState extends State<CarromPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carrom Equipment'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(padding: EdgeInsets.only(top: 20)),
            Container(
              child: const Image(image: AssetImage('assets/images/carrom.jpg')),
            ),
            const Padding(padding: EdgeInsets.only(top: 30)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 100,
                  height: 80,
                  child: const Center(
                    child: Text(
                      'Total= $Tcarromkit',
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
                      'Issued= ${Tcarromkit - carromkit}',
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
                      'Remained= $carromkit',
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
                                carromkit--;
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
                            backgroundColor:
                                MaterialStateProperty.all(Colors.lightBlue[500]),
                          ),
                        ))),
                Expanded(
                    child: Align(
                        alignment: Alignment.bottomCenter,
                        child: ElevatedButton(
                          onPressed: () {if (issued) {
                              setState(() {
                                carromkit++;
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
                            backgroundColor:
                                MaterialStateProperty.all(Colors.lightBlue[500]),
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
