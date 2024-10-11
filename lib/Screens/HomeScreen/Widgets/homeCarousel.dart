import 'dart:async';
import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:swipe_cards/swipe_cards.dart';
import 'package:swipeable_card_stack/swipeable_card_stack.dart';
import 'package:world_miral_cs_cart_multivendor_flutter_app/Helper/imageView.dart';

import '../../../Constants/appConstants.dart';
import '../../../Constants/arguments_map.dart';
import '../../../Constants/routeConstant.dart';
import '../../../Models/HomePageModels/banners.dart';

class HomeCarousel extends StatefulWidget {
  List<Banners> banners;

  HomeCarousel(this.banners, {super.key});

  @override
  _HomeCarouselState createState() => _HomeCarouselState();
}

class _HomeCarouselState extends State<HomeCarousel> {
  @override
  void dispose() {
    super.dispose();
  }

  int _currentPage = 1;
  late Timer _timer;
  final PageController _pageController =
      PageController(viewportFraction: 0.836, initialPage: 1);

  int counter = 4;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      int pos = _pageController.page!.round();
      if (_currentPage != pos) {
        {
          setState(() {
            _currentPage = pos;
          });
        }
      }
    });
    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (mounted) {
        _pageController.nextPage(
          duration: const Duration(milliseconds: 350),
          curve: Curves.easeIn,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    log('LENGTH IS ${widget.banners.length}');
    //create a CardController
    SwipeableCardSectionController _cardController =
        SwipeableCardSectionController();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: 179,
          child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemBuilder: (context, index) {
                bool active = index == _currentPage;
                return GestureDetector(
                  onTap: () {
                    if (widget.banners[index % widget.banners.length].id ==
                            "0" ||
                        widget.banners[index % widget.banners.length].id
                                ?.isEmpty ==
                            true) {
                      return;
                    }
                    if (widget.banners[index % widget.banners.length].type ==
                        "P") {
                      Navigator.pushNamed(context, productDetailPage,
                          arguments: widget
                                  .banners[index % widget.banners.length].id ??
                              "");
                    } else if (widget
                            .banners[index % widget.banners.length].type ==
                        "C") {
                      Navigator.pushNamed(context, catalogPage,
                          arguments: getCatalogMap(
                              widget.banners[index % widget.banners.length]
                                      .id ??
                                  "",
                              "",
                              widget.banners[index % widget.banners.length]
                                      .name ??
                                  "",
                              false));
                    }
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: AppSizes.linePadding),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Theme.of(context).dividerColor.withOpacity(0.07),
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: ClipRRect(
                      borderRadius:
                          BorderRadius.circular(AppSizes.mediumPadding / 2),
                      child: ImageView(
                        url: widget
                            .banners[index % widget.banners.length].imagePath,
                        // height: AppSizes.width / 2,
                        // width: AppSizes.width/ 0.9,
                        fit: BoxFit.fill,
                        isBanner: true,
                      ),
                    ),
                  ),
                );
              }),
        ),
        // Container(
        //   height: AppSizes.height * 0.193,
        //   alignment: Alignment.center,
        //   child: SwipeCards(
        //     matchEngine: MatchEngine(
        //       swipeItems: List.generate(
        //         widget.banners.length,
        //         (index) => SwipeItem(
        //           content: const Text('1'),
        //         ),
        //       ),
        //     ),
        //     onStackFinished: () {},
        //     itemBuilder: (context, index) {
        //       return GestureDetector(
        //         onTap: () {
        //           if (widget.banners[index].id == "0" ||
        //               widget.banners[index].id?.isEmpty == true) {
        //             return;
        //           }
        //           if (widget.banners[index].type == "P") {
        //             Navigator.pushNamed(context, productDetailPage,
        //                 arguments: widget.banners[index].id ?? "");
        //           } else if (widget.banners[index].type == "C") {
        //             Navigator.pushNamed(context, catalogPage,
        //                 arguments: getCatalogMap(widget.banners[index].id ?? "",
        //                     "", widget.banners[index].name ?? "", false));
        //           }
        //         },
        //         child: Container(
        //           margin: const EdgeInsets.symmetric(
        //               horizontal: AppSizes.linePadding),
        //           decoration: BoxDecoration(
        //               border: Border.all(
        //                   color:
        //                       Theme.of(context).dividerColor.withOpacity(0.07)),
        //               borderRadius: const BorderRadius.all(
        //                   Radius.circular(AppSizes.mediumPadding / 2))),
        //           child: ClipRRect(
        //             borderRadius:
        //                 BorderRadius.circular(AppSizes.mediumPadding / 2),
        //             child: ImageView(
        //               url: widget.banners[index].imagePath,
        //               // height: AppSizes.width / 2,
        //               // width: AppSizes.width/ 0.9,
        //               fit: BoxFit.fill,
        //               isBanner: true,
        //             ),
        //           ),
        //         ),
        //       );
        //     },
        //   ),
        // )
      ],
    );
  }
}

class CardView extends StatelessWidget {
  const CardView({
    Key? key,
    this.text = "Card View",
  }) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Stack(
        children: <Widget>[
          SizedBox.expand(
            child: Material(
              borderRadius: BorderRadius.circular(12.0),
              child: Container(
                color: Colors.blueAccent,
              ),
            ),
          ),
          SizedBox.expand(
            child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.transparent, Colors.black54],
                      begin: Alignment.center,
                      end: Alignment.bottomCenter)),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
                padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(text,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w700)),
                    Padding(padding: EdgeInsets.only(bottom: 8.0)),
                    Text("$text details",
                        textAlign: TextAlign.start,
                        style: TextStyle(color: Colors.white)),
                  ],
                )),
          )
        ],
      ),
    );
  }
}
