import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Config/theme.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Constants/appConstants.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Constants/appStringConstants.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Helper/genericMethods.dart';

class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar(
      {Key? key,
      required this.controller,
      required this.onTap,
      required this.onChanged,
      this.onWidgetTap,
      this.autofocus = false,
      this.width})
      : super(key: key);
  final TextEditingController controller;
  final VoidCallback onTap;
  final bool autofocus;
  final double? width;
  final VoidCallback? onWidgetTap;
  final Function(String query) onChanged;

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width ?? double.infinity,
      height: 48,
      padding: const EdgeInsets.all(12),
      decoration: ShapeDecoration(
        color: AppColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            'assets/Images/search-normal.png',
            width: 20,
            height: 20,
          ),
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: widget.onWidgetTap ?? () {},
            child: Container(
              width: 160,
              height: 48,
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                controller: widget.controller,
                onChanged: widget.onChanged,
                style: const TextStyle(
                    fontFamily: 'Gilroy',
                    color: AppColors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
                enabled: widget.onWidgetTap != null ? false : true,
                autofocus: widget.autofocus,
                decoration: InputDecoration(
                  focusColor: AppColors.background,
                  focusedBorder: InputBorder.none,
                  contentPadding: const EdgeInsets.only(bottom: 9),
                  border: InputBorder.none,
                  filled: true,
                  fillColor: AppColors.white,
                  hintText: GenericMethods.getStringValue(
                      context, AppStringConstant.search),
                  hintStyle: const TextStyle(
                      fontFamily: 'Gilroy',
                      color: AppColors.lightGray,
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              widget.controller.text.isNotEmpty
                  ? GestureDetector(
                      onTap: () {
                        setState(() {
                          widget.controller.clear();
                        });
                      },
                      child: const SizedBox(
                        height: 20,
                        width: 30,
                        child: Icon(
                          CupertinoIcons.clear_circled,
                          color: MobikulTheme.clientPrimaryColorA,
                        ),
                      ),
                    )
                  : SizedBox(
                      height: 20,
                      width: 20,
                    ),
              const VerticalDivider(
                thickness: 1,
              ),
              GestureDetector(
                onTap: widget.onTap,
                child: Image.asset(
                  'assets/Images/mask.png',
                  color: AppColors.darkGray,
                  height: 20,
                  width: 20,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class CustomSearch extends StatelessWidget {
  const CustomSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 48,
      padding: const EdgeInsets.all(12),
      decoration: ShapeDecoration(
        color: AppColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Image.asset(
                'assets/Images/search-normal.png',
                width: 20,
                height: 20,
              ),
              const SizedBox(width: 10),
              SizedBox(
                width: 252,
                child: Text(
                  '${GenericMethods.getStringValue(context, AppStringConstant.search)}..',
                  style: const TextStyle(
                    color: Color(0xFF677294),
                    fontSize: 16,
                    fontFamily: 'Gilroy',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              const VerticalDivider(
                thickness: 1,
              ),
              Image.asset(
                'assets/Images/mask.png',
                color: AppColors.darkGray,
                height: 20,
                width: 20,
              ),
            ],
          )
        ],
      ),
    );
  }
}
