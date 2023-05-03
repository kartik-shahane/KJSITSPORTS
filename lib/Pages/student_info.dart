// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace, unnecessary_string_interpolations

import 'package:fire_auth/user_credential.dart';
import 'package:flutter/material.dart';
import 'package:fire_auth/UI/auth/login_screen.dart';
import 'package:fire_auth/main.dart';
// class NotesPage extends StatefulWidget {
//   const NotesPage({super.key});

//   @override
//   State<NotesPage> createState() => _NotesPageState();
// }

// class _NotesPageState extends State<NotesPage> {
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Expanded(
//         child: Column(
//           children: [
//             Expanded(
//               child: Row(
//                 children: [
//                   Container(
//                     constraints: const BoxConstraints(
//     minWidth: 2,
//     maxWidth: 300,
//   ),

//                     child:  Text ('$globaladmin'),
//                   ),
//                   Container(constraints: const BoxConstraints(
//     minWidth: 2,
//     maxWidth: 300,
//   ),
//                     child: Text ('$globalsport'),
//                   ),
          
//                   Container(constraints: const BoxConstraints(
//     minWidth: 2,
//     maxWidth: 300,
//   ),
//                   child: cr_issued?  const Text ('Issued'):Container(),
//                   ),
//                 ],
//               ),
//             ),
//           ///////////////////////////////////////////////////////////
//             Expanded(
//               child:(globaladmin==false)? Row(
//                 children: [
//                   Container(constraints: const BoxConstraints(
//     minWidth: 2,
//     maxWidth: 300,
//   ),
//                   child: Text("$globalusername"),
//                   ),
          
//                   Container(constraints: const BoxConstraints(
//     minWidth: 2,
//     maxWidth: 300,
//   ),
//                     child: Text('$globalsport'),
//                   ),
          
//                   Container(constraints: const BoxConstraints(
//     minWidth: 2,
//     maxWidth: 300,
//   ),
//                    child: cr_issued?  const Text ('Issued'):Container(),
//                   ),
//                 ],
//               ):Container(),
//             ),
          
            
          
//           ],
//         ),
//       ),
//     );
//   }
// }




class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  @override
  Widget build(BuildContext context) {
     return globaladmin?
    Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      title:const Text('Issued Equipment')
      ),
      body:
      SingleChildScrollView(
      child: Column(
        children: [
          Row(
          children: [
            const SizedBox(height: 20,
            width: 40,),
            Center(
              child:Container(
              
                
                    height: 200,
                    width:300 ,
                    
                    child: Text('$globalusername',
                    style: const TextStyle(fontSize: 20),),
                    
              ),),
          ],
        ),
        Row(
          children: [
            const SizedBox(width: 65,),
            Container(
                  height: 200,
                  width:90 ,
                  child: Text('$globalsport',
                  style: const TextStyle(fontSize: 20),),
            ),
const SizedBox(width: 80,),
              Container(
                height: 200,
                width:90 ,
                child: issued ? const Text('Issued',style: TextStyle(fontSize: 20),): Container(),
              ),
          ],
        ),




        ]),
    )):const Text('ONLY ACCESSED BY ADMIN ');
  }
}
