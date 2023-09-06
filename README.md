# Interactive Bottom Sheet

[![pub package][pub_badge]][pub_badge_link]
[![package publisher][publisher_badge]][publisher_badge_link]
[![style][style_badge]][style_link]
[![license][license_badge]][license_link]

A customizable interactive bottom sheet, which lets you interact with the screen behind it.

![Preview example](example/screenshots/example.gif "Example")

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
  interactive_bottom_sheet: ^1.0.0
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
  bottomSheet: const Scaffold(
  bottomSheet: InteractiveBottomSheet(
    options: InteractiveBottomSheetOptions(
      maxSize: 0.75,
      backgroundColor: Colors.green,
      snapList: [0.25, 0.5],
    ),
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
);
```

## Top Border Radius

To get rounded Borders at the top of the sheet (usual for iOS) on the top side of the widget, it is necessary to overwrite the `bottomSheetTheme`.

```dart
Theme(
  data: Theme.of(context).copyWith(
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: Colors.transparent
    ),
  ),
  child: const Scaffold(
    bottomSheet: InteractiveBottomSheet(
      child: Text('Lorem ipsum dolor sit amet.'),
    ),
  ),
);
```

[pub_badge]: https://img.shields.io/pub/v/interactive_bottom_sheet.svg

[pub_badge_link]: https://pub.dartlang.org/packages/interactive_bottom_sheet

[publisher_badge]: https://img.shields.io/pub/publisher/cosee_lints.svg

[publisher_badge_link]: https://pub.dev/publishers/cosee.biz/packages

[license_badge]: https://img.shields.io/github/license/cosee/cosee_lints

[license_link]: https://github.com/cosee/interactive_bottom_sheet/blob/main/LICENSE

[style_badge]: https://img.shields.io/badge/style-cosee__lints-brightgreen

[style_link]: https://pub.dev/packages/cosee_lints