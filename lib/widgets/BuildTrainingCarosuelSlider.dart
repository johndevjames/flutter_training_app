import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

CarouselSlider buildTrainingCarouselSlider(CarouselController buttonCarouselController, double screenSizeHeight, double screenSizeWidth) {
  return CarouselSlider(
    carouselController: buttonCarouselController,
    options: CarouselOptions(
        height: screenSizeHeight/6.5,
        autoPlay: false,
        enlargeCenterPage: false,
        viewportFraction: 2,
        initialPage: 0,
        enableInfiniteScroll: false
    ),
    items: [1,2,3,4,5].map((i) {
      return Builder(
        builder: (BuildContext context) {
          return Container(
            width: screenSizeWidth/1.2,
            decoration: BoxDecoration(
                image: DecorationImage(
                  colorFilter: ColorFilter.mode(
                      Colors.black54.withOpacity(0.3), BlendMode.darken),
                    image: AssetImage('images/bannerImage.jpg'),
                    fit: BoxFit.cover
                )
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Safe Scrum Master(4.6)',
                          style: Theme.of(context)
                              .textTheme
                              .headline6!.copyWith(color: Colors.white)),
                      Text('West Des Moines,IA - 30 Oct - 31 Oct',
                          textAlign: TextAlign.left,
                          style: Theme.of(context).textTheme.subtitle2!.copyWith(fontWeight: FontWeight.w400,color: Colors.white)),
                    ],
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('\$975',
                              style: TextStyle(
                                  color: Colors.red,
                                decorationColor: Colors.red,
                                decorationStyle: TextDecorationStyle.double,
                                decoration: TextDecoration.lineThrough,
                                fontSize: 11,fontWeight: FontWeight.w700)),
                          Padding(
                            padding: const EdgeInsets.only(left: 3.0),
                            child: Text('\$825',
                                style: TextStyle(
                                  color: Colors.red,
                                  decorationColor: Colors.red,
                                  decorationStyle: TextDecorationStyle.double,
                                  decoration: TextDecoration.none,
                                  fontSize: 15,)),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('View Details ➝',
                          textAlign: TextAlign.left,
                          style: Theme.of(context).textTheme.subtitle1!.copyWith(fontSize: 12,color: Colors.white)),
                    ),
                  ],
                ),

              ],
            ),
          );
        },
      );
    }).toList(),
  );
}
