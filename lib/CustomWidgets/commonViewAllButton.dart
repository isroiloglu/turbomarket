import 'package:flutter/material.dart';

Widget viewAllButton(BuildContext context, VoidCallback onPressed,
    String text,){
  return OutlinedButton(
    child: Text(text, style:Theme.of(context).textTheme.labelSmall,),
    onPressed: onPressed,
  );
}