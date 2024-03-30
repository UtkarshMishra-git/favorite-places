import 'dart:io';

import 'package:favorite_places/models/places.dart';
import 'package:favorite_places/providers/users_places.dart';
import 'package:favorite_places/widgets/image_input.dart';
import 'package:favorite_places/widgets/location_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddPlaceScreen extends ConsumerStatefulWidget {
  const AddPlaceScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _AddPlaceScreenState();
  }
}

class _AddPlaceScreenState extends ConsumerState<AddPlaceScreen> {
  final _titleController = TextEditingController();
  File? _selectedImage;
  PlaceLocation? _selectedLocation;
  void _savePlace() {
    final enteredTitle = _titleController.text;
    if (enteredTitle.isEmpty || _selectedImage == null ||_selectedLocation==null) {
      return;
    }

    ref
        .read(userPlacesNotifier.notifier)
        .addPlace(enteredTitle, _selectedImage!,_selectedLocation!);
    Navigator.of(context).pop();
  }

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Place'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              style:
                  TextStyle(color: Theme.of(context).colorScheme.onBackground),
              decoration: const InputDecoration(
                labelText: 'Title',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ImageInput(onPickImage: (image) {
              _selectedImage = image;
            }),
            const SizedBox(
              height: 10,
            ),
            LocationInput(onSelectLocation: (location) {
              _selectedLocation = location;
            }),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton.icon(
              icon: const Icon(Icons.add),
              onPressed: _savePlace,
              label: const Text('Add Places'),
            )
          ],
        ),
      ),
    );
  }
}
