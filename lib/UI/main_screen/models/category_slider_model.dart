import 'package:evently_app/core/common/app_assets.dart';
import 'package:flutter/material.dart';

class CategorySliderModel {
  final CategoryValues category;
  final String title;
  final IconData icon;
  CategorySliderModel({
    required this.category,
    required this.title,
    required this.icon,
  });
  static List<CategorySliderModel> get categories => [
        CategorySliderModel(
          category: CategoryValues.all,
          title: 'All',
          icon: Icons.explore_outlined,
        ),
        CategorySliderModel(
          category: CategoryValues.sports,
          title: 'Sports',
          icon: Icons.directions_bike_rounded,
        ),
        CategorySliderModel(
          category: CategoryValues.birthday,
          title: 'Birthday',
          icon: Icons.cake_outlined,
        ),
        CategorySliderModel(
          category: CategoryValues.meeting,
          title: 'Meeting',
          icon: Icons.meeting_room_rounded,
        ),
        CategorySliderModel(
          category: CategoryValues.gaming,
          title: 'Gaming',
          icon: Icons.videogame_asset_rounded,
        ),
        CategorySliderModel(
          category: CategoryValues.bookClub,
          title: 'Book Club',
          icon: Icons.menu_book_rounded,
        ),
        CategorySliderModel(
          category: CategoryValues.eating,
          title: 'Eating',
          icon: Icons.restaurant_menu_rounded,
        ),
        CategorySliderModel(
          category: CategoryValues.holiday,
          title: 'Holiday',
          icon: Icons.beach_access_rounded,
        ),
        CategorySliderModel(
          category: CategoryValues.exhibtion,
          title: 'Exhibition',
          icon: Icons.photo_library_outlined,
        ),
        CategorySliderModel(
          category: CategoryValues.workShop,
          title: 'Work Shop',
          icon: Icons.handyman_rounded,
        ),
      ];
}

enum CategoryValues {
  all,
  sports,
  birthday,
  meeting,
  gaming,
  bookClub,
  eating,
  holiday,
  exhibtion,
  workShop;

  String getImages() {
    switch (name) {
      case 'sports':
        return AppAssets.sportsCategoryImage;
      case 'birthday':
        return AppAssets.birthdayCategoryImage;
      case 'meeting':
        return AppAssets.meetingCategoryImage;
      case 'gaming':
        return AppAssets.gamingCategoryImage;
      case 'bookClub':
        return AppAssets.bookClubCategoryImage;
      case 'eating':
        return AppAssets.eatingCategoryImage;
      case 'holiday':
        return AppAssets.holidayCategoryImage;
      case 'exhibtion':
        return AppAssets.exhibitionCategoryImage;
      case 'workShop':
        return AppAssets.workShopCategoryImage;
      default:
        return '';
    }
  }
}
