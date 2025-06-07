import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapsTabProvider extends ChangeNotifier {
  Location location = Location();
  Set<Marker> markers = {};

  late GoogleMapController mapController;
  CameraPosition cameraPosition = const CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  Future<bool> _getLocationPermission() async {
    PermissionStatus permissionStatus;
    permissionStatus = await location.hasPermission();
    if (permissionStatus == PermissionStatus.denied) {
      permissionStatus = await location.requestPermission();
    }
    return permissionStatus == PermissionStatus.granted;
  }

  Future<void> getLocation() async {
    bool isGranted = await _getLocationPermission();
    if (!isGranted) {}
    bool serviceEnabled = await _checkLocationService();
    if (serviceEnabled) {}
    LocationData locationData = await location.getLocation();
    changeLocationOnMap(locationData);
    notifyListeners();
  }

  Future<bool> _checkLocationService() async {
    bool serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return false;
      }
    }
    return serviceEnabled;
  }

  void changeLocationOnMap(LocationData locationData) {
    cameraPosition = CameraPosition(
      target: LatLng(locationData.latitude!, locationData.longitude!),
      zoom: 14.4746,
    );
    markers.add(
      Marker(
        markerId: const MarkerId('1'),
        position: LatLng(locationData.latitude!, locationData.longitude!),
        infoWindow: const InfoWindow(
          title: 'User Location',
        ),
      ),
    );
    mapController.animateCamera(
      CameraUpdate.newCameraPosition(cameraPosition),
    );
  }

  void changeCameraPosition(LatLng latLng, String? title) {
    cameraPosition = CameraPosition(
      target: latLng,
      zoom: 14.4746,
    );
    markers.add(Marker(
      markerId: MarkerId(UniqueKey().toString()),
      position: LatLng(latLng.latitude, latLng.longitude),
      infoWindow: InfoWindow(
        title: title ?? 'Selected Location',
      ),
    ));
    mapController.animateCamera(
      CameraUpdate.newCameraPosition(cameraPosition),
    );
    notifyListeners();
  }
}
