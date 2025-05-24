import 'package:evently_app/UI/main_screen/widgets/event_card_widget.dart';
import 'package:flutter/material.dart';

class EventsView extends StatelessWidget {
  const EventsView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 4,
        ),
        itemBuilder: (context, index) => EventCardWidget(),
        separatorBuilder: (context, index) => SizedBox(
              height: 6,
            ),
        itemCount: 10);
  }
}
