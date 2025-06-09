import 'package:evently_app/UI/auth/login_screen/login_screen.dart';
import 'package:evently_app/UI/main_screen/tabs/profile_tab/widgets/drop_down_widget.dart';
import 'package:evently_app/UI/main_screen/tabs/profile_tab/widgets/profile_header_widget.dart';
import 'package:evently_app/providers/theme_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem<String>> languageMenuItem = [
      DropdownMenuItem(
        child: Text(AppLocalizations.of(context)!.arabic),
        value: 'ar',
      ),
      DropdownMenuItem(
        child: Text(AppLocalizations.of(context)!.english),
        value: 'en',
      )
    ];
    List<DropdownMenuItem<String>> themeMenuItem = [
      DropdownMenuItem(
        child: Text(AppLocalizations.of(context)!.light),
        value: 'Light',
      ),
      DropdownMenuItem(
        child: Text(AppLocalizations.of(context)!.dark),
        value: 'Dark',
      )
    ];
    String? selectedLanguage =
        context.read<AppSettingsProvider>().language == 'en' ? 'en' : 'ar';
    String? selectedTheme = context.read<AppSettingsProvider>().themeTitle;
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
                  AppLocalizations.of(context)!.language,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                SizedBox(
                  height: 16,
                ),
                DropDownWidget(
                  selected: selectedLanguage,
                  items: languageMenuItem,
                  onChanged: (p0) {
                    if (selectedLanguage == p0) {
                      return;
                    }
                    selectedLanguage = p0;
                    context.read<AppSettingsProvider>().changeLaguage();
                    setState(() {});
                  },
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  AppLocalizations.of(context)!.theme,
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
                    context.read<AppSettingsProvider>().toggleTheme();
                    setState(() {});
                  },
                ),
                Spacer(),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xffFF5659)),
                    onPressed: () {
                      FirebaseAuth.instance.signOut();
                      GoogleSignIn().signOut();
                      Navigator.of(context)
                          .pushReplacementNamed(LoginScreen.routeName);
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
                          AppLocalizations.of(context)!.logout,
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
