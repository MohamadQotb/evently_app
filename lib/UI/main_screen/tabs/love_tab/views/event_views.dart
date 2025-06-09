import 'package:evently_app/UI/main_screen/models/event_model.dart';
import 'package:evently_app/UI/main_screen/widgets/event_card_widget.dart';
import 'package:evently_app/core/common/services/firebase_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EventViews extends StatefulWidget {
  const EventViews({super.key, required this.searchText});
  final String searchText;

  @override
  State<EventViews> createState() => _EventViewsState();
}

class _EventViewsState extends State<EventViews> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: StreamBuilder(
        stream: FirebaseServices.getFavEvents(),
        builder: (_, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(
                child: Text(AppLocalizations.of(context)!.noEventsFound));
          } else {
            List<EventModel> events = snapshot.data!;
            List filteredEvents = events.where((event) {
              return event.title
                  .toLowerCase()
                  .contains(widget.searchText.toLowerCase());
            }).toList();
            return RefreshIndicator(
              onRefresh: () {
                return Future.delayed(
                  const Duration(seconds: 1),
                  () => setState(() {}),
                );
              },
              child: ListView.separated(
                  padding: const EdgeInsets.symmetric(
                    vertical: 4,
                  ),
                  itemBuilder: (context, index) => EventCardWidget(
                        eventModel: filteredEvents[index],
                      ),
                  separatorBuilder: (context, index) => const SizedBox(
                        height: 6,
                      ),
                  itemCount: filteredEvents.length),
            );
          }
        },
      ),
    );
  }
}
