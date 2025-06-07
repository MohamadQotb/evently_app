import 'package:evently_app/UI/events/create_event/providers/create_event_provider.dart';
import 'package:evently_app/core/common/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class PickEventLocationScreen extends StatelessWidget {
  static const String routeName = '/pickEventLocationScreen';
  final CreateEventProvider provider;
  const PickEventLocationScreen({super.key, required this.provider});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: GoogleMap(
            onTap: (latlng) {
              provider.onMapTap(latlng);
              Navigator.pop(context);
            },
            initialCameraPosition: provider.cameraPosition,
            onMapCreated: (GoogleMapController controller) {
              provider.mapController = controller;
            },
            markers: provider.markers,
          )),
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            padding: const EdgeInsets.all(16.0),
            color: AppColors.mainColor,
            child: const Text(
              'Tap on Location To Select',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: AppColors.lightThemeColor),
            ),
          )
        ],
      ),
    );
  }
}
