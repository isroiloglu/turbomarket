import 'package:flutter/cupertino.dart';

Widget ignorePointer({required bool ignoring, required Widget child}){
  return IgnorePointer(
    ignoring: ignoring,
    child: child,
  );
}