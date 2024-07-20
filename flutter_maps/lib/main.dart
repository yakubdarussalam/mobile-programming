// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main(List<String> args) {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  final completer = Completer<GoogleMapController>();
  final bekasi = LatLng(-6.237199013568335, 106.98008335966638);
  final baniSaleh = LatLng(-6.252128028433609, 107.00296770871884);
  var markers = RxSet<Marker>();

  void gotoBaniSaleh() async {
    final controller = await completer.future;

    controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: baniSaleh, bearing: 0, zoom: 18)));
    markers.value = {
      Marker(
        markerId: MarkerId("banisaleh"),
        position: baniSaleh,
        infoWindow: InfoWindow(
          title: "UNIVERSITAS BANI SALEH",
          snippet: "Kampus IT bekasi",
        ),
      ),
    };
  }

  void gotoBekasi() async {
    final controller = await completer.future;

    controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: bekasi, bearing: 0, zoom: 18)));
    markers.value = {
      Marker(
        markerId: MarkerId("bekasi"),
        position: bekasi,
        infoWindow: InfoWindow(
          title: "KOTA BEKASI",
          snippet: "Bekasi Kota Patriot",
        ),
      ),
    };
  }

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

    final GoogleMapController controller = await completer.future;
    var currentLocation = await Geolocator.getCurrentPosition();
    var currentPosition = CameraPosition(
        target: LatLng(currentLocation.latitude, currentLocation.longitude),
        zoom: 18,
        bearing: 0);
    controller.animateCamera(CameraUpdate.newCameraPosition(currentPosition));
    markers.clear();
    markers.value = {
      Marker(
        markerId: MarkerId("3"),
        position: baniSaleh,
        infoWindow: InfoWindow(
          title: "My Position",
          snippet: "I'am Here",
        ),
      ),
    };
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Flutter Maps",
        home: Scaffold(
          appBar: AppBar(
            title: Text("Flutter Google Maps"),
            backgroundColor: Colors.blue,
          ),
          body: Obx(
            () => GoogleMap(
                mapType: MapType.hybrid,
                myLocationButtonEnabled: true,
                myLocationEnabled: true,
                markers: markers.value,
                onMapCreated: (controller) {
                  completer.complete(controller);
                },
                initialCameraPosition:
                    CameraPosition(target: bekasi, bearing: 0, zoom: 15)),
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
                        onPressed: gotoBaniSaleh,
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue),
                        child: Text(
                          "Bani Saleh",
                          style: TextStyle(color: Colors.white),
                        )),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    height: 40,
                    child: ElevatedButton(
                        onPressed: getCurrentLocation,
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue),
                        child: Text(
                          "Current",
                          style: TextStyle(color: Colors.white),
                        )),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    height: 40,
                    child: ElevatedButton(
                        onPressed: gotoBekasi,
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue),
                        child: Text(
                          "Bekasi",
                          style: TextStyle(color: Colors.white),
                        )),
                  )
                ],
              )
            ],
          ),
        ));
  }
}
