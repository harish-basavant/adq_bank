import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants.dart';

class CarouselWithInvoices extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CarouselWithInvoicesState();
  }
}

final List<String> imgList = [
  '67.62',
  '985.22',
  '32.52',
];

final List<Widget> imageSliders = imgList
    .map((item) => Container(
          child: Container(
            // margin: EdgeInsets.all(5.0),
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                child: Stack(
                  children: <Widget>[
                    // Image.network(item, fit: BoxFit.cover, width: 1000.0),
                    Container(
                      height: 190.0,
                      width: 300.0,
                      padding: EdgeInsets.all(10),
                      color: kInactiveCardColour,
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            item,
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: kActiveCardColour),
                          ),
                          SizedBox(
                            height: 28,
                          ),
                          // Icon(Icons.car_rental,
                          //     size: 40, color: kActiveCardColour),
                          Row(
                            children: <Widget>[
                              Text(
                                "Completed",
                                style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: kActiveCardColour),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Icon(FontAwesomeIcons.arrowRight,
                                  size: 20, color: kActiveCardColour),
                            ],
                          ),
                        ],
                      ),
                    ),

                    Positioned(
                      bottom: 0.0,
                      left: 0.0,
                      right: 0.0,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(200, 0, 0, 0),
                              Color.fromARGB(0, 0, 0, 0)
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                        // padding: EdgeInsets.symmetric(
                        //     vertical: 10.0, horizontal: 20.0),
                        // child: Text(
                        //   'No. ${imgList.indexOf(item)} image',
                        //   style: TextStyle(
                        //     color: Colors.white,
                        //     fontSize: 20.0,
                        //     fontWeight: FontWeight.bold,
                        //   ),
                        // ),
                      ),
                    ),
                  ],
                )),
          ),
        ))
    .toList();

class _CarouselWithInvoicesState extends State<CarouselWithInvoices> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          "Invoices",
          style: TextStyle(fontSize: 25, color: kActiveCardColour),
        ),
        SizedBox(
          height: 30,
        ),
        Expanded(
          child: CarouselSlider(
            items: imageSliders,
            carouselController: _controller,
            options: CarouselOptions(
                autoPlay: false,
                enlargeCenterPage: true,
                aspectRatio: 2.0,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                }),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: imgList.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(entry.key),
              child: Container(
                width: 12.0,
                height: 10.0,
                margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black)
                        .withOpacity(_current == entry.key ? 0.9 : 0.4)),
              ),
            );
          }).toList(),
        ),
      ]),
    );
  }
}
