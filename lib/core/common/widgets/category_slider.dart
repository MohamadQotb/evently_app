import 'package:evently_app/UI/main_screen/models/category_slider_model.dart';
import 'package:evently_app/UI/main_screen/tabs/home_tab/provider/home_tab_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CategorySlider extends StatefulWidget {
  const CategorySlider({super.key});

  @override
  State<CategorySlider> createState() => _CategorySliderState();
}

class _CategorySliderState extends State<CategorySlider> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    List<CategorySliderModel> categories = [
      CategorySliderModel(
        category: CategoryValues.all,
        title: AppLocalizations.of(context)!.all,
        icon: Icons.explore_outlined,
      ),
      CategorySliderModel(
        category: CategoryValues.sports,
        title: AppLocalizations.of(context)!.sport,
        icon: Icons.directions_bike_rounded,
      ),
      CategorySliderModel(
        category: CategoryValues.birthday,
        title: AppLocalizations.of(context)!.birthday,
        icon: Icons.cake_outlined,
      ),
      CategorySliderModel(
        category: CategoryValues.meeting,
        title: AppLocalizations.of(context)!.meeting,
        icon: Icons.meeting_room_rounded,
      ),
      CategorySliderModel(
        category: CategoryValues.gaming,
        title: AppLocalizations.of(context)!.gaming,
        icon: Icons.videogame_asset_rounded,
      ),
      CategorySliderModel(
        category: CategoryValues.bookClub,
        title: AppLocalizations.of(context)!.bookClub,
        icon: Icons.menu_book_rounded,
      ),
      CategorySliderModel(
        category: CategoryValues.eating,
        title: AppLocalizations.of(context)!.eating,
        icon: Icons.restaurant_menu_rounded,
      ),
      CategorySliderModel(
        category: CategoryValues.holiday,
        title: AppLocalizations.of(context)!.holiday,
        icon: Icons.beach_access_rounded,
      ),
      CategorySliderModel(
        category: CategoryValues.exhibtion,
        title: AppLocalizations.of(context)!.exhibition,
        icon: Icons.photo_library_outlined,
      ),
      CategorySliderModel(
        category: CategoryValues.workShop,
        title: AppLocalizations.of(context)!.workshop,
        icon: Icons.handyman_rounded,
      ),
    ];
    return SizedBox(
      height: 48,
      child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemBuilder: (context, index) => ChoiceChip(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          labelPadding: EdgeInsets.zero,
          label: Row(
            children: [
              Icon(
                categories[index].icon,
                color: selectedIndex == index
                    ? Theme.of(context).focusColor
                    : Theme.of(context).primaryColorLight,
              ),
              const SizedBox(width: 8),
              Text(categories[index].title)
            ],
          ),
          showCheckmark: false,
          selected: selectedIndex == index,
          onSelected: (value) {
            selectedIndex = index;
            context
                .read<HomeTabProvider>()
                .changeCategory(CategoryValues.values[index]);
            setState(() {});
          },
          backgroundColor: selectedIndex == index
              ? Theme.of(context).primaryColorDark
              : Theme.of(context).primaryColor,
          labelStyle: TextStyle(
            color: selectedIndex == index
                ? Theme.of(context).focusColor
                : Theme.of(context).primaryColorLight,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          selectedColor: Theme.of(context).primaryColorDark,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(46),
              side: BorderSide(
                color: Theme.of(context).primaryColorDark,
              )),
        ),
        itemCount: categories.length,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
