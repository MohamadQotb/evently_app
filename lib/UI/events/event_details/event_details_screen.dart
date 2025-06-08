import 'package:evently_app/UI/events/edit_event/edit_event_screen.dart';
import 'package:evently_app/UI/main_screen/models/event_model.dart';
import 'package:evently_app/core/common/app_colors.dart';
import 'package:evently_app/core/common/services/firebase_services.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';

class EventDetailsScreen extends StatelessWidget {
  static const String routeName = '/eventDetails';
  const EventDetailsScreen({super.key, required this.event});
  final EventModel event;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Event Details',
          style: TextStyle(color: AppColors.mainColor),
        ),
        centerTitle: true,
        leading: InkWell(
          onTap: () => Navigator.of(context).pop(),
          child: const Icon(
            Icons.arrow_back,
            color: AppColors.mainColor,
          ),
        ),
        actions: [
          InkWell(
            onTap: () {
              Navigator.of(context).pushReplacementNamed(
                EditEventScreen.routeName,
                arguments: event,
              );
            },
            child: const Icon(
              Icons.edit_rounded,
              size: 24,
              color: AppColors.mainColor,
            ),
          ),
          const SizedBox(width: 10),
          InkWell(
            onTap: () async {
              await FirebaseServices.deleteEvent(event).then((value) {
                // ignore: use_build_context_synchronously
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Event deleted successfully'),
                    backgroundColor: AppColors.mainColor,
                  ),
                );
                // ignore: use_build_context_synchronously
                Navigator.of(context).pop();
              });
            },
            child: const Icon(
              Icons.delete_outline_rounded,
              size: 24,
              color: AppColors.redColor,
            ),
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          SizedBox(
            height: size.height * 0.24,
            width: double.infinity,
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(16)),
              child: Image.asset(
                event.categoryValue.getImages(),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(event.title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
                color: AppColors.mainColor,
              )),
          const SizedBox(height: 16),
          Container(
              padding: const EdgeInsets.all(8),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: AppColors.mainColor,
                ),
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: AppColors.mainColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(Icons.calendar_month_outlined,
                        size: 22,
                        color: Theme.of(context).scaffoldBackgroundColor),
                  ),
                  const SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        DateFormat('dd MMMM yyyy').format(event.date),
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: AppColors.mainColor,
                        ),
                      ),
                      Text(DateFormat('hh:mm a').format(event.date),
                          style: Theme.of(context).textTheme.titleMedium),
                    ],
                  ),
                ],
              )),
          const SizedBox(height: 16),
          Container(
              padding: const EdgeInsets.all(8),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: AppColors.mainColor,
                ),
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: AppColors.mainColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(Icons.my_location_rounded,
                        size: 22,
                        color: Theme.of(context).scaffoldBackgroundColor),
                  ),
                  const SizedBox(width: 8),
                  Text('${event.city}, ${event.country}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColors.mainColor,
                      )),
                  const Spacer(),
                  const Icon(Icons.arrow_forward_ios,
                      size: 16, color: AppColors.mainColor),
                ],
              )),
          const SizedBox(height: 16),
          Container(
            width: double.infinity,
            height: size.height * 0.42,
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.mainColor),
              borderRadius: BorderRadius.circular(16),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: LatLng(event.latitude!, event.longitude!),
                  zoom: 15,
                ),
                markers: {
                  Marker(
                    markerId: const MarkerId('Event Location'),
                    position: LatLng(event.latitude!, event.longitude!),
                    infoWindow: InfoWindow(
                      title: event.title,
                      snippet: '${event.city}, ${event.country}',
                    ),
                  ),
                },
                scrollGesturesEnabled: false,
                zoomControlsEnabled: false,
                myLocationEnabled: false,
                compassEnabled: false,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text('Description', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 8),
          Text(event.description,
              style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
