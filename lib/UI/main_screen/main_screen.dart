import 'package:evently_app/UI/auth/provider/user_auth_provider.dart';
import 'package:evently_app/UI/events/create_event_screen.dart';
import 'package:evently_app/UI/main_screen/tabs/home_tab/home_tab.dart';
import 'package:evently_app/UI/main_screen/tabs/love_tab/love_tab.dart';
import 'package:evently_app/UI/main_screen/tabs/map_tab/map_tab.dart';
import 'package:evently_app/UI/main_screen/tabs/profile_tab/profile_tab.dart';
import 'package:evently_app/core/common/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  static const String routeName = '/mainScreen';
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  List<Widget> tabs = [
    const HomeTab(),
    const MapTab(),
    const LoveTab(),
    const ProfileTab(),
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (context.read<UserAuthProvider>().userModel == null) {
      context.read<UserAuthProvider>().getUser();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.add,
        ),
        onPressed: () {
          Navigator.pushNamed(context, CreateEventScreen.routeName);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: tabs[_currentIndex],
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
          const BottomNavigationBarItem(
            icon: Icon(Icons.location_on_outlined),
            activeIcon: Icon(Icons.location_on),
            label: 'Map',
          ),
          const BottomNavigationBarItem(
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
