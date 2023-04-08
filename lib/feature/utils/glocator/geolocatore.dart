import 'dart:async';

import 'package:bhagat_group_ticket_management/features/utility/utility.dart';
import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';

class GeolocatoreService {
  Stream<Position> get livepostion => _determinliveLocation();
  Stream<ServiceStatus> get liveService => _liveServiceDetails();
  Future<bool> get getPermission => _determinePermission();

  Future<bool> _determinePermission() async {
    bool serviceEnabled;
    LocationPermission permission;
    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      Utility.showToast("Location services are disabled");
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.deniedForever) {
        Utility.showToast("Location services are disabled");
        return false;
      }
    }
    return true;
  }

  Stream<Position> _determinliveLocation() {
    late LocationSettings locationSettings;

    if (defaultTargetPlatform == TargetPlatform.android) {
      locationSettings = AndroidSettings(
          accuracy: LocationAccuracy.high,
          distanceFilter: 100,
          forceLocationManager: true,
          // intervalDuration: const Duration(seconds: 10),
          foregroundNotificationConfig: const ForegroundNotificationConfig(
            notificationText: "Tap to open",
            notificationTitle: "Running in Background",
            enableWakeLock: true,
          ));
    } else if (defaultTargetPlatform == TargetPlatform.iOS ||
        defaultTargetPlatform == TargetPlatform.macOS) {
      locationSettings = AppleSettings(
        accuracy: LocationAccuracy.high,
        activityType: ActivityType.fitness,
        distanceFilter: 100,
        pauseLocationUpdatesAutomatically: true,
        // Only set to true if our app will be started up in the background.
        showBackgroundLocationIndicator: true,
      );
    } else {
      locationSettings = const LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 100,
      );
    }

    return Geolocator.getPositionStream(locationSettings: locationSettings);
  }

  Stream<ServiceStatus> _liveServiceDetails(){
    return Geolocator.getServiceStatusStream();
  }

}
