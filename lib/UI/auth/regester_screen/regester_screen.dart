import 'package:evently_app/UI/auth/provider/user_auth_provider.dart';
import 'package:evently_app/UI/main_screen/main_screen.dart';
import 'package:evently_app/core/common/app_assets.dart';
import 'package:evently_app/core/common/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:provider/provider.dart';

class RegesterScreen extends StatefulWidget {
  static const String routeName = '/regesterScreen';
  const RegesterScreen({super.key});

  @override
  State<RegesterScreen> createState() => _RegesterScreenState();
}

class _RegesterScreenState extends State<RegesterScreen> {
  bool loading = false;
  bool obscureText = true;
  bool rePasswordObscureText = true;
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();
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
      appBar: AppBar(
        title: const Text('Register'),
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
                    controller: userNameController,
                    validator: (value) =>
                        value!.isNotEmpty ? null : 'please enter name',
                    decoration: const InputDecoration(
                        hintText: 'Name',
                        prefixIcon: Icon(Icons.person_rounded)),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    controller: emailController,
                    validator: (email) {
                      if (isValidEmail(email)) {
                        return null;
                      } else {
                        return 'Invalid Email';
                      }
                    },
                    decoration: const InputDecoration(
                        hintText: 'Email',
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
                        return 'Please enter password more than 8 letters';
                      } else {
                        if (!regExSpecialChar.hasMatch(password)) {
                          return 'Password should contain special caracters';
                        } else if (!regExUperCase.hasMatch(password)) {
                          return 'Password should contain UperCase Letter';
                        } else if (!regExLowerCase.hasMatch(password)) {
                          return 'Password should contain LowerCase Letter';
                        } else if (!regExNum.hasMatch(password)) {
                          return 'Password should contain Numbers';
                        } else {
                          return null;
                        }
                      }
                    },
                    decoration: InputDecoration(
                        hintText: 'Password',
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
                  TextFormField(
                    controller: rePasswordController,
                    validator: (rePassword) {
                      if (rePasswordController.text ==
                          passwordController.text) {
                        return null;
                      }
                      return 'Enter the same Password';
                    },
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
                              ? const Icon(Icons.visibility_off_rounded)
                              : const Icon(Icons.visibility_rounded),
                        )),
                  ),
                  const SizedBox(
                    height: 16,
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
                                  .userSignUp(
                                      email: emailController.text.trim(),
                                      name: userNameController.text.trim(),
                                      password: passwordController.text.trim())
                                  .then(
                                (value) {
                                  if (value == null) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            backgroundColor: Colors.green,
                                            content: Text(
                                                'User Signed Up Successfully!')));
                                    Navigator.pushReplacementNamed(
                                        context, MainScreen.routeName);
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            backgroundColor: Colors.red,
                                            content: Text(value)));
                                  }
                                },
                              );
                            }
                          },
                          child: const Text('Create Account')),
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
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
