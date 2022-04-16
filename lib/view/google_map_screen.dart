import 'package:flutter/material.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:maksap/view/jobs.dart';
import 'package:maksap/widget/app_drawer.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:location/location.dart' as lct;
class GoogleMapScreen extends StatefulWidget {
  const GoogleMapScreen({Key? key}) : super(key: key);

  @override
  _GoogleMapScreenState createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  LatLng currentLocation = LatLng(-2.131910, -79.940287);
  GoogleMapController? _mapController;
  lct.Location? location;
 BitmapDescriptor? icon;


  @override
  void initState() {
    super.initState();
     if (mounted) {
  setState(() {
    // update UI
});}
    getIcons();
    requestPerms();
  }

  getLocation() async {
    var currentLocation = await location!.getLocation();
    locationUpdate(currentLocation);
  }

  locationUpdate(currentLocation) {
    if (currentLocation != null) {
      setState(() {
        this.currentLocation =
            LatLng(currentLocation.latitude, currentLocation.longitude);
        this._mapController!.animateCamera(CameraUpdate.newCameraPosition(
              CameraPosition(target: this.currentLocation, zoom: 14),
            ));
        _createMarker();
      });
    }
  }

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
  }

  changedLocation() {
    location!.onLocationChanged.listen((lct.LocationData cLoc) {
      if (cLoc != null) locationUpdate(cLoc);
    });
  }

// Pedir permiso de Ubicacion
  requestPerms() async {
    Map<Permission, PermissionStatus> statuses =
        await [Permission.locationAlways].request();

    var status = statuses[Permission.locationAlways];
    if (status == PermissionStatus.denied) {
      requestPerms();
    } else {
      gpsAnable();
    }
  }

//Activar GPS
  gpsAnable() async {
    location = lct.Location();
    bool statusResult = await location!.requestService();

    if (!statusResult) {
      gpsAnable();
    } else {
      getLocation();
      changedLocation();
    }
  }

// icon Marker
  getIcons() async {
    var icon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 3.0),
        "assets/images/markeruser.png");
    setState(() {
      this.icon = icon;
    });
  }

//crear Marker
  Set<Marker> _createMarker() {
    var marker = Set<Marker>();

    marker.add(Marker(
      markerId: MarkerId("MarkerCurrent"),
      position: currentLocation,
      icon: icon!,
      infoWindow: InfoWindow(
        title: "Mi Ubicacion",
        snippet:
            "Lat ${currentLocation.latitude} - Lng ${currentLocation.longitude} ",
      ),
      draggable: true,
      onDragEnd: onDragEnd,
    ));

    return marker;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title:const Text("انشاء طلب"),
      ),
      drawer:const AppDrawer(),
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: currentLocation,
              zoom: 14.0,
            ),
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
            minMaxZoomPreference: MinMaxZoomPreference(12, 18.6),
            markers: _createMarker(),
            onMapCreated: _onMapCreated,
          ),
     Padding(
            padding: const EdgeInsets.only(bottom: 32,left: 25,right: 25),
            child: Align(
                alignment: Alignment.bottomCenter,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(Jobs.routeName);
                    },
                    child:  SizedBox(
                        width: size.width,
                        height: 50,
                        child:const Center(
                            child: Text(
                          "تحديد نوع الخدمة",
                          style: TextStyle(fontSize: 20),
                        ),),),),),
          )
        ],
      ),
    );
  }

  onDragEnd(LatLng position) {
    print("nueva posicion $position");
  }
}
