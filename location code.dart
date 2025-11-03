import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class location extends StatefulWidget {
  const location({super.key});

  @override
  State<location> createState() => _locationState();
}

class _locationState extends State<location> {
  TextEditingController _locationController = TextEditingController();

  Future<void> _Location() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enable location services')),
      );
      return;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Location permission denied')),
        );
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text('Location permissions are permanently denied')),
      );
      return;
    }
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    setState(() {
      _locationController.text =
      'Latitude: ${position.latitude}, Longitude: ${position.longitude}';
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[200],
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _locationController,
                decoration:  InputDecoration(
                  labelText: "Your Location",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.location_on),
                ),
                readOnly: true,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: _Location,
                child:Text("Get Current Location"),
              ),
            ),
          ],
        ),
      ),

    );
  }
}
