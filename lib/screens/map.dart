import 'package:favorite_places/models/places.dart';
import 'package:flutter/material.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({
    super.key,
    this.location =
        PlaceLocation(latitude: 37.422, longitude: -122.084, address: ''),
  });
  final PlaceLocation location;

  State<MapScreen> createState() {
    return _MapScreenState();
  }
}

class _MapScreenState extends State<MapScreen> {
  Widget build(BuildContext context) {
    return;
  }
}
