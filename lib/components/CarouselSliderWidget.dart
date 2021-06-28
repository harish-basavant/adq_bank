import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

class CarouselSliderWidget extends StatefulWidget {
  const CarouselSliderWidget({Key key}) : super(key: key);

  @override
  _CarouselSliderWidgetState createState() => _CarouselSliderWidgetState();
}

class _CarouselSliderWidgetState extends State<CarouselSliderWidget> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    List<int> list = [1, 2, 3, 4, 5];
    List<Widget> _cards = list
        .map((item) => Container(
              child: Text(item.toString()),
              color: Colors.green,
            ))
        .toList();

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        CarouselSlider(
          items: _cards
              .asMap()
              .map((i, value) {
                return MapEntry(i, Builder(
                  builder: (BuildContext context) {
                    return value;
                  },
                ));
              })
              .values
              .toList(),
        ),
        new DotsIndicator(
          dotsCount: _cards.length,
          position: _current.toDouble(),
          decorator: DotsDecorator(
            activeColor: Color(0xff15665a),
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
          ),
        )
      ],
    );
  }
}
