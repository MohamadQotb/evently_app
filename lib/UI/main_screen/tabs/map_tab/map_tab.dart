import 'package:evently_app/UI/main_screen/models/event_model.dart';
import 'package:evently_app/UI/main_screen/tabs/map_tab/provider/maps_tab_provider.dart';
import 'package:evently_app/UI/main_screen/tabs/map_tab/widgets/event_map_card.dart';
import 'package:evently_app/core/common/services/firebase_services.dart';
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
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Column(
            children: [
              Expanded(
                  child: GoogleMap(
                zoomControlsEnabled: false,
                initialCameraPosition: provider.cameraPosition,
                onMapCreated: (GoogleMapController controller) {
                  provider.mapController = controller;
                },
                markers: provider.markers,
              )),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 43.0, horizontal: 16),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.12,
              child: FutureBuilder<List<EventModel>>(
                  future: FirebaseServices.getAllEvents(categoryValue: null),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return const Center(child: Text('No events found.'));
                    } else {
                      List<EventModel> events = snapshot.data!;
                      return ListView.separated(
                        itemBuilder: (context, index) => InkWell(
                            onTap: () {
                              provider.changeCameraPosition(
                                  LatLng(events[index].latitude!,
                                      events[index].longitude!),
                                  events[index].title);
                            },
                            child: EventMapCard(eventModel: events[index])),
                        separatorBuilder: (context, index) => SizedBox(
                          width: 10,
                        ),
                        itemCount: events.length,
                        scrollDirection: Axis.horizontal,
                      );
                    }
                  }),
            ),
          )
        ],
      ),
    );
  }
}
