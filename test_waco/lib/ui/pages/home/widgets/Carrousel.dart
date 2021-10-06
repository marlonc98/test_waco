import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:test_waco/ui/utils/Constants.dart';

typedef VoidCallback OnPageChange(int page);

class Carrousel extends StatefulWidget {
  List<Widget> items;
  bool autoplay, showName;
  double heigth;
  Function(int)? onPageChange;
  Carrousel(
      {Key? key,
      this.onPageChange,
      this.autoplay: true,
      this.showName: false,
      this.heigth: 200,
      required this.items})
      : super(key: key);
  @override
  _CarrouselState createState() => _CarrouselState();
}

class _CarrouselState extends State<Carrousel> {
  CarouselController buttonCarouselController = CarouselController();
  int _actualCarrousel = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: <Widget>[
        Container(
            padding: EdgeInsets.only(bottom: 30.0),
            child: Row(
              children: [
                IconButton(
                    onPressed: () => buttonCarouselController.previousPage(duration: Duration(milliseconds: 300), curve: Curves.linear),
                    icon: Image.asset(
                      'assets/arrow_left.png',
                    )),
                Expanded(
                  child: CarouselSlider(
                    carouselController: buttonCarouselController,
                    options: CarouselOptions(
                      height: widget.heigth,
                      viewportFraction: 1.0,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      aspectRatio: 16 / 9,
                      autoPlay: widget.autoplay,
                      autoPlayInterval: Duration(seconds: 7),
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      enlargeCenterPage: false,
                      onPageChanged: (value, reason){
                        setState(() {
                          _actualCarrousel=value;
                        });
                      }
                    ),
                    items: widget.items,
                  ),
                ),
                IconButton(
                    onPressed: () => buttonCarouselController.nextPage(
                      duration: Duration(milliseconds: 300), curve: Curves.linear),
                    icon: Image.asset(
                      'assets/arrow_right.png',
                    ))
              ],
            )),
        widget.items.length > 0 ? dotsMenu() : Container(),
      ],
    );
  }

  Positioned dotsMenu() {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child:
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
        for (var i = 0; i < widget.items.length; i++)
          Container(
            width: 12.0,
            height: 12.0,
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
            decoration: BoxDecoration(
                borderRadius: new BorderRadius.circular(25.0),
                color: _actualCarrousel == i ? kMainColor : Color(0x44FFFFFF)),
          )
      ]),
    );
  }

  Positioned menuContruct() {
    return Positioned(
      bottom: 0.0,
      left: 0.0,
      right: 0.0,
      child: Container(
        decoration: BoxDecoration(color: kMainColor),
        padding: const EdgeInsets.all(20.0),
        child: Text(
          "Construct Home",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: kMainColorDark, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
