import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_uas/models/job_model.dart';
import 'package:flutter_uas/controllers/job_controller.dart';

class MapScreen extends StatelessWidget {
  final Job job;

  const MapScreen({required this.job});

  @override
  Widget build(BuildContext context) {
    final Completer<GoogleMapController> _controller = Completer();
    var markers = RxSet<Marker>();
    final JobController jobController = Get.find<JobController>();

    void getCurrentLocation() async {
      bool serviceEnabled;
      LocationPermission permission;
      final geolocatorPlatform = GeolocatorPlatform.instance;
      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        Get.snackbar("Lokasi Tidak Aktif", "Silahkan aktifkan GPS anda",
            backgroundColor: Colors.red, colorText: Colors.white);
        return;
      }
      permission = await geolocatorPlatform.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await geolocatorPlatform.requestPermission();
        if (permission == LocationPermission.denied) {
          Get.snackbar("Lokasi Tidak Aktif", "Silahkan aktifkan GPS anda",
              backgroundColor: Colors.red, colorText: Colors.white);
          return;
        }
        return;
      }

      final GoogleMapController controller = await _controller.future;
      var currentLocation = await Geolocator.getCurrentPosition();
      var currentPosition = CameraPosition(
          target: LatLng(currentLocation.latitude, currentLocation.longitude),
          zoom: 18,
          bearing: 0);
      controller.animateCamera(CameraUpdate.newCameraPosition(currentPosition));
      markers.clear();
      markers.add(
        Marker(
          markerId: MarkerId("current"),
          position: LatLng(currentLocation.latitude, currentLocation.longitude),
          infoWindow: InfoWindow(
            title: "My Position",
            snippet: "I am here",
          ),
        ),
      );
    }

    LatLng parseCoordinate(String coordinate) {
      final parts = coordinate.split(',');
      final lat = double.parse(parts[0]);
      final lng = double.parse(parts[1]);
      return LatLng(lat, lng);
    }

    var jobLocation = parseCoordinate(job.coordinate);

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter Google Maps",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Job Location"),
          backgroundColor: Colors.blue,
        ),
        body: Obx(
          () {
            final currentJob =
                jobController.jobs.firstWhere((j) => j.id == job.id);
            var jobLocation = parseCoordinate(currentJob.coordinate);
            return GoogleMap(
              mapType: MapType.hybrid,
              myLocationButtonEnabled: true,
              myLocationEnabled: true,
              markers: markers,
              onMapCreated: (controller) {
                _controller.complete(controller);
                markers.add(
                  Marker(
                    markerId: MarkerId(job.id.toString()),
                    position: jobLocation,
                    infoWindow: InfoWindow(
                      title: job.name,
                      snippet: job.location,
                    ),
                  ),
                );
                controller.animateCamera(
                  CameraUpdate.newCameraPosition(
                    CameraPosition(target: jobLocation, zoom: 15),
                  ),
                );
              },
              initialCameraPosition:
                  CameraPosition(target: jobLocation, bearing: 0, zoom: 15),
            );
          },
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 40,
                  child: ElevatedButton(
                    onPressed: getCurrentLocation,
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                    child: Text(
                      "Current",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
