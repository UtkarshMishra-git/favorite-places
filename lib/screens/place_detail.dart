import 'package:favorite_places/models/places.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PlaceDetailScreen extends StatelessWidget {
  const PlaceDetailScreen({super.key, required this.place});
  final Place place;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(place.title),
      ),
      body: Stack(
        children: [
          Image.file(
            place.image,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Positioned(
            child: Column(
              children: [
                CircleAvatar(),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                  alignment: Alignment.center,
                  child: Text(
                    place.location.address,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Theme.of(context).colorScheme.onBackground,
                        ),
                  ),
                ),
              ],
            ),
            bottom: 0,
            left: 0,
            right: 0,
          ),
        ],
      ),
    );
  }
}
