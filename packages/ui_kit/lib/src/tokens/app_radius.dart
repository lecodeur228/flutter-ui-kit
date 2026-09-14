import 'package:flutter/material.dart';

/// Rayons Journey — friendly travel, échelle régulière.
abstract final class AppRadius {
  static const double none = 0;
  static const double xs = 8;
  static const double sm = 12;
  static const double md = 16;
  static const double lg = 20;
  static const double xl = 24;
  static const double full = 999;
  static const double pill = full;

  static const double button = full; // pill / capsule — radius conséquent
  static const double input = md; // champs arrondis Journey
  static const double card = md;
  static const double chip = full;
  static const double dialog = lg;

  static BorderRadius get xsAll => BorderRadius.circular(xs);
  static BorderRadius get smAll => BorderRadius.circular(sm);
  static BorderRadius get mdAll => BorderRadius.circular(md);
  static BorderRadius get lgAll => BorderRadius.circular(lg);
  static BorderRadius get xlAll => BorderRadius.circular(xl);
  // Const pour ButtonStyle / shape
  static const BorderRadius buttonAll = BorderRadius.all(Radius.circular(999));
  static BorderRadius get inputAll => BorderRadius.circular(input);
  static BorderRadius get cardAll => BorderRadius.circular(card);
  static BorderRadius get chipAll => BorderRadius.circular(chip);
  static BorderRadius get dialogAll => BorderRadius.circular(dialog);
  static BorderRadius get pillAll => BorderRadius.circular(pill);
}
