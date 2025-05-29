import 'package:evently_app/UI/main_screen/models/event_model.dart';
import 'package:evently_app/UI/main_screen/tabs/home_tab/provider/home_tab_provider.dart';
import 'package:evently_app/UI/main_screen/widgets/event_card_widget.dart';
import 'package:evently_app/core/common/services/firebase_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EventsView extends StatefulWidget {
  const EventsView({super.key});

  @override
  State<EventsView> createState() => _EventsViewState();
}

class _EventsViewState extends State<EventsView> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<EventModel>>(
      future: FirebaseServices.getAllEvents(
          categoryValue: context.watch<HomeTabProvider>().selectedCategory),
      builder: (_, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No events found.'));
        } else {
          List<EventModel> events = snapshot.data!;
          return RefreshIndicator(
            onRefresh: () {
              return Future.delayed(
                const Duration(seconds: 1),
                () => setState(() {}),
              );
            },
            child: ListView.separated(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 4,
                ),
                itemBuilder: (context, index) => EventCardWidget(
                      eventModel: events[index],
                    ),
                separatorBuilder: (context, index) => const SizedBox(
                      height: 6,
                    ),
                itemCount: events.length),
          );
        }
      },
    );
  }
}
