import 'package:evently_app/UI/main_screen/tabs/map_tab/provider/maps_tab_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class MapTab extends StatelessWidget {
  const MapTab({super.key});

  @override
  Widget build(BuildContext context) {
    MapsTabProvider provider = Provider.of<MapsTabProvider>(context);
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(
          top: 16.0,
        ),
        child: FloatingActionButton(
          onPressed: () {
            provider.getLocation();
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: const Icon(Icons.my_location),
        ),
      ),
      body: Column(
        children: [
          Expanded(
              child: GoogleMap(
            initialCameraPosition: provider.cameraPosition,
            onMapCreated: (GoogleMapController controller) {
              provider.mapController = controller;
            },
            markers: provider.markers,
          )),
        ],
      ),
    );
  }
}
