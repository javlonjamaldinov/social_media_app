import 'package:flutter/material.dart';
import 'package:social_media_app/ui/pages/creat_posts_page.dart';

import 'package:social_media_app/ui/pages/home_page.dart';
import 'package:social_media_app/ui/pages/profile_page.dart';
import 'package:social_media_app/ui/pages/users_page.dart';
import 'package:social_media_app/ui/pages/settings_page.dart';
import 'package:social_media_app/ui/pages/notifications_page.dart';

class BottomNavBar extends StatefulWidget {
  final String userId;

  const BottomNavBar({super.key, required this.userId});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [
      HomePage(),
      const NotificationsPage(),
       CreatPostsPage(),
      const SettingsPage(),
      const ProfilePage(),
    ];
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        elevation: 1,
        height: 65,
        color: Theme.of(context).colorScheme.onPrimary,
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                setState(() {
                  currentIndex = 0;
                });
              },
              icon: Icon(
                currentIndex == 0 ? Icons.home : Icons.home_outlined,
                size: 35,
                color: currentIndex == 0 ? Colors.green.shade600 : null,
              ),
            ),
            const SizedBox(width: 5),
            IconButton(
              onPressed: () {
                setState(() {
                  currentIndex = 1;
                });
              },
              icon: Icon(
                currentIndex == 1
                    ? Icons.notifications
                    : Icons.notifications_outlined,
                size: 35,
                color: currentIndex == 1 ? Colors.green.shade600 : null,
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  currentIndex = 2;
                });
              },
              child: SizedBox(
                width: 75,
                height: 75,
                child: Icon(
                  currentIndex == 2 ? Icons.add : Icons.add_outlined,
                  size: 55,
                  color: currentIndex == 2 ? Colors.green.shade600 : null,
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  currentIndex = 3;
                });
              },
              icon: Icon(
                currentIndex == 3 ? Icons.settings : Icons.settings_outlined,
                size: 35,
                color: currentIndex == 3 ? Colors.green.shade600 : null,
              ),
            ),
            const SizedBox(width: 5),
            IconButton(
              onPressed: () {
                setState(() {
                  currentIndex = 4;
                });
              },
              icon: Icon(
                currentIndex == 4 ? Icons.person : Icons.person_outlined,
                size: 35,
                color: currentIndex == 4 ? Colors.green.shade600 : null,
              ),
            ),
          ],
        ),
      ),
      body: screens[currentIndex],
    );
  }
}
