import 'package:evently_app/UI/main_screen/models/category_slider_model.dart';
import 'package:flutter/material.dart';

class CategorySlider extends StatefulWidget {
  const CategorySlider({super.key});

  @override
  State<CategorySlider> createState() => _CategorySliderState();
}

class _CategorySliderState extends State<CategorySlider> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemBuilder: (context, index) => ChoiceChip(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          labelPadding: EdgeInsets.zero,
          label: Row(
            children: [
              Icon(
                CategorySliderModel.categories[index].icon,
                color: selectedIndex == index
                    ? Theme.of(context).focusColor
                    : Theme.of(context).primaryColorLight,
              ),
              const SizedBox(width: 8),
              Text(CategorySliderModel.categories[index].title)
            ],
          ),
          showCheckmark: false,
          selected: selectedIndex == index,
          onSelected: (value) {
            selectedIndex = index;
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
        itemCount: CategorySliderModel.categories.length,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
