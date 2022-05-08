import 'package:flutter/material.dart';
import '../r_type_define.dart';

class SponRatingWidget extends StatefulWidget {
  /// star number
  final int count;

  /// Max score
  final double maxRating;

  /// Current score value
  final double value;

  /// Star size
  final double size;

  /// Space between the stars
  final double padding;

  /// empty star image assets url
  final String nomalImage;

  /// full star image assets url
  final String selectImage;

  /// Whether the score can be modified by sliding
  final bool selectAble;

  /// Callbacks when ratings change
  final ValueChanged<String> onRatingUpdate;

  SponRatingWidget(
      {this.maxRating = 10.0,
        this.count = 5,
        this.value = 10.0,
        this.size = 20,
        required this.nomalImage,
        required this.selectImage,
        required this.padding,
        this.selectAble = false,
        required this.onRatingUpdate})
      : assert(nomalImage != null),
        assert(selectImage != null);

  @override
  _SponRatingWidgetState createState() => _SponRatingWidgetState();
}

class _SponRatingWidgetState extends State<SponRatingWidget> {
  var locationCount = 0.0.obs;

  @override
  Widget build(BuildContext context) {
    return RWidget(() => Listener(
      child: buildRowRating(),
      onPointerDown: (PointerDownEvent event) {
        double x = event.localPosition.dx;
        if (x < 0) x = 0;
        pointValue(x);
      },
      onPointerMove: (PointerMoveEvent event) {
        double x = event.localPosition.dx;
        if (x < 0) x = 0;
        pointValue(x);
      },
      onPointerUp: (_) {},
      behavior: HitTestBehavior.deferToChild,
    ),
    );
  }

  pointValue(double dx) {
    if (!widget.selectAble) {
      return;
    }
    if (dx >=
        widget.size * widget.count + widget.padding * (widget.count - 1)) {
      locationCount.value = widget.maxRating;
    } else {
      for (double i = 1; i < widget.count + 1; i++) {
        if (dx > widget.size * i + widget.padding * (i - 1) &&
            dx < widget.size * i + widget.padding * i) {
          locationCount.value = i * (widget.maxRating / widget.count);
          break;
        } else if (dx > widget.size * (i - 1) + widget.padding * (i - 1) &&
            dx < widget.size * i + widget.padding * i) {
          locationCount.value = (dx - widget.padding * (i - 1)) /
              (widget.size * widget.count) *
              widget.maxRating;
          break;
        }
      }
    }
    widget.onRatingUpdate(locationCount.value.toStringAsFixed(1));
  }

  int fullStars() {
    if (locationCount.value != null) {
      return (locationCount.value / (widget.maxRating / widget.count)).floor();
    }
    return 0;
  }

  double star() {
    if (locationCount.value != null) {
      if (widget.count / fullStars() == widget.maxRating / locationCount.value) {
        return 0;
      }
      return (locationCount.value % (widget.maxRating / widget.count)) /
          (widget.maxRating / widget.count);
    }
    return 0;
  }

  List<Widget> buildRow() {
    int full = fullStars();
    List<Widget> children = [];
    for (int i = 0; i < full; i++) {
      children.add(Image.asset(
        widget.selectImage,
        height: widget.size,
        width: widget.size,
      ));
      if (i < widget.count - 1) {
        children.add(
          SizedBox(
            width: widget.padding,
          ),
        );
      }
    }
    if (full < widget.count) {
      children.add(ClipRect(
        clipper: SMClipper(rating: star() * widget.size),
        child: Image.asset(widget.selectImage,
            height: widget.size, width: widget.size),
      ));
    }

    return children;
  }

  List<Widget> buildNomalRow() {
    List<Widget> children = [];
    for (int i = 0; i < widget.count; i++) {
      children.add(Image.asset(
        widget.nomalImage,
        height: widget.size,
        width: widget.size,
      ));
      if (i < widget.count - 1) {
        children.add(SizedBox(
          width: widget.padding,
        ));
      }
    }
    return children;
  }

  Widget buildRowRating() {
    return Container(
      child: Stack(
        children: <Widget>[
          Row(
            children: buildNomalRow(),
          ),
          Row(
            children: buildRow(),
          )
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    locationCount.value = widget.value;
  }
}

class SMClipper extends CustomClipper<Rect> {
  final double rating;
  SMClipper({required this.rating}) : assert(rating != null);
  @override
  Rect getClip(Size size) {
    return Rect.fromLTRB(0.0, 0.0, rating, size.height);
  }

  @override
  bool shouldReclip(SMClipper oldClipper) {
    return rating != oldClipper.rating;
  }
}
