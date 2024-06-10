import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:social_media_app/components/my_back_buttom.dart';
import 'package:social_media_app/components/my_list_tile.dart';
import 'package:social_media_app/helper/helper_functions.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("Users").snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            displayMessageToUser("Something went wrong", context);
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.data == null) {
            return const Text("No Data");
          }
          final users = snapshot.data!.docs;
          return Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(
                  top: 50,
                  left: 25,
                ),
                child: Row(
                  children: [
                    MyBackButtom(),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: users.length,
                    padding: EdgeInsets.all(0),
                    itemBuilder: (context, index) {
                      final user = users[index];
                      String username = user['username'];
                      String email = user['email'];
                      return MyListTile(
                        title: username,
                        subtitle: email,
                      );
                    }),
              ),
            ],
          );
        },
      ),
    );
  }
}
