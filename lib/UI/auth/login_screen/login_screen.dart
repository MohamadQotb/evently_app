import 'package:evently_app/UI/auth/forget_password_screen.dart';
import 'package:evently_app/UI/auth/regester_screen/regester_screen.dart';
import 'package:evently_app/core/common/app_assets.dart';
import 'package:evently_app/core/common/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/loginScreen';

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24),
          child: ListView(
            children: [
              Column(
                children: [
                  Image.asset(
                    AppAssets.appLogo,
                    height: size.height * 0.23,
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: 'Email',
                        prefixIcon: const Icon(Icons.email_rounded)),
                  ),
                  SizedBox(
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
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                          onPressed: () {
                            Navigator.pushNamed(
                                context, ForgetPasswordScreen.routeName);
                          },
                          child: const Text('Forgot Password?')),
                    ],
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  ElevatedButton(onPressed: () {}, child: Text('Login')),
                  SizedBox(
                    height: 24,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an account?',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.pushNamed(
                                context, RegesterScreen.routeName);
                          },
                          child: const Text(
                            'Create Account',
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          indent: 42,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          'Or',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: AppColors.mainColor),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          endIndent: 42,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  OutlinedButton(
                      style: ButtonStyle(
                          side: WidgetStatePropertyAll(
                              BorderSide(color: AppColors.mainColor))),
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            AppAssets.googleIcon,
                            height: 24,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text('Login with Google'),
                        ],
                      )),
                  SizedBox(
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
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
