import 'package:evently_app/UI/auth/provider/user_auth_provider.dart';
import 'package:evently_app/core/common/widgets/category_slider.dart';
import 'package:evently_app/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //TODO:Localize
                    Text(
                      'Welcome Back ✨',
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
                    context.read<ThemeProvider>().toggleTheme();
                  },
                  child: Icon(Icons.wb_sunny_outlined,
                      color: Theme.of(context).primaryColorLight),
                ),
                const SizedBox(width: 10),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(8),
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                          color: Theme.of(context).primaryColorLight,
                          borderRadius: BorderRadius.circular(8)),
                      child: Text(
                        'EN',
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
              children: [
                const Icon(
                  Icons.location_on_outlined,
                  color: Colors.white,
                ),
                const SizedBox(width: 4),
                Text(
                  'Cairo, Egypt',
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
