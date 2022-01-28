import 'package:flutter/material.dart';
import 'package:flutter_training_app/models/TrainerFilterModel.dart';
import 'package:flutter_training_app/notifiers/Notifiers.dart';

import 'BuildCheckBox.dart';

ValueListenableBuilder buildFilterTailList(BuildContext context, int index, SelectFilterNotifier selectFilterNotifier, TrainersDetailsModel trainersDetails) {
  return ValueListenableBuilder(
      valueListenable: selectFilterNotifier,
      builder: (BuildContext context, dynamic value, Widget? child) {
        if(value == 1){
          return buildLocationCheckBox(trainersDetails, index,context);
        }else if(value == 2){
          return buildNameCheckBox(trainersDetails, index,context);
        }else if(value == 3){
          return buildTrainerCheckBox(trainersDetails, index,context);
        }
        return Container();
      }
  );
}
