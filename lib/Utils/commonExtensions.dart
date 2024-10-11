import 'package:flutter/material.dart';

extension ListWidgetExtension on List<Widget> {
  get removeNullWidgets {
    if (this != null) {
      return  this.where((child) => child != null).toList() ;
    } else {
      return <Widget>[];
    }
  }
}