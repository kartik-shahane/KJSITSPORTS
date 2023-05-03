// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';

class IssuedPage extends StatefulWidget {
  const IssuedPage({super.key});

  @override
  State<IssuedPage> createState() => _IssuedPageState();
}

class _IssuedPageState extends State<IssuedPage> {
  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return Container(
      color: Colors.white,
      child: Center(
        child: Column(
          children: [
            const Padding(padding: EdgeInsets.only(top: 40)),
            const Image(image: AssetImage('assets/images/issue.jpg')),
            const Padding(padding: EdgeInsets.only(top: 30)),
            Container(
              width: 350,
              height: 250,
              padding: const EdgeInsets.all(35),
              child: const Center(
                child: Text(
                             'ISSUED !!  '
                    
                   ' you can now take the eqipment.',
              
                  style: TextStyle(fontSize: 15, color: Colors.black87),
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.green[100],
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
