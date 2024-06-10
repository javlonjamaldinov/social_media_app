import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:social_media_app/components/my_back_buttom.dart';
import 'package:social_media_app/ui/details/product.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({
    super.key,
  });

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final User? currentUser = FirebaseAuth.instance.currentUser;
  File? _image;

  Future<DocumentSnapshot<Map<String, dynamic>>> getUserDetails() async {
    return await FirebaseFirestore.instance
        .collection("Users")
        .doc(currentUser!.email)
        .get();
  }

  Future<void> _pickImage() async {
    try {
      final pickedFile =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        setState(() {
          _image = File(pickedFile.path);
        });
        await _uploadImage();
      } else {
        print('No image selected.');
      }
    } catch (e) {
      print('Error picking image: $e');
    }
  }

  Future<void> _uploadImage() async {
    try {
      if (_image == null) return;

      final storageRef = FirebaseStorage.instance
          .ref()
          .child('user_images')
          .child('${currentUser!.uid}.jpg');

      // Загружаем изображение в Firebase Storage
      await storageRef.putFile(_image!);

      // Получаем URL загруженного изображения
      final imageUrl = await storageRef.getDownloadURL();

      // Обновляем ссылку на изображение в документе пользователя в Firestore
      await FirebaseFirestore.instance
          .collection("Users")
          .doc(currentUser!.email)
          .update({'profileImage': imageUrl});
    } catch (e) {
      print("Error uploading image: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
        future: getUserDetails(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Text(
              "Error: ${snapshot.error}",
            );
          } else if (snapshot.hasData) {
            Map<String, dynamic>? user = snapshot.data!.data();
            return Center(
              child: Column(
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
                  const SizedBox(height: 20),
                  Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                          borderRadius: BorderRadius.circular(35),
                        ),
                        padding: const EdgeInsets.all(5),
                        child: _image == null
                            ? (user!['profileImage'] != null
                                ? CircleAvatar(
                                    backgroundImage:
                                        NetworkImage(user['profileImage']),
                                    radius: 64,
                                  )
                                : const Icon(
                                    Icons.person,
                                    size: 64,
                                  ))
                            : CircleAvatar(
                                backgroundImage: FileImage(_image!),
                                radius: 64,
                              ),
                      ),
                      Positioned(
                        bottom: -12,
                        right: -80,
                        // top: 10,
                        left: 0,
                        child: IconButton(
                          onPressed: _pickImage,
                          icon: Icon(
                            Icons.add_a_photo,
                            size: 20,
                            color: Theme.of(context).colorScheme.inversePrimary,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text(
                    user!['username'],
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    user['email'],
                    style: TextStyle(
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Product(),
                ],
              ),
            );
          } else {
            return const Text("No data");
          }
        },
      ),
    );
  }
}
