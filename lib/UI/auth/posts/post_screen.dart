// // ignore_for_file: unused_import, avoid_web_libraries_in_flutter, avoid_unnecessary_containers

// import 'package:fire_auth/UI/auth/login_screen.dart';
// import 'package:fire_auth/UI/auth/posts/add_posts.dart';
// import 'package:fire_auth/front/table_calendar.dart';
// import 'package:fire_auth/utils/utils.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:firebase_database/UI/firebase_animated_list.dart';
// import 'package:flutter/material.dart';
// import 'package:fire_auth/user_credential.dart';

// class PostScreen extends StatefulWidget {
//   const PostScreen({Key? key}) : super(key: key);

//   @override
//   // ignore: library_private_types_in_public_api
//   _PostScreenState createState() => _PostScreenState();
// }

// class _PostScreenState extends State<PostScreen> {
//   final auth = FirebaseAuth.instance;
//   final ref = FirebaseDatabase.instance.ref('Announcement');
//   final searchFilter = TextEditingController();
//   final editController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         centerTitle: true,
//         title: const Text('Announcement'),
       
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             const SizedBox(
//               height: 10,
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 10),
//               child: TextFormField(
//                 controller: searchFilter,
//                 decoration: const InputDecoration(
//                     hintText: 'Search', border: OutlineInputBorder()),
//                 onChanged: (String value) {
//                   setState(() {});
//                 },
//               ),
//             ),
//             Expanded(
//               child: FirebaseAnimatedList(
//                   query: ref,
//                   defaultChild: const Text('Loading'),
//                   itemBuilder: (context, snapshot, animationn, index) {
//                     final title = snapshot.child('title').value.toString();
        
//                     if (searchFilter.text.isEmpty) {
//                       return Expanded(
//                         child: ListTile(
//                           title: Text(snapshot.child('title').value.toString()),
//                           subtitle: Text(snapshot.child('id').value.toString()),
//                           trailing: PopupMenuButton(
//                             icon: const Icon(Icons.more_vert),
//                             itemBuilder: (context) => [
//                               PopupMenuItem(
//                                 value: 1,
//                                 child: ListTile(
//                                   onTap: () {
//                                     Navigator.pop(context);
//                                     showMyDailog(title,
//                                         snapshot.child('id').value.toString());
//                                   },
//                                   leading: const Icon(Icons.edit),
//                                   title: const Text('Edit'),
//                                 ),
//                               ),
//                               PopupMenuItem(
//                                   value: 1,
//                                   child: Expanded(
//                                     child: ListTile(
//                                       onTap: () {
//                                         Navigator.pop(context);
//                                         ref
//                                             .child(
//                                                 snapshot.child('id').value.toString())
//                                             .remove();
//                                       },
//                                       leading: const Icon(Icons.delete_outline),
//                                       title: const Text('Delete'),
//                                     ),
//                                   )),
//                             ],
//                           ),
//                         ),
//                       );
//                     } else if (title
//                         .toLowerCase()
//                         .contains(searchFilter.text.toLowerCase())) {
//                       return Expanded(
//                         child: ListTile(
//                           title: Text(snapshot.child('title').value.toString()),
//                           subtitle: Text(snapshot.child('id').value.toString()),
//                         ),
//                       );
//                     } else {
//                       return Container();
//                     }
//                   }),
//             ),
//           ],
//         ),
//       ),
//       //if(globaladmin){}
     
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           if(globaladmin){
//           Navigator.push(context,
//               MaterialPageRoute(builder: (context) => const AddPostScreen()));
//         }
//         },
//         child: const Icon(Icons.add),
//       ),
//     );
//   }

//   Future<void> showMyDailog(String title, String id) async {
//     editController.text = title;
//     return showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             title: const Text('Update'),
//             content: Container(
//               child: TextField(
//                 controller: editController,
//                 decoration: const InputDecoration(hintText: 'Edit'),
//               ),
//             ),
//             actions: [
//               TextButton(
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                   child: const Text('Cancel')),
//               TextButton(
//                   onPressed: () {
//                     Navigator.pop(context);
//                     ref.child(id).update({
//                       'title': editController.text.toLowerCase()
//                     }).then((value) {
//                       Utils().toastMessage('Post Update');
//                     }).onError((error, stackTrace) {
//                       Utils().toastMessage(error.toString());
//                     });
//                   },
//                   child: const Text('Update')),
//             ],
//           );
//         });
//   }
// }
// ignore_for_file: unused_import, avoid_web_libraries_in_flutter

import 'package:fire_auth/UI/auth/login_screen.dart';
import 'package:fire_auth/UI/auth/posts/add_posts.dart';
import 'package:fire_auth/front/table_calendar.dart';
import 'package:fire_auth/user_credential.dart';
import 'package:fire_auth/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/UI/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  final auth = FirebaseAuth.instance;
  final ref = FirebaseDatabase.instance.ref('Announcement');
  final searchFilter = TextEditingController();
  final editController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text('Announcement'),
        actions: const [
          // IconButton(
          //   onPressed: () {
          //     auth.signOut().then((value) {
          //       Navigator.push(
          //           context,
          //           // ignore: prefer_const_constructors
          //           MaterialPageRoute(builder: (context) => CalendarScreen()));
          //     }).onError((error, stackTrace) {
          //       Utils().toastMessage(error.toString());
          //     });
          //   },
          //   icon: const Icon(Icons.calendar_month_outlined),
          // ),
          SizedBox(
            width: 10,
          )
        ],
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TextFormField(
              controller: searchFilter,
              decoration: const InputDecoration(
                  hintText: 'Search', border: OutlineInputBorder()),
              onChanged: (String value) {
                setState(() {});
              },
            ),
          ),
          Expanded(
            child: FirebaseAnimatedList(
                query: ref,
                defaultChild: const Text('Loading'),
                itemBuilder: (context, snapshot, animationn, index) {
                  final title = snapshot.child('title').value.toString();

                  if (searchFilter.text.isEmpty) {
                    return ListTile(
                      title: Text(snapshot.child('title').value.toString()),
                      subtitle: Text(snapshot.child('id').value.toString()),
                      trailing: PopupMenuButton(
                        icon: const Icon(Icons.more_vert),
                        itemBuilder: (context) => [
                          PopupMenuItem(
                            value: 1,
                            child: ListTile(
                              onTap: () {
                                Navigator.pop(context);
                                showMyDailog(title,
                                    snapshot.child('id').value.toString());
                              },
                              leading: const Icon(Icons.edit),
                              title: const Text('Edit'),
                            ),
                          ),
                          PopupMenuItem(
                              value: 1,
                              child: ListTile(
                                onTap: () {
                                  Navigator.pop(context);
                                  ref
                                      .child(
                                          snapshot.child('id').value.toString())
                                      .remove();
                                },
                                leading: const Icon(Icons.delete_outline),
                                title: const Text('Delete'),
                              )),
                        ],
                      ),
                    );
                  } else if (title
                      .toLowerCase()
                      .contains(searchFilter.text.toLowerCase())) {
                    return ListTile(
                      title: Text(snapshot.child('title').value.toString()),
                      subtitle: Text(snapshot.child('id').value.toString()),
                    );
                  } else {
                    return Container();
                  }
                }),
          ),
        ],
      ),
      floatingActionButton:globaladmin ? FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddPostScreen()));
        },
        child: const Icon(Icons.add),
      ):Container()
    );
  }

  Future<void> showMyDailog(String title, String id) async {
    
    editController.text = title;
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Update'),
            content: Container(
              child: TextField(
                controller: editController,
                decoration: const InputDecoration(hintText: 'Edit'),
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Cancel')),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    ref.child(id).update({
                      'title': editController.text.toLowerCase()
                    }).then((value) {
                      Utils().toastMessage('Post Update');
                    }).onError((error, stackTrace) {
                      Utils().toastMessage(error.toString());
                    });
                  },
                  child: const Text('Update')),
            ],
          );
        });
  }
}
