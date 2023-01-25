import 'package:flutter/material.dart';
import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:interactive_bottom_sheet/interactive_bottom_sheet.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Theme.of(context).copyWith(
        bottomSheetTheme:
            const BottomSheetThemeData(backgroundColor: Colors.transparent),
      ),
      home: Scaffold(
        backgroundColor: const Color(0xFF7D7D7D),
        resizeToAvoidBottomInset: false,
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
          backgroundColor: const Color(0xFF4FAF47),
          automaticallyImplyLeading: false,
          title: const Text('Interactive Bottom Sheet Example'),
        ),
        body: SafeArea(
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: Text(
                  lorem(paragraphs: 5, words: 2000),
                  style: const TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
