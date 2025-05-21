import 'package:evently_app/core/common/app_assets.dart';
import 'package:flutter/material.dart';

class ForgetPasswordScreen extends StatelessWidget {
  static const String routeName = '/forgetPasswordScreen';
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forget Password'),
        leading: InkWell(
          child: Icon(Icons.arrow_back),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            Image.asset(AppAssets.resetPasswordImage,
                height: MediaQuery.of(context).size.height * 0.5),
            const SizedBox(
              height: 24,
            ),
            TextFormField(
              decoration: InputDecoration(
                  hintText: 'Email',
                  prefixIcon: const Icon(Icons.email_rounded)),
            ),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(onPressed: () {}, child: Text('Reset Password'))
          ],
        ),
      ),
    );
  }
}
