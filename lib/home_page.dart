import 'dart:async';
import 'dart:io';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Completer<GoogleMapController> _controller = Completer();
  final CacheManager _cacheManager = DefaultCacheManager();
  void cacheMapTiles() async {
    LatLngBounds regionBounds = LatLngBounds(
      southwest: const LatLng(11.4840, 104.8026),
      northeast: const LatLng(11.6103, 104.9799),
    );

    double minZoom = 10; // Example: Minimum zoom level to cache
    double maxZoom = 15; // Example: Maximum zoom level to cache

    for (double zoom = minZoom; zoom <= maxZoom; zoom++) {
      for (double lat = regionBounds.southwest.latitude;
          lat <= regionBounds.northeast.latitude;
          lat += 0.02) {
        for (double lng = regionBounds.southwest.longitude;
            lng <= regionBounds.northeast.longitude;
            lng += 0.02) {
          String tileUrl =
              "https://maps.googleapis.com/maps/api/staticmap?center=$lat,$lng&zoom=$zoom&size=256x256&key=AIzaSyDQWTMw8fk7Pd-g61XP-js6qdsfwsqiaSA"; // Replace with your Google Maps API key
          debugPrint("tileUrl=$tileUrl");
          await _cacheManager.downloadFile(tileUrl);
        }
      }
    }
    debugPrint('Download Done');
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cacheMapTiles();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: GoogleMap(
        initialCameraPosition: const CameraPosition(
          target: LatLng(11.532595782729446, 104.9196691059456),
          zoom: 13,
        ),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        mapType: MapType.none,
        tileOverlays: {
          TileOverlay(
              tileOverlayId: const TileOverlayId("pp"),
              tileProvider: AssetTileProvider())
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.go("/home");
        },
        child: const Icon(Icons.arrow_back_ios_new),
      ),
    );
  }
}

class AssetTileProvider extends TileProvider {
  @override
  Future<Tile> getTile(int x, int y, int? zoom) async {
    String tileUrl =
        "https://maps.googleapis.com/maps/api/staticmap?center=${_tileToLatLng(x, y, zoom!)}&zoom=$zoom&size=256x256&key=YOUR_API_KEY"; // Replace with your Google Maps API key

    File file = await DefaultCacheManager().getSingleFile(tileUrl);
    Uint8List tileBytes = await file.readAsBytes();
    return Tile(
      x,
      y,
      tileBytes,
    );
  }

  LatLng _tileToLatLng(int x, int y, int zoom) {
    var n = math.pow(2, zoom.toDouble());
    double lonDeg = x / n * 360.0 - 180.0;
    double latRad = math.atan(math.sin(math.pi * (1 - 2 * y / n)));
    double latDeg = latRad * 180.0 / math.pi;

    return LatLng(latDeg, lonDeg);
  }
}
