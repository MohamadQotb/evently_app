import 'package:evently_app/core/common/app_assets.dart';
import 'package:evently_app/core/common/app_colors.dart';
import 'package:flutter/material.dart';

class EventCardWidget extends StatelessWidget {
  const EventCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      padding: const EdgeInsets.all(8),
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.25,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                AppAssets.sportsCategoryImage,
              ),
              fit: BoxFit.fill),
          borderRadius: BorderRadius.circular(16)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            child: Text(
              textAlign: TextAlign.center,
              '21\nNov',
              style: TextStyle(
                  height: 0,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: AppColors.mainColor),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'This is a Birthday Party',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Icon(
                  Icons.favorite_border,
                  color: AppColors.mainColor,
                  size: 24,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
