import 'dart:async';

import 'package:flutter/material.dart';

/// Extension on [BuildContext] to provide utility methods for accessing media query information,
/// text styles, colors, and showing bottom sheets and snack bars.
extension BuildContextEntension<T> on BuildContext {
  // * Core
  /// Returns a [VoidCallback] that pops the current route off the navigator.
  VoidCallback get burn => () => Navigator.pop(this);

  // * Dimensions
  /// Returns true if the device is considered mobile (small width).
  bool get isMobile => MediaQuery.of(this).size.width <= 500.0;

  /// Returns true if the device is considered a tablet (medium width).
  bool get isTablet =>
      MediaQuery.of(this).size.width < 1024.0 &&
      MediaQuery.of(this).size.width >= 650.0;

  /// Returns true if the device is considered a small tablet (between mobile and tablet size).
  bool get isSmallTablet =>
      MediaQuery.of(this).size.width < 650.0 &&
      MediaQuery.of(this).size.width > 500.0;

  /// Returns true if the device is considered desktop (large width).
  bool get isDesktop => MediaQuery.of(this).size.width >= 1024.0;

  /// Returns true if the device has a small width (between mobile and desktop size).
  bool get isSmall =>
      MediaQuery.of(this).size.width < 850.0 &&
      MediaQuery.of(this).size.width >= 560.0;

  /// Returns the width of the media (screen or window).
  double get width => MediaQuery.of(this).size.width;

  /// Returns the height of the media (screen or window).
  double get height => MediaQuery.of(this).size.height;

  /// Returns the size of the media (screen or window).
  Size get size => MediaQuery.of(this).size;

  // * Text styles
  TextStyle? get displayLarge => Theme.of(this).textTheme.displayLarge;

  TextStyle? get displayMedium => Theme.of(this).textTheme.displayMedium;

  TextStyle? get displaySmall => Theme.of(this).textTheme.displaySmall;

  TextStyle? get headlineLarge => Theme.of(this).textTheme.headlineLarge;

  TextStyle? get headlineMedium => Theme.of(this).textTheme.headlineMedium;

  TextStyle? get headlineSmall => Theme.of(this).textTheme.headlineSmall;

  TextStyle? get titleLarge => Theme.of(this).textTheme.titleLarge;

  TextStyle? get titleMedium => Theme.of(this).textTheme.titleMedium;

  TextStyle? get titleSmall => Theme.of(this).textTheme.titleSmall;

  TextStyle? get bodyLarge => Theme.of(this).textTheme.bodyLarge;

  TextStyle? get bodyMedium => Theme.of(this).textTheme.bodyMedium;

  TextStyle? get bodySmall => Theme.of(this).textTheme.bodySmall;

  TextStyle? get labelLarge => Theme.of(this).textTheme.labelLarge;

  TextStyle? get labelMedium => Theme.of(this).textTheme.labelMedium;

  TextStyle? get labelSmall => Theme.of(this).textTheme.labelSmall;

  TextStyle? get labelSmallDisabled => this.labelSmall?.copyWith(
        color: this.disabledColor,
      );

  // * Colors
  Color get primaryColorDark => Theme.of(this).primaryColorDark;

  Color get primaryColorLight => Theme.of(this).primaryColorLight;

  Color get primary => Theme.of(this).colorScheme.primary;

  Color get onPrimary => Theme.of(this).colorScheme.onPrimary;

  Color get secondary => Theme.of(this).colorScheme.secondary;

  Color get onSecondary => Theme.of(this).colorScheme.onSecondary;

  Color get tertiary => Theme.of(this).colorScheme.tertiary;

  Color get onTertiary => Theme.of(this).colorScheme.onTertiary;

  Color get canvasColor => Theme.of(this).canvasColor;

  Color get cardColor => Theme.of(this).cardColor;

  Color get disabledColor => Theme.of(this).disabledColor;

  Color get focusColor => Theme.of(this).focusColor;

  Color get highlightColor => Theme.of(this).highlightColor;

  Color get hintColor => Theme.of(this).hintColor;

  Color get indicatorColor => Theme.of(this).indicatorColor;

  Color get errorColor => Theme.of(this).colorScheme.error;

  Color get background => Theme.of(this).colorScheme.surface;

  Color get unselectedWidgetColor => Theme.of(this).unselectedWidgetColor;

  // * Check if theme is dark
  bool get isDark => Theme.of(this).brightness == Brightness.dark;

  /// Shows a snack bar with the given [message].
  /// Additional customization options are available via named parameters.
  // ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackBar(
  //   String? message, {
  //   bool showAction = false,
  //   VoidCallback? onPressed,
  //   bool isSuccessful = false,
  // }) {
  //   message ??= l10n.kUnknownError;
  //   final mediaQueryData = MediaQuery.of(this);
  //   ScaffoldMessenger.of(this).clearSnackBars();
  //   return ScaffoldMessenger.of(this).showSnackBar(
  //     SnackBar(
  //       elevation: 4,
  //       showCloseIcon: true,
  //       behavior: SnackBarBehavior.floating,
  //       margin: 16.paddingAll,
  //       padding: EdgeInsets.only(
  //         bottom: mediaQueryData.viewInsets.bottom,
  //       ),
  //       content: Center(
  //         child: Padding(
  //           padding: const EdgeInsets.all(8.0),
  //           child: Row(
  //             children: [
  //               Icon(
  //                 isSuccessful
  //                     ? Icons.done_rounded
  //                     : Icons.warning_amber_rounded,
  //                 color: isSuccessful ? kClrGreen : kClrRed,
  //               ),
  //               16.widthBox,
  //               Flexible(
  //                 child: Text(
  //                   message,
  //                   maxLines: 2,
  //                   overflow: TextOverflow.ellipsis,
  //                   style: TextStyle(
  //                     fontWeight: FontWeight.w500,
  //                   ),
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //       ),
  //       action: showAction
  //           ? SnackBarAction(
  //               label: "Go",
  //               onPressed: onPressed ?? () {},
  //             )
  //           : null,
  //     ),
  //   );
  // }
}
