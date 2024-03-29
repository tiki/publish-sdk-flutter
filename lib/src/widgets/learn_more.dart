/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

/// {@category UI}
import 'package:flutter/material.dart';

import '../../tiki_sdk.dart';
import 'markdown.dart';
import 'navigation_header.dart';

class LearnMore extends StatelessWidget {
  final String text;

  late final Color? textColor;
  late final Color? backgroundColor;
  late final String? fontFamily;
  late final String? fontPackage;

  LearnMore(this.text, {
    Color? textColor,
    Color? backgroundColor,
    String? fontFamily,
    String? fontPackage
  }) {
    this.textColor = textColor ?? TikiSdk.instance.activeTheme.getPrimaryTextColor;
    this.backgroundColor = backgroundColor ??
        TikiSdk.instance.activeTheme.getPrimaryBackgroundColor;
    this.fontFamily = fontFamily ?? TikiSdk.instance.activeTheme.getFontFamily;
    this.fontPackage = fontPackage ?? TikiSdk.instance.activeTheme.getFontPackage;
  }

  @override
  Widget build(BuildContext context) => WillPopScope(
      onWillPop: () {
        Navigator.of(context).pop(false);
        return Future.value(false);
      },
      child: Scaffold(
          appBar: NavigationHeader("Learn More", context).appBar,
          body: SafeArea(
            child: MarkdownViewer(text),
          )));
}
