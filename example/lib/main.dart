import 'package:flutter/material.dart';
import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:interactive_bottom_sheet/interactive_bottom_sheet.dart';
import 'package:interactive_bottom_sheet_example/theme.dart';
import 'package:latlong2/latlong.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const LatLng _position = LatLng(49.866903671198635, 8.627595429347092);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: CustomTheme.theme(context),
      home: Scaffold(
        bottomSheet: InteractiveBottomSheet(
          draggableAreaOptions: const DraggableAreaOptions(topBorderRadius: 10),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Text(
              lorem(paragraphs: 4, words: 2000),
              style: const TextStyle(fontSize: 20),
            ),
          ),
        ),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('Interactive Bottom Sheet Example'),
        ),
        body: SafeArea(
          child: FlutterMap(
            options: MapOptions(
              zoom: 18,
              center: _position,
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.example.app',
              ),
              MarkerLayer(
                markers: [
                  Marker(
                    point: _position,
                    height: 10,
                    width: 10,
                    builder: (_) => const Icon(
                      Icons.place,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
