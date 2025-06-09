import 'package:evently_app/core/common/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ForgetPasswordScreen extends StatelessWidget {
  static const String routeName = '/forgetPasswordScreen';
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.forgetPassword),
        leading: InkWell(
          child: const Icon(Icons.arrow_back),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView(
          children: [
            Column(
              children: [
                Image.asset(AppAssets.resetPasswordImage,
                    height: MediaQuery.of(context).size.height * 0.5),
                const SizedBox(
                  height: 24,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      hintText: AppLocalizations.of(context)!.email,
                      prefixIcon: Icon(Icons.email_rounded)),
                ),
                const SizedBox(
                  height: 16,
                ),
                ElevatedButton(
                    onPressed: () {},
                    child: Text(AppLocalizations.of(context)!.resetPassword))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
