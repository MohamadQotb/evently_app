import 'package:evently_app/UI/events/create_event_screen.dart';
import 'package:evently_app/UI/main_screen/tabs/home_tab/home_tab.dart';
import 'package:evently_app/UI/main_screen/tabs/love_tab/love_tab.dart';
import 'package:evently_app/UI/main_screen/tabs/map_tab/map_tab.dart';
import 'package:evently_app/UI/main_screen/tabs/profile_tab/profile_tab.dart';
import 'package:evently_app/core/common/app_assets.dart';
import 'package:evently_app/core/common/app_colors.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  static const String routeName = '/mainScreen';
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
        ),
        onPressed: () {
          Navigator.pushNamed(context, CreateEventScreen.routeName);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: IndexedStack(
        index: _currentIndex, // Change this index to switch between tabs
        children: const [
          HomeTab(),
          MapTab(),
          LoveTab(),
          ProfileTab(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          //TODO:Localize the labels
          BottomNavigationBarItem(
            icon: Image.asset(
              AppAssets.outlinedHomeIcon,
              height: 24,
            ),
            activeIcon: Image.asset(
              AppAssets.filledHomeIcon,
              height: 24,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on_outlined),
            activeIcon: Icon(Icons.location_on),
            label: 'Map',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline_rounded),
            activeIcon: Icon(Icons.favorite),
            label: 'Love',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              AppAssets.outlinedProfileIcon,
              height: 24,
            ),
            activeIcon: Image.asset(
              AppAssets.filledProfileIcon,
              height: 24,
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
