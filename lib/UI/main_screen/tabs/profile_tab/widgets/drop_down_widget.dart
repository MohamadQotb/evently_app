import 'package:evently_app/core/common/app_colors.dart';
import 'package:flutter/material.dart';

class DropDownWidget extends StatefulWidget {
  final String? selected;
  final List<DropdownMenuItem<String>>? items;
  final void Function(String?)? onChanged;

  const DropDownWidget(
      {super.key,
      required this.selected,
      required this.items,
      required this.onChanged});

  @override
  State<DropDownWidget> createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends State<DropDownWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          border: Border.all(
            color: AppColors.mainColor,
          )),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          iconSize: 40,
          icon: Icon(Icons.arrow_drop_down_rounded),
          borderRadius: BorderRadius.circular(16),
          isExpanded: true,
          iconEnabledColor: AppColors.mainColor,
          style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 20,
              color: AppColors.mainColor),
          items: widget.items,
          onChanged: widget.onChanged,
          value: widget.selected,
        ),
      ),
    );
  }
}
