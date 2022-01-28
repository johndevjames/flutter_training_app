
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_training_app/widgets/BuildTrainersList.dart';
import 'package:flutter_training_app/widgets/BuildTrainingCarosuelSlider.dart';
import 'package:flutter_training_app/widgets/BuildFilter.dart';

class TrainingsHomeScreen extends StatefulWidget {
  TrainingsHomeScreen({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _TrainingsHomeScreenState createState() => _TrainingsHomeScreenState();
}

class _TrainingsHomeScreenState extends State<TrainingsHomeScreen> {
  @override
  Widget build(BuildContext context) {
    double screenSizeHeight = MediaQuery.of(context).size.height;
    double screenSizeWidth = MediaQuery.of(context).size.width;
    CarouselController buttonCarouselController = CarouselController();
    return Scaffold(
      body: Stack(
        children: [
           CustomScrollView(
              physics: NeverScrollableScrollPhysics(),
              slivers: [
                buildSliverAppBar(screenSizeHeight),
                buildSliverFilterAdapter(screenSizeHeight, context),
                SliverToBoxAdapter(
                  child: Container(
                    height: screenSizeHeight/2,
                    child: buildTrainersList(screenSizeHeight, screenSizeWidth, context),
                  ),
                )
              ],
            ),

          buildCarousel(screenSizeWidth, screenSizeHeight, buttonCarouselController),

        ],
      ),
    );
  }

  Positioned buildCarousel(double screenSizeWidth, double screenSizeHeight, CarouselController buttonCarouselController) {
    return Positioned(
          width:screenSizeWidth ,
            top: screenSizeHeight/5.3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap:  () => buttonCarouselController.previousPage(
                      duration: Duration(milliseconds: 300), curve: Curves.linear),
                  child: Container(
                    color: Colors.black12,
                    width: screenSizeWidth/14,
                    height: screenSizeHeight/10,
                    child:Icon(Icons.arrow_back_ios,color: Colors.white,size: 15,),
                  ),
                ),
                Container(
                  width:  screenSizeWidth/1.2,
                  height: screenSizeHeight/6.5,
                  child: buildTrainingCarouselSlider(buttonCarouselController, screenSizeHeight, screenSizeWidth),
                  ),
                GestureDetector(
                  onTap:  () => buttonCarouselController.nextPage(
                      duration: Duration(milliseconds: 300), curve: Curves.linear),
                  child: Container(
                    color: Colors.black12,
                    width: screenSizeWidth/14,
                    height: screenSizeHeight/10,
                    child: Icon(Icons.arrow_forward_ios_rounded,color: Colors.white,size: 15,),
                  ),
                )
              ],
            ),
            );
  }

  SliverToBoxAdapter buildSliverFilterAdapter(double screenSizeHeight, BuildContext context) {
    return SliverToBoxAdapter(
              child:  Container(
                height: screenSizeHeight/5,
                decoration: BoxDecoration(
                    color: Colors.white),
                child: buildFilter(context,screenSizeHeight),
              ),
            );
  }

  SliverAppBar buildSliverAppBar(double screenSizeHeight) {
    return SliverAppBar(
              pinned: true,
              expandedHeight: screenSizeHeight/4,
              backgroundColor: Colors.red,
              title: Row(
                children:  [
                  Text(widget.title,),
                ],
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 0.0, 16.0, 0.0),
                  child: IconButton(
                    icon: Icon(Icons.list, size: 32.0,
                    ),
                    onPressed: () {

                    },
                  ),
                ),
              ],
            );
  }


}