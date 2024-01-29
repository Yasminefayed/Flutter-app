import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class trial extends StatelessWidget {

  CollectionReference users = FirebaseFirestore.instance.collection('users');
  late String textNote;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            TextField(
              onChanged: (value){
                textNote=value;
              },
              decoration: InputDecoration(hintText: 'Enter a note'),
            ),
            ElevatedButton(
                onPressed: () async {
                  await users.add({
                    'name': 'zerth',
                    'age': 7,
                    'notes': textNote
                  }).then((value) => print('useradded'));
                },
                child: Text('submit data'))
          ],
        ));
  }
}
