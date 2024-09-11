import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddAddressesScreen extends StatelessWidget {
  const AddAddressesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const GoogleMap(
      initialCameraPosition: CameraPosition(
          target: LatLng(30,30),
          //zoom: 11
      ),
    );
  }
}
