import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Config/theme.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Constants/appConstants.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Helper/genericMethods.dart';

class HorizontalCustomStepper extends StatelessWidget {
  final List<String> _titles;
  final List<String> activeImages;
  final List<String> inactiveImages;
  final int _curStep;
  final Color _activeColor;
  final Color _inactiveColor = const Color(0xFF7F7F80);

  const HorizontalCustomStepper(
      {super.key,
      required int curStep,
      required List<String> titles,
      required Color color,
      required this.activeImages,
      required this.inactiveImages})
      : _titles = titles,
        _curStep = curStep,
        _activeColor = color;

  @override
  Widget build(BuildContext context) {
    log('TITLES IS ${_titles.last}');
    return Padding(
        padding: const EdgeInsets.all(AppSizes.extraPadding),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: _titles
              .map((e) => Container(
                    width: ((AppSizes.width - 32) / 3) - 2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft:
                            Radius.circular(_titles.indexOf(e) == 0 ? 12 : 0),
                        topLeft:
                            Radius.circular(_titles.indexOf(e) == 0 ? 12 : 0),
                        topRight: Radius.circular(_titles.last == e ? 12 : 0),
                        bottomRight:
                            Radius.circular(_titles.last == e ? 12 : 0),
                      ),
                      color: (_curStep == _titles.indexOf(e))
                          ? MobikulTheme.clientPrimaryColor
                          : AppColors.white,
                    ),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: AppSizes.extraPadding,
                          vertical: AppSizes.mediumPadding),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft:
                              Radius.circular(_titles.indexOf(e) == 0 ? 12 : 0),
                          topRight: Radius.circular(_titles.last == e ? 12 : 0),
                          bottomLeft:
                              Radius.circular(_titles.indexOf(e) == 0 ? 12 : 0),
                          bottomRight:
                              Radius.circular(_titles.last == e ? 12 : 0),
                        ),
                        color: AppColors.white,
                      ),
                      margin: const EdgeInsets.only(bottom: 2),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 30.0,
                            height: 30.0,
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child:
                                  Image.asset(activeImages[_titles.indexOf(e)]),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(GenericMethods.getStringValue(context, e),
                              style: TextStyle(
                                  color: _activeColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                  fontFamily: 'SF-Pro-Display')),
                        ],
                      ),
                    ),
                  ))
              .toList(),
        ));
  }

  List<Widget> _iconViews() {
    var list = <Widget>[];
    activeImages.asMap().forEach((i, icon) {
      var lineColor = _curStep > i ? _activeColor : _inactiveColor;

      list.add(
        SizedBox(
          width: 30.0,
          height: 30.0,
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Image.asset(
              (_curStep == i) ? activeImages[i] : inactiveImages[i],
            ),
          ),
        ),
      );
      if (i != _titles.length - 1) {
        list.add(Expanded(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 1.0,
            color: lineColor,
          ),
        )));
      }
    });

    return list;
  }

  List<Widget> _titleViews(BuildContext context) {
    var list = <Widget>[];
    _titles.asMap().forEach((i, text) {
      list.add(Text(GenericMethods.getStringValue(context, text),
          style: TextStyle(
              color: (_curStep == i) ? _activeColor : _inactiveColor)));
    });
    return list;
  }
}
