import 'package:evently_app/UI/main_screen/tabs/love_tab/views/event_views.dart';
import 'package:evently_app/core/common/app_colors.dart';
import 'package:flutter/material.dart';

class LoveTab extends StatefulWidget {
  const LoveTab({super.key});

  @override
  State<LoveTab> createState() => _LoveTabState();
}

class _LoveTabState extends State<LoveTab> {
  TextEditingController searchText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GestureDetector(
          onTap: FocusScope.of(context).unfocus,
          child: Column(
            children: [
              TextField(
                controller: searchText,
                onChanged: (value) {
                  if (value.length > 2) {
                    setState(() {});
                  } else if (value.isEmpty) {
                    setState(() {});
                  }
                },
                decoration: InputDecoration(
                    suffix: GestureDetector(
                      onTap: () {
                        searchText.clear();
                        setState(() {});
                      },
                      child: Icon(Icons.clear),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                        borderSide:
                            BorderSide(color: AppColors.mainColor, width: 1)),
                    prefixIcon: Icon(
                      Icons.search_rounded,
                      color: AppColors.mainColor,
                    ),
                    hintText: 'Search for Event',
                    hintStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: AppColors.mainColor)),
              ),
              EventViews(searchText: searchText.text)
            ],
          ),
        ),
      ),
    );
  }
}
