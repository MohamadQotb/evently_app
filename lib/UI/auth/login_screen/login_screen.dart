import 'package:evently_app/UI/auth/forget_password_screen.dart';
import 'package:evently_app/UI/auth/provider/user_auth_provider.dart';
import 'package:evently_app/UI/auth/regester_screen/regester_screen.dart';
import 'package:evently_app/UI/main_screen/main_screen.dart';
import 'package:evently_app/core/common/app_assets.dart';
import 'package:evently_app/core/common/app_colors.dart';
import 'package:evently_app/providers/theme_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/loginScreen';

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool loading = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool obscureText = true;
  bool isValidEmail(email) {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(email);
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24),
          child: ListView(
            children: [
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Image.asset(
                      AppAssets.appLogo,
                      height: size.height * 0.23,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    TextFormField(
                      controller: emailController,
                      validator: (email) {
                        if (isValidEmail(email)) {
                          return null;
                        } else {
                          return AppLocalizations.of(context)!.invalidEmail;
                        }
                      },
                      decoration: InputDecoration(
                          hintText: AppLocalizations.of(context)!.email,
                          prefixIcon: Icon(Icons.email_rounded)),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      obscureText: obscureText,
                      controller: passwordController,
                      validator: (password) {
                        RegExp regExUperCase = RegExp(r'^(?=.*?[A-Z])');
                        RegExp regExLowerCase = RegExp(r'^(?=.*?[a-z])');
                        RegExp regExNum = RegExp(r'^(?=.*?[0-9])');
                        RegExp regExSpecialChar = RegExp(r'^(?=.*?[!@#\$&*~])');

                        if (password!.length < 8) {
                          return AppLocalizations.of(context)!.passwordTooShort;
                        } else {
                          if (!regExSpecialChar.hasMatch(password)) {
                            return AppLocalizations.of(context)!
                                .passwordSpecialChar;
                          } else if (!regExUperCase.hasMatch(password)) {
                            return AppLocalizations.of(context)!
                                .passwordUppercase;
                          } else if (!regExLowerCase.hasMatch(password)) {
                            return AppLocalizations.of(context)!
                                .passwordLowercase;
                          } else if (!regExNum.hasMatch(password)) {
                            return AppLocalizations.of(context)!.passwordNumber;
                          } else {
                            return null;
                          }
                        }
                      },
                      decoration: InputDecoration(
                          hintText: AppLocalizations.of(context)!.password,
                          prefixIcon: const Icon(Icons.lock_rounded),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              obscureText = !obscureText;
                              setState(() {});
                            },
                            child: obscureText
                                ? const Icon(Icons.visibility_off_rounded)
                                : const Icon(Icons.visibility_rounded),
                          )),
                    ),
                    const SizedBox(
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
                            child: Text(
                                AppLocalizations.of(context)!.forgetPassword)),
                      ],
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    context.watch<UserAuthProvider>().loading
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                context
                                    .read<UserAuthProvider>()
                                    .userLogin(
                                        email: emailController.text.trim(),
                                        password:
                                            passwordController.text.trim())
                                    .then(
                                  (value) {
                                    if (value == null) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                              backgroundColor: Colors.green,
                                              content: Text(
                                                  AppLocalizations.of(context)!
                                                      .loginSuccess)));
                                      Navigator.pushReplacementNamed(
                                          context, MainScreen.routeName);
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                              backgroundColor: Colors.red,
                                              content: Text(value)));
                                    }
                                  },
                                );
                              }
                            },
                            child: Text(AppLocalizations.of(context)!.login)),
                    const SizedBox(
                      height: 24,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.noAccount,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, RegesterScreen.routeName);
                            },
                            child: Text(
                              AppLocalizations.of(context)!.createAccount,
                            )),
                      ],
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Divider(
                            indent: 42,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          child: Text(
                            AppLocalizations.of(context)!.or,
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
                    const SizedBox(
                      height: 24,
                    ),
                    OutlinedButton(
                        style: const ButtonStyle(
                            side: WidgetStatePropertyAll(
                                BorderSide(color: AppColors.mainColor))),
                        onPressed: () async {
                          await context.read<UserAuthProvider>().googleSignIn();
                          if (FirebaseAuth.instance.currentUser != null) {
                            Navigator.pushReplacementNamed(
                                // ignore: use_build_context_synchronously
                                context,
                                MainScreen.routeName);
                          }
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              AppAssets.googleIcon,
                              height: 24,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(AppLocalizations.of(context)!.loginWithGoogle),
                          ],
                        )),
                    const SizedBox(
                      height: 24,
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
