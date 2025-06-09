import 'package:evently_app/UI/onBoarding/models/on_boarding_model_class.dart';
import 'package:evently_app/core/common/app_colors.dart';
import 'package:evently_app/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OnBoardingCard extends StatelessWidget {
  final OnBoardingModelClass onBoardingModelClass;
  const OnBoardingCard({super.key, required this.onBoardingModelClass});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          onBoardingModelClass.image,
          width: double.infinity,
          height: MediaQuery.of(context).size.height * .45,
        ),
        Text(
          onBoardingModelClass.title,
          style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: AppColors.mainColor),
        ),
        Text(
          onBoardingModelClass.discribtion,
          style: Theme.of(context).textTheme.titleMedium,
          textAlign: context.watch<AppSettingsProvider>().language == 'ar'
              ? TextAlign.right
              : TextAlign.left,
        ),
      ],
    );
  }
}
