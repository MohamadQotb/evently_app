import 'package:evently_app/UI/main_screen/tabs/home_tab/views/events_view.dart';
import 'package:evently_app/UI/main_screen/tabs/home_tab/views/home_header_view.dart';
import 'package:flutter/material.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [HomeHeaderView(), Expanded(child: EventsView())],
    );
  }
}
