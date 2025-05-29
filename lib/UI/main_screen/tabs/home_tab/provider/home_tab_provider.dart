import 'package:evently_app/UI/main_screen/models/category_slider_model.dart';
import 'package:flutter/material.dart';

class HomeTabProvider extends ChangeNotifier {
  CategoryValues? selectedCategory;
  changeCategory(CategoryValues cat) {
    if (cat == CategoryValues.all) {
      selectedCategory = null;
      notifyListeners();
      return;
    }
    selectedCategory = cat;
    notifyListeners();
  }
}
