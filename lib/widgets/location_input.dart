import 'package:flutter/material.dart';
import 'package:location/location.dart';

class LocationInput extends StatefulWidget {
  const LocationInput({Key? key}) : super(key: key);

  @override
  State<LocationInput> createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  String? _previewImageUrl;
  Future<void> _getCurrentUserLocation() async {
    final locData = await Location().getLocation();
    print(locData.latitude);
    print(locData.longitude);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 170,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: Colors.grey,
            ),
          ),
          child: _previewImageUrl == null
              ? const Text('Localização não informada!')
              : Image.network(
                  _previewImageUrl!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton.icon(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.indigo,
              ),
              onPressed: _getCurrentUserLocation,
              icon: const Icon(
                Icons.location_on,
              ),
              label: const Text(
                "Localização Atual",
              ),
            ),
            TextButton.icon(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.indigo,
              ),
              onPressed: () {},
              icon: const Icon(
                Icons.map,
              ),
              label: const Text(
                "Selecione no Mapa",
              ),
            ),
          ],
        )
      ],
    );
  }
}
