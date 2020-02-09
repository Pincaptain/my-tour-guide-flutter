import 'package:flutter/material.dart';

import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:location/location.dart';

import 'package:my_tour_guide/features/map/presentation/widgets/location_widget.dart';
import 'package:my_tour_guide/routes.dart';

class MapPage extends StatefulWidget {
  @override
  MapPageState createState() => MapPageState();
}

class MapPageState extends State<MapPage> {
  final location = Location();

  Widget buildMap() {
    return FlutterMap(
      options: MapOptions(
        center: LatLng(51.5, -0.09),
        zoom: 13.0,
        interactive: true,
      ),
      layers: [
        TileLayerOptions(
          urlTemplate: 'https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}@2x.png?access_token=sk.eyJ1IjoiYWRyaWFucml2ZSIsImEiOiJjazNoazJlc3IwM2NuM3BuMnZlejdmend3In0.elMhSTXlGWm_OOz7HrK5pQ',
          additionalOptions: {
            'accessToken': 'sk.eyJ1IjoiYWRyaWFucml2ZSIsImEiOiJjazNoazJlc3IwM2NuM3BuMnZlejdmend3In0.elMhSTXlGWm_OOz7HrK5pQ',
            'id': 'mapbox.streets',
          },
        ),
        MarkerLayerOptions(
          markers: [
            Marker(
              width: 80.0,
              height: 80.0,
              point: LatLng(51.5, -0.09),
              builder: (ctx) => Container(
                child: Icon(
                  Icons.place,
                  color: Theme.of(context).primaryColorDark,
                  size: 48.0,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildLocationInfo(LocationData locationData) {
    return LocationWidget(
      locationData: locationData,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My Tour Guide",
        ),
      ),
      body: Stack(
        children: <Widget>[
          buildMap(),
          StreamBuilder<LocationData>(
            stream: location.onLocationChanged(),
            builder: (context, snapshot) {
              return buildLocationInfo(snapshot.data);
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          sailor('/restaurants');
        },
        child: Icon(
          Icons.restaurant
        ),
      ),
    );
  }
}