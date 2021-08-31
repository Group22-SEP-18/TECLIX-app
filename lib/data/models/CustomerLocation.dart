import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:teclix/presentation/common/constants/TeclixColors.dart';
import 'package:teclix/presentation/common/widgets/toast_message.dart';

class CustomerLocation {
  double latitude;
  double longitude;
  String street;
  String city;
  String district;

  CustomerLocation({
    this.latitude,
    this.longitude,
    this.street,
    this.city,
    this.district,
  });

  CustomerLocation.latLng({this.latitude, this.longitude});

  CustomerLocation copyWith({
    double latitude,
    double longitude,
    String street,
    String city,
    String district,
  }) {
    return CustomerLocation(
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      street: street ?? this.street,
      city: city ?? this.city,
      district: district ?? this.district,
    );
  }

  Future<void> getCurrentLocation({BuildContext context}) async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue

      showToast(
        context: context,
        durationInSec: 3,
        color: ColorToastRed,
        text: 'Please enable location services from your settings.',
      );
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        showToast(
          context: context,
          durationInSec: 3,
          color: ColorToastRed,
          text: 'Please enable location permissions from your settings.',
        );
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.medium);
      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      print(e);
    }
  }
}
