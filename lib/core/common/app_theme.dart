import 'package:evently_app/core/common/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        shape: CircleBorder(
          side: BorderSide(
            width: 5,
            color: AppColors.lightThemeColor,
          ),
        ),
        backgroundColor: AppColors.mainColor,
        foregroundColor: AppColors.lightThemeColor,
        elevation: 2,
        iconSize: 30,
      ),
      focusColor: AppColors.mainColor,
      primaryColor: AppColors.mainColor,
      primaryColorLight: AppColors.lightThemeColor,
      primaryColorDark: AppColors.lightThemeColor,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: AppColors.lightThemeColor,
          unselectedItemColor: AppColors.lightThemeColor,
          backgroundColor: AppColors.mainColor,
          type: BottomNavigationBarType.fixed,
          selectedLabelStyle: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w700,
            color: AppColors.lightThemeColor,
          ),
          unselectedLabelStyle: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w700,
            color: AppColors.lightThemeColor,
          ),
          selectedIconTheme:
              IconThemeData(size: 24, color: AppColors.lightThemeColor),
          unselectedIconTheme:
              IconThemeData(size: 24, color: AppColors.lightThemeColor)),
      outlinedButtonTheme: OutlinedButtonThemeData(
          style: ButtonStyle(
        minimumSize: const WidgetStatePropertyAll(Size(double.infinity, 56)),
        foregroundColor: const WidgetStatePropertyAll(AppColors.mainColor),
        backgroundColor:
            const WidgetStatePropertyAll(AppColors.lightThemeColor),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: const BorderSide(
              color: AppColors.mainColor,
              width: 1,
            ),
          ),
        ),
        textStyle: const WidgetStatePropertyAll(
          TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: AppColors.mainColor),
        ),
        padding: const WidgetStatePropertyAll(EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 24,
        )),
      )),
      dividerTheme: const DividerThemeData(
        color: AppColors.mainColor,
        thickness: 1,
      ),
      textButtonTheme: const TextButtonThemeData(
        style: ButtonStyle(
          padding: WidgetStatePropertyAll(EdgeInsets.zero),
          foregroundColor: WidgetStatePropertyAll(AppColors.mainColor),
          textStyle: WidgetStatePropertyAll(
            TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                decoration: TextDecoration.underline,
                decorationColor: AppColors.mainColor,
                decorationStyle: TextDecorationStyle.solid,
                decorationThickness: 2,
                fontStyle: FontStyle.italic),
          ),
        ),
      ),
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
              color: AppColors.greyColor,
              width: 1,
            )),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: AppColors.greyColor,
            width: 1,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: AppColors.greyColor,
            width: 1,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: AppColors.greyColor,
            width: 1,
          ),
        ),
        hintStyle: TextStyle(
          color: AppColors.greyColor,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        prefixIconColor: AppColors.greyColor,
        suffixIconColor: AppColors.greyColor,
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
          ),
          bodyMedium: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: AppColors.blackColor)),
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
      useMaterial3: true,
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        shape: CircleBorder(
          side: BorderSide(
            width: 5,
            color: AppColors.darkThemeSecColor,
          ),
        ),
        backgroundColor: AppColors.darkThemeColor,
        foregroundColor: AppColors.darkThemeSecColor,
        elevation: 2,
        iconSize: 30,
      ),
      focusColor: AppColors.darkThemeSecColor,
      primaryColorDark: AppColors.mainColor,
      primaryColor: AppColors.darkThemeColor,
      primaryColorLight: AppColors.darkThemeSecColor,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: AppColors.darkThemeSecColor,
          unselectedItemColor: AppColors.darkThemeSecColor,
          backgroundColor: AppColors.darkThemeColor,
          type: BottomNavigationBarType.fixed,
          selectedLabelStyle: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w700,
            color: AppColors.darkThemeSecColor,
          ),
          unselectedLabelStyle: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w700,
            color: AppColors.darkThemeSecColor,
          ),
          selectedIconTheme:
              IconThemeData(size: 24, color: AppColors.darkThemeSecColor),
          unselectedIconTheme:
              IconThemeData(size: 24, color: AppColors.darkThemeSecColor)),
      outlinedButtonTheme: OutlinedButtonThemeData(
          style: ButtonStyle(
        minimumSize: const WidgetStatePropertyAll(Size(double.infinity, 56)),
        foregroundColor: const WidgetStatePropertyAll(AppColors.mainColor),
        backgroundColor: const WidgetStatePropertyAll(AppColors.darkThemeColor),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: const BorderSide(
              color: AppColors.mainColor,
              width: 1,
            ),
          ),
        ),
        textStyle: const WidgetStatePropertyAll(
          TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: AppColors.mainColor),
        ),
        padding: const WidgetStatePropertyAll(EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 24,
        )),
      )),
      dividerTheme: const DividerThemeData(
        color: AppColors.mainColor,
        thickness: 1,
      ),
      textButtonTheme: const TextButtonThemeData(
        style: ButtonStyle(
          padding: WidgetStatePropertyAll(EdgeInsets.zero),
          foregroundColor: WidgetStatePropertyAll(AppColors.mainColor),
          textStyle: WidgetStatePropertyAll(
            TextStyle(
                decorationThickness: 2,
                fontSize: 16,
                fontWeight: FontWeight.w700,
                decoration: TextDecoration.underline,
                decorationColor: AppColors.mainColor,
                decorationStyle: TextDecorationStyle.solid,
                fontStyle: FontStyle.italic),
          ),
        ),
      ),
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
        prefixIconColor: AppColors.darkThemeSecColor,
        suffixIconColor: AppColors.darkThemeSecColor,
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
          ),
          bodyMedium: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: AppColors.darkThemeSecColor)),
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
