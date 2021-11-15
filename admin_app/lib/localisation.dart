import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class mappPage extends StatefulWidget {
  //final Station t;

//  const mappPage({Key key,@required this.t}) : super(key: key);
  @override
  State<mappPage> createState() => mappPageState();
}

class mappPageState extends State<mappPage> {
  // ElementEntete Entete = new ElementEntete();
  Completer<GoogleMapController> _controller = Completer();
  MapType _currentMapType = MapType.normal;
  LatLng _lastMapPosition = _center;
  final Set<Marker> _markers = {};
//  double Haedheight = 55;
  // static Station station;

  // mappPageState(Station t){
  //   station= t;
  //   if(station.localisation.longitude==null) print("xxxxxxxxxxxxxxxxxccccccccccccccccccccccccccccccccccccccccc");
  // print("sssssssssssssssssss"+ _station.localisation.latitude);
  // print(double.parse(_station.localisation.latitude).toString()+"rrrrrrrrrrr"+ double.parse(_station.localisation.longitude).toString() );
  // }

  void _onCameraMove(CameraPosition position) {
    _lastMapPosition = position.target;
  }

  static LatLng _center = const LatLng(3.8408866,
      11.488843); // LatLng(double.parse(_station.localisation.latitude), double.parse(_station.localisation.longitude) );
  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      // appBar: Entete.entete_fonction(context, Haedheight),
      // drawer: Entete.drower_fonction(context, Entete.A_selectColor),
      body: Stack(
        children: <Widget>[
          GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 11.0,
            ),
            mapType: _currentMapType,
            markers: _markers,
            onCameraMove: _onCameraMove,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.topRight,
              child: Column(
                children: <Widget>[
                  FloatingActionButton(
                    onPressed: _onMapTypeButtonPressed,
                    materialTapTargetSize: MaterialTapTargetSize.padded,
                    backgroundColor: Colors.blue,
                    child: const Icon(Icons.map, size: 36.0),
                  ),
                  SizedBox(height: 16.0),
                  IconButton(
                    onPressed: _onAddMarkerButtonPressed,
<<<<<<< HEAD
                    child: const Icon(Icons.add_location, size: 36.0),
=======
                  
                    icon: const Icon(Icons.add_location, size: 36.0 ,
                    color: Colors.green),
>>>>>>> 756a9bdad13e39d743a00e1538b36d3c6e6b6c37
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void initState() {
    super.initState();
    _onAddMarkerButtonPressed();
  }

  void _onMapTypeButtonPressed() {
    setState(() {
      _currentMapType = _currentMapType == MapType.normal
          ? MapType.satellite
          : MapType.normal;
    });
  }

  void _onAddMarkerButtonPressed() {
    setState(() {
      _markers.add(Marker(
        // This marker id can be anything that uniquely identifies each marker.
        markerId: MarkerId(_lastMapPosition.toString()),
        position: _lastMapPosition,
        infoWindow: InfoWindow(
          title: 'Acacias',
          snippet: 'John Doe',
        ),
        icon: BitmapDescriptor.defaultMarker,
      ));
    });
  }
}
