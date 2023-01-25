# Interactive Bottom Sheet

[![package publisher][publisher_badge]][publisher_badge_link]
[![style][style_badge]][style_link]
[![license][license_badge]][license_link]

A customizable interactive bottom sheet, which lets you interact with the screen behind it

## Features

* Easy to use
* Customizable colors
* Customizable DraggableArea
* Customizable heights and widths of different parts of the sheet
* Possibility to declare snap points

## Usage

Depend on it:

```yaml
dependencies:
  interactive_bottom_sheet: ^0.1.0
 ```

Import it:

  ```dart
  import 'package:interactive_bottom_sheet/interactive_bottom_sheet.dart';
```

Example

```dart
Scaffold(
  bottomSheet: const InteractiveBottomSheet(
    options: InteractiveBottomSheetOptions(),
    child: Text(
       'Lorem ipsum dolor sit amet.'
    ),
  ),
);
```

## Customization options

```dart
Scaffold(
  bottomSheet: const InteractiveBottomSheet(
    options: InteractiveBottomSheetOptions(
      maxSize: 0.75,
      backgroundColor: Colors.green,
      snapList: [0.0, 0.25, 0.5],
      draggableAreaHeight: 75.0,
      draggableAreaColor: Colors.grey,
      draggableAreaIndicatorColor: Colors.grey,
      draggableAreaIndicatorWidth : 50.0,
      draggableAreaIndicatorHeight = 3.0,
      draggableAreaIndicatorRadius = 4.0,
      ),
    child: Text(
       'Lorem ipsum dolor sit amet.'
    ),
  ),
);
```

## Top Border Radius

To get rounded Borders at the top of the sheet (usual for iOS) on the top side of the widget, it is necessary to overwrite the bottomSheetTheme.

```dart
Theme(
  data: Theme.of(context).copyWith(
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: Colors.transparent
    ),
  ),
  child: const Scaffold(
    bottomSheet: const InteractiveBottomSheet(
      options: InteractiveBottomSheetOptions(),
      child: Text('Lorem ipsum dolor sit amet.'),
    ),
  ),
);
```

[publisher_badge]: https://img.shields.io/pub/publisher/cosee_lints.svg

[publisher_badge_link]: https://pub.dev/publishers/cosee.biz/packages

[license_badge]: https://img.shields.io/github/license/cosee/cosee_lints

[license_link]: https://github.com/cosee/interactive_bottom_sheet/blob/main/LICENSE

[style_badge]: https://img.shields.io/badge/style-cosee__lints-brightgreen

[style_link]: https://pub.dev/packages/cosee_lints