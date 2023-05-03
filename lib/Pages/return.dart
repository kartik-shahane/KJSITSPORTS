// ignore_for_file: sort_child_properties_last
import 'package:flutter/material.dart';

class ReturnPage extends StatefulWidget {
  const ReturnPage({super.key});

  @override
  State<ReturnPage> createState() => _ReturnPageState();
}

class _ReturnPageState extends State<ReturnPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Column(
          children: [
            const Padding(padding: EdgeInsets.only(top: 100)),
            const Image(image: AssetImage('assets/images/return.png')),
            const Padding(padding: EdgeInsets.only(top: 30)),
            const Padding(padding: EdgeInsets.only(bottom: 70)),
            Container(
              width: 350,
              height: 150,
              padding: const EdgeInsets.all(35),
              child: Column(
                children: const [
                  Center(
                    child: Text(
                      'YOUR ITEM HAS BEEN RETURNED !!',
                      style: TextStyle(fontSize: 15, color: Colors.black87),
                    ),
                  ),
                ],
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