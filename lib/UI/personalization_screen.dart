import 'package:evently_app/UI/onBoarding/on_boarding_screen.dart';
import 'package:evently_app/core/common/app_assets.dart';
import 'package:evently_app/core/common/app_colors.dart';
import 'package:evently_app/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PersonalizationScreen extends StatelessWidget {
  static const String routeName = '/personalization';
  const PersonalizationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                AppAssets.appBarLogo,
                height: 50,
              ),
              Image.asset(
                AppAssets.pirsonalizationImage,
                width: double.infinity,
                height: height * .45,
              ),
              Row(
                children: [
                  Text(
                    AppLocalizations.of(context)!.personalizeYourExperience,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: AppColors.mainColor),
                  ),
                ],
              ),
              Text(
                AppLocalizations.of(context)!.personalizeDescription,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppLocalizations.of(context)!.language,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: AppColors.mainColor),
                  ),
                  ToggleSwitch(
                    onToggle: (index) {
                      context.read<AppSettingsProvider>().changeLaguage();
                    },
                    initialLabelIndex:
                        context.watch<AppSettingsProvider>().language == 'en'
                            ? 0
                            : 1,
                    activeBgColor: const [AppColors.mainColor],
                    borderColor: const [AppColors.mainColor],
                    borderWidth: 2,
                    cornerRadius: 30,
                    customWidgets: [
                      Image.asset(
                        AppAssets.lrIcon,
                        height: 20,
                      ),
                      Image.asset(
                        AppAssets.egIcon,
                        height: 20,
                      ),
                    ],
                    minHeight: 30,
                    minWidth: 69,
                    radiusStyle: true,
                    inactiveBgColor: Colors.transparent,
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppLocalizations.of(context)!.theme,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: AppColors.mainColor),
                  ),
                  ToggleSwitch(
                    onToggle: (index) {
                      context.read<AppSettingsProvider>().toggleTheme();
                    },
                    initialLabelIndex:
                        context.watch<AppSettingsProvider>().themeMode ==
                                ThemeMode.light
                            ? 0
                            : 1,
                    activeBgColor: const [AppColors.mainColor],
                    borderColor: const [AppColors.mainColor],
                    borderWidth: 2,
                    cornerRadius: 30,
                    icons: const [
                      Icons.light_mode_outlined,
                      Icons.dark_mode,
                    ],
                    inactiveFgColor: AppColors.mainColor,
                    activeFgColor: Theme.of(context).scaffoldBackgroundColor,
                    iconSize: 20,
                    minHeight: 30,
                    minWidth: 70,
                    radiusStyle: true,
                    inactiveBgColor: Colors.transparent,
                  )
                ],
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                        context, OnBoardingScreen.routeName);
                  },
                  child: Text(AppLocalizations.of(context)!.letsStart)),
            ],
          ),
        ),
      ),
    );
  }
}
