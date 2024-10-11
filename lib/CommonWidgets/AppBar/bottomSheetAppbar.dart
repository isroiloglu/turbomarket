
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

AppBar commonToolBar(String heading, BuildContext context,
    { bool isElevated = true, bool isLeadingEnable = false}) {
  return AppBar(
    leading: isLeadingEnable ? IconButton(onPressed: (){Navigator.pop(context);}, icon: const Icon(Icons.clear)) : null,
    elevation: isElevated ? null : 0,
    title: Row(
      children: [
        Text(
          heading,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
      ],
    ),
  );
}
