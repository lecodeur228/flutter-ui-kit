import 'package:flutter/material.dart';

/// Niveaux d'ombre du design system.
abstract final class AppElevation {
  static const List<BoxShadow> level0 = <BoxShadow>[];

  static const List<BoxShadow> level1 = <BoxShadow>[
    BoxShadow(
      color: Color(0x14000000),
      blurRadius: 4,
      offset: Offset(0, 1),
    ),
  ];

  static const List<BoxShadow> level2 = <BoxShadow>[
    BoxShadow(
      color: Color(0x1A000000),
      blurRadius: 8,
      offset: Offset(0, 2),
    ),
  ];

  static const List<BoxShadow> level3 = <BoxShadow>[
    BoxShadow(
      color: Color(0x1F000000),
      blurRadius: 16,
      offset: Offset(0, 4),
    ),
  ];

  static const List<BoxShadow> level4 = <BoxShadow>[
    BoxShadow(
      color: Color(0x29000000),
      blurRadius: 24,
      offset: Offset(0, 8),
    ),
  ];

  static List<BoxShadow> of(int level) {
    return switch (level) {
      0 => level0,
      1 => level1,
      2 => level2,
      3 => level3,
      _ => level4,
    };
  }
}
