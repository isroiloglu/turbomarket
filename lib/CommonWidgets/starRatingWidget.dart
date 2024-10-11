import 'package:flutter/material.dart';

typedef RatingChangeCallback = void Function(double rating);

class StarRating extends StatefulWidget {
  final int starCount;
  double? rating;
  final RatingChangeCallback onRatingChanged;
  final double size;
  bool enable;

  StarRating(
      {this.starCount = 5,
      this.rating = .0,
      required this.onRatingChanged,
      required this.size,
      this.enable = true});

  @override
  State<StarRating> createState() => _StarRatingState();
}

class _StarRatingState extends State<StarRating> {
  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: List.generate(
            widget.starCount, (index) => buildStar(context, index)));
  }

  Widget buildStar(BuildContext context, int index) {
    Icon icon;
    if (index >= widget.rating!) {
      icon = Icon(
        Icons.star,
        size: widget.size,
        color: Colors.grey.shade300,
      );
    } else if (index > widget.rating! - 1 && index < widget.rating!) {
      icon = Icon(
        Icons.star_half,
        color: const Color(0xCC677294),
        size: widget.size,
      );
    } else {
      icon = Icon(
        Icons.star,
        color: const Color(0xCC677294),
        size: widget.size,
      );
    }
    return InkResponse(
      onTap: widget.enable
          ? () => setState(() {
                widget.rating = index + 1.0;
                widget.onRatingChanged(index + 1.0);
              })
          : null,
      child: icon,
    );
  }
}
