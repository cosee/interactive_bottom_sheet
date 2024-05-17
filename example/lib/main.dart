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
            draggableAreaOptions: DraggableAreaOptions(
              // title: ListTile(
              //   leading: Text('Halo'),
              //   trailing: Icon(Icons.ac_unit),
              // ),
            ),
            options: InteractiveBottomSheetOptions(
              snapList: [0.5, 1],
              minimumSize: 0.1,
              maxSize: 1,
            ),
            child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 5,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('Item $index'),
                    subtitle: Text(lorem(paragraphs: 1, words: 24)),
                  );
                })),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('Interactive Bottom Sheet Example'),
        ),
        body: SafeArea(
          child: FlutterMap(
            options: const MapOptions(
              initialZoom: 18,
              initialCenter: _position,
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.example.app',
              ),
              const MarkerLayer(
                markers: [
                  Marker(
                    point: _position,
                    height: 10,
                    width: 10,
                    child: Icon(
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
