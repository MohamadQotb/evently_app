import 'package:evently_app/core/common/app_assets.dart';
import 'package:evently_app/core/common/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

class RegesterScreen extends StatefulWidget {
  static const String routeName = '/regesterScreen';
  const RegesterScreen({super.key});

  @override
  State<RegesterScreen> createState() => _RegesterScreenState();
}

class _RegesterScreenState extends State<RegesterScreen> {
  bool obscureText = true;
  bool rePasswordObscureText = true;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
        leading: InkWell(
          child: Icon(Icons.arrow_back),
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
                Image.asset(
                  AppAssets.appLogo,
                  height: size.height * 0.23,
                ),
                const SizedBox(
                  height: 24,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      hintText: 'Name',
                      prefixIcon: const Icon(Icons.person_rounded)),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      hintText: 'Email',
                      prefixIcon: const Icon(Icons.email_rounded)),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  obscureText: obscureText,
                  decoration: InputDecoration(
                      hintText: 'Password',
                      prefixIcon: const Icon(Icons.lock_rounded),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          obscureText = !obscureText;
                          setState(() {});
                        },
                        child: obscureText
                            ? Icon(Icons.visibility_off_rounded)
                            : Icon(Icons.visibility_rounded),
                      )),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  obscureText: rePasswordObscureText,
                  decoration: InputDecoration(
                      hintText: 'Re Password',
                      prefixIcon: const Icon(Icons.lock_rounded),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          rePasswordObscureText = !rePasswordObscureText;
                          setState(() {});
                        },
                        child: rePasswordObscureText
                            ? Icon(Icons.visibility_off_rounded)
                            : Icon(Icons.visibility_rounded),
                      )),
                ),
                const SizedBox(
                  height: 16,
                ),
                ElevatedButton(
                    onPressed: () {}, child: const Text('Create Account')),
                const SizedBox(
                  height: 24,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already Have Account ?',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          'Login',
                        )),
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
                ToggleSwitch(
                  activeBgColor: [AppColors.mainColor],
                  borderColor: [AppColors.mainColor],
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
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
