import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:interactive_bottom_sheet/interactive_bottom_sheet.dart';
import 'package:interactive_bottom_sheet_example/theme.dart';
import 'package:latlong2/latlong.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static final LatLng _position = LatLng(49.866903671198635, 8.627595429347092);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: CustomTheme.theme(context),
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        bottomSheet: const Scaffold(
          bottomSheet: InteractiveBottomSheet(
            options: InteractiveBottomSheetOptions(
              maxSize: 0.75,
              backgroundColor: Colors.green,
              snapList: [0.0, 0.25, 0.5],
              draggableAreaOptions: DraggableAreaOptions(
                topBorderRadius: 10,
                height: 75,
                backgroundColor: Colors.grey,
                indicatorColor: Colors.grey,
                indicatorWidth: 50,
                indicatorHeight: 50,
                indicatorRadius: 10,
              ),
            ),
            child: Text('Lorem ipsum dolor sit amet.'),
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
