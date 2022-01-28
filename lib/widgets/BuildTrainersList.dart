import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_training_app/models/TrainerFilterModel.dart';
import 'package:flutter_training_app/models/TrainersModel.dart';
import 'package:provider/provider.dart';
ListView buildTrainersList(double screenSizeHeight, double screenSizeWidth, BuildContext context) {
  var trainersDetails = context.watch<TrainersModel>().items;
  var trainersList = context.select<TrainerFilter, List>((checkList) => checkList.trainersList);
  bool defaults = false;
  if(trainersDetails.isNotEmpty){
    defaults = false;
  }else{
    defaults = true;
  }
  return ListView.builder(
    itemCount: defaults? trainersList.length:trainersDetails.length,
    itemBuilder: (context, index) {
      return GestureDetector(
        child:Padding(
          padding: const EdgeInsets.only(left: 10.0,right: 10.0),
          child: Container(
            margin: EdgeInsets.only(bottom: 10.0),
            height: screenSizeHeight/5,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Row(
                children: [
                  Column(
                      children: [
                        Container(
                          width: screenSizeWidth/2.6,
                          height: screenSizeHeight/5.1,
                          margin: EdgeInsets.only(top: 1.0),
                          decoration: BoxDecoration(),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('Oct 11 -13,',
                                            textAlign: TextAlign.left,
                                            style: Theme.of(context).textTheme.headline6!.copyWith(fontSize: 16,fontWeight: FontWeight.w900)),
                                        Text('2019',
                                            textAlign: TextAlign.left,
                                            style: Theme.of(context).textTheme.headline6!.copyWith(fontSize: 16,fontWeight: FontWeight.w900)),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text('8:30 am - 13:30 pm',
                                        textAlign: TextAlign.left,
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle2!.copyWith(fontSize: 11)),
                                  ),
                                ],
                              ),
                              Container(
                                margin: EdgeInsets.all(1),
                                width: screenSizeWidth/3,
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Convention Hall',
                                        textAlign: TextAlign.left,
                                        style: Theme.of(context).textTheme.subtitle2!.copyWith(fontSize: 10,fontWeight: FontWeight.w900)),
                                    defaults? Text(trainersList[index].trainerLocation,
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle2!.copyWith(fontSize: 10,fontWeight: FontWeight.w900))
                                        :Text(trainersDetails[index].trainerLocation,
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle2!.copyWith(fontSize: 10,fontWeight: FontWeight.w900)),

                                  ],
                                ),
                              ),

                            ],
                          ),
                        )
                      ]),
                  VerticalDivider(thickness: 1,indent:9.9 ,endIndent: 9.9,),
                  Container(
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,

                                children: [
                                  Text('Filling Fast!',
                                      textAlign: TextAlign.left,
                                      style: Theme.of(context).textTheme
                                          .subtitle2!.copyWith(color: Colors.red,fontSize: 12,fontWeight: FontWeight.w900)),
                                  Text('Safe Scrum Master(4.6)',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline6!.copyWith(fontSize: 17,fontWeight: FontWeight.w900)),

                                ],
                              ),
                            ),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width:  40,
                                      height: 40,
                                      child: ClipRRect(
                                          borderRadius: BorderRadius.circular(50),
                                          child: Image(image: AssetImage('images/roundImage.jpg'))
                                      ),
                                    ),
                                    // Positioned(
                                    //   top: 95,
                                    //   left: 80,
                                    //   child: Container(
                                    //     width: 90,
                                    //     height: 90,
                                    //     padding: EdgeInsets.all(5),
                                    //     decoration: BoxDecoration(
                                    //         color: Theme.of(context).backgroundColor,
                                    //         borderRadius: BorderRadius.circular(30)),
                                    //     child: Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRbrvOZf5zaHg_9a8upGltfVtObFu_0QH1rcw&usqp=CAU')
                                    //   ),
                                    // ),

                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('Keynote Speaker',
                                            textAlign: TextAlign.left,
                                            style: Theme.of(context).textTheme.subtitle2!.copyWith(fontSize: 11,fontWeight: FontWeight.w900)),
                                        defaults? Text(trainersList[index].trainerName,
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline6!.copyWith(fontSize: 11,))
                                            :Text(trainersDetails[index].trainerName,
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline6!.copyWith(fontSize: 11,)),
                                      ],)
                                  ],
                                ),
                              ],
                            ),
                            Container(
                              height: screenSizeHeight/14.0,
                              width: screenSizeWidth/2.0,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  GestureDetector(
                                    onTap: (){
                                      Navigator.pushNamed(context, '/trainerDetailsScreen',
                                        arguments:defaults?trainersList[index]
                                            :trainersDetails[index],
                                      );
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color:Colors.red ,
                                        borderRadius: BorderRadius.circular(1.0),
                                      ),
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(7.0),
                                            child: Text('Enrol Now',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .subtitle2!.copyWith(color: Colors.white)),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )],
                              ),
                            )
                          ],
                        ),

                      ],
                    ),
                  ),
                ]),
          ),
        ) ,
        // onTap: ,
      );
    },
  );
}
