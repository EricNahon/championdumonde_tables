// ignore_for_file: avoid_web_libraries_in_flutter

import 'package:flutter/material.dart';
import 'package:universal_html/html.dart' as html;

import 'translate_on_hover.dart';

extension HoverExtensions on Widget {
  static final appContainer = html.window.document.getElementById('app-container');

  Widget get showCursorOnHover {
    return MouseRegion(
      child: this,
      onHover: (event) => appContainer?.style.cursor = 'pointer',
      onExit: (event) => appContainer?.style.cursor = 'default',
    );
  }

  Widget get removeCursorOnHover {
    return MouseRegion(
      child: this,
      onHover: (event) => appContainer?.style.cursor = 'default',
      onExit: (event) => appContainer?.style.cursor = 'default',
    );
  }

  Widget get moveUpOnHover {
    return TranslateOnHover(
      child: this,
    );
  }
}
