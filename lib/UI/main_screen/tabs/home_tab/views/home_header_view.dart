import 'package:evently_app/UI/auth/provider/user_auth_provider.dart';
import 'package:evently_app/UI/main_screen/tabs/home_tab/provider/home_tab_provider.dart';
import 'package:evently_app/core/common/widgets/category_slider.dart';
import 'package:evently_app/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeHeaderView extends StatelessWidget {
  const HomeHeaderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            Row(
              textDirection: TextDirection.ltr,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  textDirection: TextDirection.ltr,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //TODO:Localize
                    Text(
                      AppLocalizations.of(context)!.welcomeBack,
                      style: TextStyle(
                        color: Theme.of(context).primaryColorLight,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ), //TODO:UserName
                    Text(
                      context.watch<UserAuthProvider>().userModel?.name ?? '',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: Theme.of(context).primaryColorLight,
                      ),
                    )
                  ],
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    context.read<AppSettingsProvider>().toggleTheme();
                  },
                  child: Icon(Icons.wb_sunny_outlined,
                      color: Theme.of(context).primaryColorLight),
                ),
                const SizedBox(width: 10),
                GestureDetector(
                  onTap: () {
                    context.read<AppSettingsProvider>().changeLaguage();
                  },
                  child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(8),
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                          color: Theme.of(context).primaryColorLight,
                          borderRadius: BorderRadius.circular(8)),
                      child: Text(
                        context.watch<AppSettingsProvider>().language == 'ar'
                            ? 'EN'
                            : 'AR',
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      )),
                )
              ],
            ),
            const SizedBox(height: 8),
            Row(
              textDirection: TextDirection.ltr,
              children: [
                const Icon(
                  Icons.location_on_outlined,
                  color: Colors.white,
                ),
                const SizedBox(width: 4),
                Text(
                  '${context.watch<HomeTabProvider>().city} , ${context.watch<HomeTabProvider>().country}',
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                    color: Theme.of(context).primaryColorLight,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            CategorySlider()
          ],
        ),
      ),
    );
  }
}
