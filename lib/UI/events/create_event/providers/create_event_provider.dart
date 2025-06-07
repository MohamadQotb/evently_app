import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:geocoding/geocoding.dart' as geocoding;

class CreateEventProvider extends ChangeNotifier {
  Location location = Location();
  Set<Marker> markers = {};
  String? country;
  String? city;

  late GoogleMapController mapController;
  CameraPosition cameraPosition = const CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );
  LatLng? selectedLocation;
  CreateEventProvider() {
    getLocation();
  }

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
    if (!isGranted) {
      return;
    }
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

  void onMapTap(LatLng position) {
    selectedLocation = position;
    markers.add(
      Marker(
        markerId: const MarkerId('2'),
        position: position,
        infoWindow: const InfoWindow(
          title: 'Selected Location',
        ),
      ),
    );
    convertLatLngToAddress(position);

    notifyListeners();
  }

  void clearSelectedLocation() {
    selectedLocation = null;
    notifyListeners();
  }

  Future<void> convertLatLngToAddress(LatLng position) async {
    List<geocoding.Placemark> placemarks =
        await geocoding.placemarkFromCoordinates(
      position.latitude,
      position.longitude,
    );
    if (placemarks.isNotEmpty) {
      country = placemarks[0].country;
      city = placemarks[0].locality;
      notifyListeners();
    } else if (position.latitude == 0.0 && position.longitude == 0.0) {
      country = 'Unknown';
      city = 'Unknown';
      notifyListeners();
    } else {
      country = 'Unknown';
      city = 'Unknown';
      notifyListeners();
    }
  }
}
