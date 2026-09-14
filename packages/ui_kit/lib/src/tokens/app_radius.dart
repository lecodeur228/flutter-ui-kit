import 'package:flutter/material.dart';

/// Rayons de bordure du design system.
abstract final class AppRadius {
  static const double none = 0;
  static const double xs = 4;
  static const double sm = 8;
  static const double md = 12;
  static const double lg = 16;
  static const double xl = 24;
  static const double full = 999;

  // Alias sémantiques
  static const double button = sm;
  static const double input = sm;
  static const double card = md;
  static const double chip = full;
  static const double dialog = lg;

  static BorderRadius get buttonAll => BorderRadius.circular(button);
  static BorderRadius get inputAll => BorderRadius.circular(input);
  static BorderRadius get cardAll => BorderRadius.circular(card);
  static BorderRadius get chipAll => BorderRadius.circular(chip);
  static BorderRadius get dialogAll => BorderRadius.circular(dialog);
}
