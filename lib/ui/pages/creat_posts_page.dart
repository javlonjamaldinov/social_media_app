import 'package:flutter/material.dart';
import 'package:social_media_app/components/my_post_buttom.dart';
import 'package:social_media_app/components/my_textfielde.dart';
import 'package:social_media_app/firebase/database/firestore.dart';

class CreatPostsPage extends StatelessWidget {

   CreatPostsPage({super.key});
     final FirestoreDatabase database = FirestoreDatabase();
  final TextEditingController newPostController = TextEditingController();
  void postMessage() {
  if (newPostController.text.isNotEmpty) {
    String message = newPostController.text;
    database.addPost(message); // Fixing the argument passed to addPost method
    newPostController.clear();
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Posts"),
      
      ),
      body: Padding(
            padding: const EdgeInsets.all(25),
            child: Row(
              children: [
                Expanded(
                  child: MyTextfielde(
                    hintText: "Say something...",
                    obscureText: false,
                    controller: newPostController,
                  ),
                ),
                MyPostButtom(
                  onTap: postMessage,
                ),
              ],
            ),
          ),
    );
  }
}
