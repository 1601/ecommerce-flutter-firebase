import 'package:flutter/material.dart';
import 'package:ecommerce_flutter_firebase/constants/strings.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.homePage),
        backgroundColor: Colors.orange,
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () => Navigator.pushNamed(context, '/cart'),
          ),
        ],
      ),
      body: MapScaffold(),
      floatingActionButton: new Container(
        height: 150.0,
        child: new Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.bottomRight,
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Container(
                    height: 80.0,
                    width: 90.0,
                    child: new FloatingActionButton(
                      onPressed: () => Navigator.pushNamed(context, '/camera'),
                      tooltip: 'Capture preferred food',
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text("Food"),
                            Icon(Icons.camera_alt),
                            Text("Request")
                          ]),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MapScaffold extends StatefulWidget {
  @override
  State<MapScaffold> createState() => MapState();
}

class MapState extends State<MapScaffold> {
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _manilaPosition = CameraPosition(
    target: LatLng(14.5995, 120.984222),
    zoom: 12,
  );

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition: _manilaPosition,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
          markers: {
            bananaMarker,
            orangeMarker,
            lemonMarker,
            carrotMarker,
            cucumberMarker,
            tomatoMarker,
            greenpepperMarker,
            redpepperMarker,
            sweetpotatoMarker,
            whitepotatoMarker,
            garlicMarker,
            onionMarker,
            lettuceMarker,
            spinachMarker,
            parsleyMarker,
            cilantroMarker,
          },
          myLocationEnabled: true,
          padding: EdgeInsets.only(bottom: 175.0, right: 23.0)),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}

Marker bananaMarker = Marker(
  markerId: MarkerId('banana'),
  position: LatLng(14.7566, 121.0450),
  infoWindow: InfoWindow(title: 'Banana'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueYellow,
  ),
);

Marker orangeMarker = Marker(
  markerId: MarkerId('orange'),
  position: LatLng(14.4445, 120.9939),
  infoWindow: InfoWindow(title: 'Orange'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueOrange,
  ),
);

Marker lemonMarker = Marker(
  markerId: MarkerId('lemon'),
  position: LatLng(14.5547, 121.0244),
  infoWindow: InfoWindow(title: 'Lemon'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueYellow,
  ),
);

Marker carrotMarker = Marker(
  markerId: MarkerId('carrot'),
  position: LatLng(14.6681, 120.9658),
  infoWindow: InfoWindow(title: 'Carrot'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueOrange,
  ),
);

Marker cucumberMarker = Marker(
  markerId: MarkerId('cucumber'),
  position: LatLng(14.5794, 121.0359),
  infoWindow: InfoWindow(title: 'Cucumber'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueGreen,
  ),
);

Marker tomatoMarker = Marker(
  markerId: MarkerId('tomato'),
  position: LatLng(14.5995, 120.9842),
  infoWindow: InfoWindow(title: 'Tomato'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);

Marker greenpepperMarker = Marker(
  markerId: MarkerId('greenpepper'),
  position: LatLng(14.6507, 121.1029),
  infoWindow: InfoWindow(title: 'Greenpepper'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueGreen,
  ),
);

Marker redpepperMarker = Marker(
  markerId: MarkerId('redpepper'),
  position: LatLng(14.4081, 121.0415),
  infoWindow: InfoWindow(title: 'Redpepper'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueRose,
  ),
);

Marker sweetpotatoMarker = Marker(
  markerId: MarkerId('sweetpotato'),
  position: LatLng(14.6732, 120.9350),
  infoWindow: InfoWindow(title: 'Sweetpotato'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueCyan,
  ),
);

Marker whitepotatoMarker = Marker(
  markerId: MarkerId('whitepotato'),
  position: LatLng(14.4793, 121.0198),
  infoWindow: InfoWindow(title: 'Whitepotato'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueAzure,
  ),
);

Marker garlicMarker = Marker(
  markerId: MarkerId('garlic'),
  position: LatLng(14.5378, 121.0014),
  infoWindow: InfoWindow(title: 'Garlic'),
  icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
);

Marker onionMarker = Marker(
  markerId: MarkerId('onion'),
  position: LatLng(14.5764, 121.0851),
  infoWindow: InfoWindow(title: 'Onion'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueGreen,
  ),
);

Marker lettuceMarker = Marker(
  markerId: MarkerId('lettuce'),
  position: LatLng(14.5454, 121.0687),
  infoWindow: InfoWindow(title: 'Lettuce'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueGreen,
  ),
);

Marker spinachMarker = Marker(
  markerId: MarkerId('spinach'),
  position: LatLng(14.6760, 121.0437),
  infoWindow: InfoWindow(title: 'Spinach'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);

Marker parsleyMarker = Marker(
  markerId: MarkerId('parsley'),
  position: LatLng(14.6019, 121.0355),
  infoWindow: InfoWindow(title: 'Parsley'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueCyan,
  ),
);

Marker cilantroMarker = Marker(
  markerId: MarkerId('cilantro'),
  position: LatLng(14.7011, 120.9830),
  infoWindow: InfoWindow(title: 'Cilantro'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueMagenta,
  ),
);
