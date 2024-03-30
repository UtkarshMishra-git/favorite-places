import 'package:favorite_places/models/places.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PlaceDetailScreen extends StatelessWidget {
  const PlaceDetailScreen({super.key, required this.place});
  final Place place;
   String get locationImage {
    final lat = place.location.latitude;
    final lng = place.location.longitude;
    return 'https://maps.googleapis.com/maps/api/staticmap?center$lat,$lng=zoom=16&size=600x300&maptype=roadmap&markers=color:red%7Clabel:A%7C$lat,$lng&key=YOUR_API_KEY';
  }
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
            bottom: 0,
            left: 0,
            right: 0,
            child: Column(
              children: [
                CircleAvatar(radius: 70,backgroundImage: NetworkImage(locationImage),),
                Container(
                  padding:const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                  decoration:const BoxDecoration(gradient: LinearGradient(colors: [Colors.transparent,Colors.black54],begin: Alignment.topCenter,end:Alignment.bottomCenter)),
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
          ),
        ],
      ),
    );
  }
}
