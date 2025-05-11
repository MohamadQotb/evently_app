import 'package:evently_app/core/common/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.lightThemeColor,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: AppColors.blackColor,
          fontSize: 22,
          fontWeight: FontWeight.w400,
        ),
        iconTheme: IconThemeData(
          color: AppColors.blackColor,
          size: 24,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
              color: AppColors.mainColor,
              width: 1,
            )),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: AppColors.mainColor,
            width: 1,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: AppColors.mainColor,
            width: 1,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: AppColors.mainColor,
            width: 1,
          ),
        ),
        hintStyle: TextStyle(
          color: AppColors.mainColor,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        prefixIconColor: AppColors.mainColor,
        suffixIconColor: AppColors.mainColor,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 16,
        ),
      ),
      textTheme: TextTheme(
          titleMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: AppColors.blackColor,
      )),
      colorScheme: ColorScheme.fromSeed(seedColor: AppColors.mainColor),
      useMaterial3: true,
      iconButtonTheme: IconButtonThemeData(
        style: ButtonStyle(
          shape: WidgetStatePropertyAll(CircleBorder(
              side: BorderSide(
            color: AppColors.mainColor,
            width: 1,
          ))),
          iconColor: WidgetStatePropertyAll(AppColors.mainColor),
          backgroundColor: WidgetStatePropertyAll(AppColors.lightThemeColor),
          iconSize: WidgetStatePropertyAll(20),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(AppColors.mainColor),
            shape: WidgetStatePropertyAll(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            )),
            padding: WidgetStatePropertyAll(const EdgeInsets.symmetric(
              vertical: 16,
              horizontal: 24,
            )),
            foregroundColor: WidgetStatePropertyAll(AppColors.lightThemeColor),
            textStyle: WidgetStatePropertyAll(
              const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            minimumSize: WidgetStatePropertyAll(Size(double.infinity, 56))),
      ));
  static ThemeData darkTheme = ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.darkThemeColor,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: AppColors.mainColor,
          fontSize: 22,
          fontWeight: FontWeight.w400,
        ),
        iconTheme: IconThemeData(
          color: AppColors.mainColor,
          size: 24,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
              color: AppColors.mainColor,
              width: 1,
            )),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: AppColors.mainColor,
            width: 1,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: AppColors.mainColor,
            width: 1,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: AppColors.mainColor,
            width: 1,
          ),
        ),
        hintStyle: TextStyle(
          color: AppColors.darkThemeSecColor,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        prefixIconColor: AppColors.mainColor,
        suffixIconColor: AppColors.mainColor,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 16,
        ),
      ),
      textTheme: TextTheme(
          titleMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: AppColors.darkThemeSecColor,
      )),
      iconButtonTheme: IconButtonThemeData(
        style: ButtonStyle(
          shape: WidgetStatePropertyAll(CircleBorder(
              side: BorderSide(
            color: AppColors.mainColor,
            width: 1,
          ))),
          iconColor: WidgetStatePropertyAll(AppColors.mainColor),
          backgroundColor: WidgetStatePropertyAll(AppColors.darkThemeColor),
          iconSize: WidgetStatePropertyAll(20),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(AppColors.mainColor),
            shape: WidgetStatePropertyAll(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            )),
            padding: WidgetStatePropertyAll(const EdgeInsets.symmetric(
              vertical: 16,
              horizontal: 24,
            )),
            foregroundColor: WidgetStatePropertyAll(AppColors.lightThemeColor),
            textStyle: WidgetStatePropertyAll(
              const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            minimumSize: WidgetStatePropertyAll(Size(double.infinity, 56))),
      ));
}
