import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

class ShopMapController extends GetxController {
  MapController mapController = MapController();
  List<Marker> markers = [];
  LatLng selectedLocation = const LatLng(0, 0);

  Future<void> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // اگر سرویس فعال نیست خطا بده
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    // اگر کاربر پرمیژن نداده ریکوست میکنم
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      // اگر کلا پرمیژن رو دیناید کرد میگم دیگه نمیتونی از نقشه استفاده کنی
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // بعد از اینکه پرمیژن دریافت شد با استفاده از جیولوکینور موقعیت فعلی رو میگیرم
    Position position = await Geolocator.getCurrentPosition();
    selectedLocation == LatLng(position.latitude, position.longitude);
    moveMapToPosition(position.latitude, position.longitude);
  }

  void moveMapToPosition(double latitude, double longitude) {
    mapController.move(LatLng(latitude, longitude), 15.0);
    markers.add(
      Marker(
        point: LatLng(latitude, longitude),
        child: Builder(
          builder: (context) =>
              const Icon(Icons.location_on, color: Colors.blue, size: 50),
        ),
      ),
    );
    update();
  }

  void addMarkerAtPosition(LatLng point) {
    // Clear existing markers and add a new one at the tapped location
    markers.clear();
    markers.add(
      Marker(
        point: point,
        child: Builder(
          builder: (context) =>
              const Icon(Icons.location_on, color: Colors.black, size: 50),
        ),
      ),
    );
    update();
  }

  @override
  void onInit() {
    _determinePosition();
    super.onInit();
  }
}
