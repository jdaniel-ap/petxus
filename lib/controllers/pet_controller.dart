import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pets/components/preview/preview.dart';
import 'package:pets/database/db.dart';

class PetController extends GetxController {
  final latitude = 0.0.obs;
  final longitude = 0.0.obs;
  final markers = Set<Marker>();

  late StreamSubscription<Position> positionStream;
  LatLng _position = LatLng(-8.05428, -34.8813);
  late GoogleMapController _mapController;

  get position => _position;
  get mapController => _mapController;
  static PetController get to => Get.find<PetController>();

  onMapCreated(GoogleMapController gmc) async {
    _mapController = gmc;
    getPosition();
    loadPets();

    var style = await rootBundle.loadString('assets/map/light.json');

    _mapController.setMapStyle(style);
  }

  loadPets() async {
    FirebaseFirestore db = DB.get();
    final pets = await db.collection('stray_pet').get();

    pets.docs.forEach((pet) => addMarkers(pet));
  }

  addMarkers(pet) async {
    GeoPoint point = pet.get('position.geopoint');
    BitmapDescriptor markerIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(), 'assets/images/marker_90.png');
    markers.add(
      Marker(
        markerId: MarkerId(pet.id),
        position: LatLng(point.latitude, point.longitude),
        infoWindow: InfoWindow(title: pet.get('name')),
        onTap: () => showDetails(pet),
        icon: markerIcon,
      ),
    );

    update();
  }

  showDetails(pet) {
    Get.bottomSheet(
      Preview(
        status: pet['status'],
        sex: pet['sex'],
        seen: pet['created_at'].toDate(),
        age: pet['age'],
        name: pet['name'],
        image: pet['image'],
      ),
    );
  }

  watchPosition() async {
    positionStream = Geolocator.getPositionStream().listen((event) {
      if (event != null) {
        latitude.value = event.latitude;
        longitude.value = event.longitude;

        _mapController.animateCamera(
          CameraUpdate.newLatLng(
            LatLng(latitude.value, longitude.value),
          ),
        );
      }
    });
  }

  @override
  void onClose() {
    positionStream.cancel();
    super.onClose();
  }

  Future<Position> _currentPosition() async {
    LocationPermission permission;
    bool active = await Geolocator.isLocationServiceEnabled();

    if (!active) {
      return Future.error('error');
    }

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('you need to enable location');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('Authorize location on config');
    }

    return await Geolocator.getCurrentPosition();
  }

  getPosition() async {
    try {
      final position = await _currentPosition();
      latitude.value = position.latitude;
      longitude.value = position.longitude;

      _mapController.animateCamera(
        CameraUpdate.newLatLng(LatLng(latitude.value, longitude.value)),
      );
    } catch (e) {
      Get.snackbar('error', e.toString());
    }
  }

  getPetPosition() async {
    try {
      final position = await _currentPosition();

      return [position.latitude, position.longitude];
    } catch (e) {
      Get.snackbar('error', e.toString());
    }
  }
}
