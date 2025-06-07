import 'package:evently_app/UI/main_screen/models/category_slider_model.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart' as geocoding;
import 'package:location/location.dart';

class HomeTabProvider extends ChangeNotifier {
  CategoryValues? selectedCategory;
  Location location = Location();
  String? country;
  String? city;

  HomeTabProvider() {
    getLocation();
  }
  changeCategory(CategoryValues cat) {
    if (cat == CategoryValues.all) {
      selectedCategory = null;
      notifyListeners();
      return;
    }
    selectedCategory = cat;
    notifyListeners();
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
    if (!isGranted) {}
    bool serviceEnabled = await _checkLocationService();
    if (serviceEnabled) {}
    LocationData locationData = await location.getLocation();
    List<geocoding.Placemark> placemarks =
        await geocoding.placemarkFromCoordinates(
            locationData.latitude!, locationData.longitude!);
    if (placemarks.isNotEmpty) {
      country = placemarks[0].country;
      city = placemarks[0].locality;
      notifyListeners();
    } else {
      country = 'Unknown';
      city = 'Unknown';
      notifyListeners();
    }

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
}
