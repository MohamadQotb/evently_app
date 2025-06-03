import 'package:evently_app/UI/main_screen/tabs/profile_tab/widgets/drop_down_widget.dart';
import 'package:evently_app/UI/main_screen/tabs/profile_tab/widgets/profile_header_widget.dart';
import 'package:evently_app/UI/personalization_screen.dart';
import 'package:evently_app/core/common/app_colors.dart';
import 'package:evently_app/providers/theme_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  List<DropdownMenuItem<String>> languageMenuItem = [
    DropdownMenuItem(
      child: Text('Arabic'),
      value: 'Arabic',
    ),
    DropdownMenuItem(
      child: Text('English'),
      value: 'English',
    )
  ];
  List<DropdownMenuItem<String>> themeMenuItem = [
    DropdownMenuItem(
      child: Text('Light'),
      value: 'Light',
    ),
    DropdownMenuItem(
      child: Text('Dark'),
      value: 'Dark',
    )
  ];
  String? selectedLanguage = 'Arabic';

  @override
  Widget build(BuildContext context) {
    String? selectedTheme = context.read<ThemeProvider>().themeTitle;
    return Column(
      children: [
        ProfileHeaderWidget(),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Language',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                SizedBox(
                  height: 16,
                ),
                DropDownWidget(
                  selected: selectedLanguage,
                  items: languageMenuItem,
                  onChanged: (p0) {
                    selectedLanguage = p0;
                    setState(() {});
                  },
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  'Theme',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                SizedBox(
                  height: 16,
                ),
                DropDownWidget(
                  selected: selectedTheme,
                  items: themeMenuItem,
                  onChanged: (p0) {
                    if (selectedTheme == p0) {
                      return;
                    }
                    selectedTheme = p0;
                    context.read<ThemeProvider>().toggleTheme();
                    setState(() {});
                  },
                ),
                Spacer(),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xffFF5659)),
                    onPressed: () {
                      FirebaseAuth.instance.signOut();
                      Navigator.of(context).pushReplacementNamed(
                          PersonalizationScreen.routeName);
                      setState(() {});
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.output_rounded,
                          size: 24,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          'Logout',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                              color: Colors.white),
                        )
                      ],
                    )),
                SizedBox(
                  height: 8,
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
