import 'package:evently_app/UI/onBoarding/models/on_boarding_model_class.dart';
import 'package:evently_app/core/common/app_colors.dart';
import 'package:flutter/material.dart';

class OnBoardingCard extends StatelessWidget {
  final OnBoardingModelClass onBoardingModelClass;
  const OnBoardingCard({super.key, required this.onBoardingModelClass});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Image.asset(
          onBoardingModelClass.image,
          width: double.infinity,
          height: MediaQuery.of(context).size.height * .45,
        ),
        Text(
          onBoardingModelClass.title,
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: AppColors.mainColor),
        ),
        Text(
          onBoardingModelClass.discribtion,
          style: Theme.of(context).textTheme.titleMedium,
          textAlign: TextAlign.left,
        ),
      ],
    );
  }
}
