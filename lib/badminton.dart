// ignore_for_file: prefer_const_constructors, sort_child_properties_last, depend_on_referenced_packages
// ignore: unused_import
import 'package:fire_auth/main.dart';
import 'package:fire_auth/user_credential.dart';
import 'package:flutter/material.dart';
import 'package:fire_auth/issued.dart';

class BadmintonPage extends StatefulWidget {
  const BadmintonPage({super.key});

  @override
  State<BadmintonPage> createState() => _BadmintonPageState();
}

class _BadmintonPageState extends State<BadmintonPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Badminton Equipment'),
      ),
      // ignore: avoid_unnecessary_containers
      body: Column(
        children: [
          // ignore: avoid_unnecessary_containers
          Padding(padding: EdgeInsets.only(top: 20)),
          // ignore: avoid_unnecessary_containers
          Container(
            child:
                const Image(image: AssetImage('assets/images/badminton.png')),
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
                    'Total= 4',
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
                    'Issued= ${TbadmintonRacket-badmintonRacket}',
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
                    'Remained= $badmintonRacket',
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
          Padding(padding: EdgeInsets.only(top: 100)),
          Row(
            children: [
              Expanded(
                  child: Align(
                      alignment: Alignment.bottomCenter,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() 
                            { badmintonRacket--;  });
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const IssuedPage()),
                          );
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
                        onPressed: () {
                          setState(() 
                            { badmintonRacket++;  });
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const IssuedPage()),
                          );
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
    );
  }
}
