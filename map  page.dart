// import 'package:find_it/main.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';



class MapScreen extends StatefulWidget {
  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController mapController;
  final LatLng _initialPosition = LatLng(12.9716, 77.5946);
  final Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    _requestLocationPermission();
  }

  Future<void> _requestLocationPermission() async {
    PermissionStatus status = await Permission.location.request();
    if (status.isDenied || status.isPermanentlyDenied) {

      print("Location permission denied!");
    }
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;

    setState(() {
      _markers.add(
        Marker(
          markerId: MarkerId("1"),
          position: _initialPosition,
          infoWindow: InfoWindow(title: "Bangalore"),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Google Map Flutter")),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _initialPosition,
          zoom: 12.0,
        ),
        markers: _markers,
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_location_alt),
        onPressed: () {
          LatLng newMarkerPos = LatLng(
              _initialPosition.latitude + 0.01,
              _initialPosition.longitude + 0.01);

          setState(() {
            _markers.add(
              Marker(
                markerId: MarkerId(_markers.length.toString()),
                position: newMarkerPos,
                infoWindow: InfoWindow(title: "New Marker"),
              ),
            );
          });

          mapController.animateCamera(
            CameraUpdate.newLatLng(newMarkerPos),
          );
        },
      ),
    );
  }
}