import 'package:flutter/material.dart';
import 'package:fire_auth/Pages/selectsport.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: <Widget>[
        const Padding(padding: EdgeInsets.all(20)),
        const Text(
          'Welcome KJSITians !!! ',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
        ),
        const Padding(padding: EdgeInsets.all(20)),
        Center(
          child: ElevatedButton(
            onPressed: () => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const SelectSport())),
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
            child: const Text('Select Sport'),
          ),
        ),
        const Padding(padding: EdgeInsets.only(top: 150)),
        const Image(image: AssetImage('assets/images/sports.png'))
      ]),
    );
  }
}
