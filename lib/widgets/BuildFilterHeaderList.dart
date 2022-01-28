import 'package:flutter/material.dart';
import 'package:flutter_training_app/notifiers/Notifiers.dart';

ValueListenableBuilder buildFilterHeaderList(BuildContext context, int index,SelectFilterNotifier selectFilterNotifier) {
  final List<String> sortFilter = [
    'Sort by',
    'Location',
    'Training Name',
    'Trainer'
  ];
  int changedIndex = index;
  return ValueListenableBuilder(
      valueListenable: selectFilterNotifier,
      builder: (BuildContext context, dynamic value, Widget? child) {
        return GestureDetector(
          onTap: ()=>{
            selectFilterNotifier.changeFilter(changedIndex)
          },
          child: Container(
            height: 50,
            width: 150,
            decoration: BoxDecoration(
              border: value==index  ? Border(
                left: BorderSide(color: Colors.red, width: 5.0,),
              ):Border(
                left: BorderSide(color: Colors.transparent, width: 5.0,),
              ),
              color: value==index  ? Colors.white:Colors.black12,
            ),
            child: Row(
              mainAxisAlignment:MainAxisAlignment.center ,
              children: [
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text(sortFilter[index],
                      // textAlign: TextAlign.left,
                      style: Theme.of(context)
                          .textTheme
                          .headline6!.copyWith(fontSize: 15)),
                ),
              ],
            ),
          ),
        );
      }
  );
}