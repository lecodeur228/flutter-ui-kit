import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../icons/ui_icons.dart';
import '../../tokens/app_radius.dart';
import '../../tokens/app_sizes.dart';
import '../../tokens/app_spacing.dart';
import '../../theme/ui_kit_colors.dart';

/// Bouton glisser-pour-agir (slide to confirm) — style Journey pill.
///
/// Typique covoiturage : démarrer un trajet, confirmer une réservation.
class UiSlideButton extends StatefulWidget {
  const UiSlideButton({
    super.key,
    required this.label,
    required this.onCompleted,
    this.height = AppSizes.buttonLg,
    this.enabled = true,
    this.resetAfterComplete = true,
    this.completedLabel,
    this.thumbIcon,
    this.successIcon,
  });

  /// Texte centré (ex. « Glisser pour démarrer »).
  final String label;

  /// Appelé quand le pouce atteint la fin.
  final VoidCallback onCompleted;

  final double height;
  final bool enabled;

  /// Remet le curseur à gauche après succès (défaut true).
  final bool resetAfterComplete;

  /// Label affiché brièvement après succès.
  final String? completedLabel;

  final IconData? thumbIcon;
  final IconData? successIcon;

  @override
  State<UiSlideButton> createState() => _UiSlideButtonState();
}

class _UiSlideButtonState extends State<UiSlideButton>
    with SingleTickerProviderStateMixin {
  double _dx = 0;
  bool _dragging = false;
  bool _completed = false;

  static const double _thumbPad = 4;
  static const double _completeThreshold = 0.92;

  double get _thumbSize => widget.height - _thumbPad * 2;

  void _onDragStart(DragStartDetails _) {
    if (!widget.enabled || _completed) return;
    setState(() => _dragging = true);
  }

  void _onDragUpdate(DragUpdateDetails details, double maxDx) {
    if (!widget.enabled || _completed) return;
    setState(() {
      _dx = (_dx + details.delta.dx).clamp(0.0, maxDx);
    });
  }

  void _onDragEnd(double maxDx) {
    if (!widget.enabled || _completed) return;
    final progress = maxDx <= 0 ? 0.0 : _dx / maxDx;
    if (progress >= _completeThreshold) {
      _finish(maxDx);
    } else {
      setState(() {
        _dx = 0;
        _dragging = false;
      });
    }
  }

  Future<void> _finish(double maxDx) async {
    setState(() {
      _dx = maxDx;
      _dragging = false;
      _completed = true;
    });
    HapticFeedback.mediumImpact();
    widget.onCompleted();

    if (widget.resetAfterComplete) {
      await Future<void>.delayed(const Duration(milliseconds: 900));
      if (!mounted) return;
      setState(() {
        _completed = false;
        _dx = 0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final kit = Theme.of(context).extension<UiKitColors>();
    final soft = kit?.primarySoft ?? scheme.primaryContainer;
    final muted = kit?.disabled ?? scheme.onSurfaceVariant;

    final trackColor = !widget.enabled
        ? scheme.surfaceContainerHighest
        : _completed
            ? scheme.primary
            : soft;
    final labelColor = !widget.enabled
        ? muted
        : _completed
            ? scheme.onPrimary
            : scheme.primary;
    final thumbBg = !widget.enabled
        ? muted.withValues(alpha: 0.35)
        : _completed
            ? scheme.onPrimary
            : scheme.primary;
    final thumbFg = !widget.enabled
        ? muted
        : _completed
            ? scheme.primary
            : scheme.onPrimary;

    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final maxDx = (width - _thumbSize - _thumbPad * 2).clamp(0.0, width);
        final progress = maxDx <= 0 ? 0.0 : (_dx / maxDx).clamp(0.0, 1.0);

        return Semantics(
          button: true,
          enabled: widget.enabled && !_completed,
          label: widget.label,
          child: Container(
            height: widget.height,
            decoration: BoxDecoration(
              color: trackColor,
              borderRadius: AppRadius.buttonAll,
              border: Border.all(
                color: widget.enabled
                    ? scheme.primary.withValues(alpha: 0.2)
                    : scheme.outlineVariant,
              ),
            ),
            clipBehavior: Clip.antiAlias,
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Remplissage progressif sous le label.
                if (widget.enabled && !_completed)
                  Align(
                    alignment: Alignment.centerLeft,
                    child: FractionallySizedBox(
                      widthFactor: progress,
                      heightFactor: 1,
                      child: ColoredBox(
                        color: scheme.primary.withValues(alpha: 0.18),
                      ),
                    ),
                  ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: _thumbSize + AppSpacing.sm),
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 150),
                    opacity: _dragging ? (1 - progress * 0.85) : (_completed ? 1 : 1),
                    child: Text(
                      _completed
                          ? (widget.completedLabel ?? widget.label)
                          : widget.label,
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            color: labelColor,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ),
                ),
                // Chevron hint à droite.
                if (!_completed && widget.enabled)
                  Positioned(
                    right: AppSpacing.md,
                    child: Opacity(
                      opacity: (1 - progress).clamp(0.25, 0.7),
                      child: Icon(
                        LucideIcons.chevronRight,
                        size: AppSizes.iconSm,
                        color: scheme.primary,
                      ),
                    ),
                  ),
                Positioned(
                  left: _thumbPad + _dx,
                  child: GestureDetector(
                    onHorizontalDragStart: _onDragStart,
                    onHorizontalDragUpdate: (d) => _onDragUpdate(d, maxDx),
                    onHorizontalDragEnd: (_) => _onDragEnd(maxDx),
                    onHorizontalDragCancel: () {
                      if (!_completed) {
                        setState(() {
                          _dx = 0;
                          _dragging = false;
                        });
                      }
                    },
                    child: AnimatedContainer(
                      duration: _dragging
                          ? Duration.zero
                          : const Duration(milliseconds: 220),
                      curve: Curves.easeOutCubic,
                      width: _thumbSize,
                      height: _thumbSize,
                      decoration: BoxDecoration(
                        color: thumbBg,
                        shape: BoxShape.circle,
                        boxShadow: widget.enabled
                            ? [
                                BoxShadow(
                                  color: scheme.primary.withValues(alpha: 0.28),
                                  blurRadius: 10,
                                  offset: const Offset(0, 3),
                                ),
                              ]
                            : null,
                      ),
                      child: Icon(
                        _completed
                            ? (widget.successIcon ?? LucideIcons.check)
                            : (widget.thumbIcon ?? LucideIcons.chevronRight),
                        color: thumbFg,
                        size: AppSizes.iconMd,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
