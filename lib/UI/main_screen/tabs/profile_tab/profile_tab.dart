import 'package:evently_app/UI/auth/provider/user_auth_provider.dart';
import 'package:evently_app/UI/main_screen/tabs/profile_tab/widgets/profile_header_widget.dart';
import 'package:evently_app/core/common/app_assets.dart';
import 'package:evently_app/core/common/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        ProfileHeaderWidget(),
      ],
    );
  }
}
