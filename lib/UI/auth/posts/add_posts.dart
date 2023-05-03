// ignore_for_file: unused_local_variable, unused_label, duplicate_ignore, unused_import

import 'package:fire_auth/utils/utils.dart';
import 'package:fire_auth/widgets/round_button.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fire_auth/UI/auth/posts/post_screen.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({Key? key}) : super(key: key);

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  final announcementController = TextEditingController();
  bool loading = false;
  final databaseRef = FirebaseDatabase.instance.ref('Announcement');
  final auth = FirebaseDatabase.instance.ref('Announcement');
  final searchFilter = TextEditingController();
  final editController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Announcement'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            TextFormField(
              maxLines: 5,
              controller: announcementController,
              decoration: const InputDecoration(
                  hintText: 'Add your Announcement',
                  border: OutlineInputBorder()),
            ),
            const SizedBox(
              height: 30,
            ),
            RoundButton(
                title: 'Add',
                loading: loading,
                onTap: () {
                  setState(() {
                    loading = true;
                  });

                  String id = DateTime.now().millisecondsSinceEpoch.toString();
                  databaseRef.child(id).set({
                    'title': announcementController.text.toString(),
                    'id': id
                  }).then((value) {
                    Utils().toastMessage('Announcement added');
                    setState(() {
                      loading = false;
                    });
                  }).onError((error, stackTrace) {
                    Utils().toastMessage(error.toString());
                    setState(() {
                      // ignore: unused_label
                      loading = false;
                    });
                  });
                })
          ],
        ),
      ),
    );
  }
}
