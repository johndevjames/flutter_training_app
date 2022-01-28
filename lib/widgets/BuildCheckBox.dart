import 'package:flutter/material.dart';
import 'package:flutter_training_app/models/TrainerFilterModel.dart';
import 'package:flutter_training_app/models/TrainersModel.dart';
import 'package:flutter_training_app/notifiers/Notifiers.dart';
import 'package:provider/provider.dart';
Builder buildLocationCheckBox(TrainersDetailsModel trainersDetails, int index, BuildContext context) {
  var locationFilter = context.read<TrainersModel>();
  var itItThere = false;
  SelectLocationCheckBoxNotifier  selectLocationCheckBoxNotifier;
  selectLocationCheckBoxNotifier = SelectLocationCheckBoxNotifier(false);

  return Builder(builder: (context) {
    var isItChecked = context.select<TrainersModel, bool>(
          (checkList) => checkList.items.contains(trainersDetails),
    );
    if(locationFilter.itemBoolList.isNotEmpty)
      if(locationFilter.itemBoolList.indexWhere((element) => element.id == trainersDetails.id) !=-1)
        itItThere = locationFilter.itemBoolList[locationFilter.itemBoolList.indexWhere((element) => element.id == trainersDetails.id)].trainerLocation;
    selectLocationCheckBoxNotifier = SelectLocationCheckBoxNotifier(isItChecked&&itItThere);

    return Container(
      height: 50,
      width: 150,
      child:Row(
        children: <Widget>[
          ValueListenableBuilder(
              valueListenable: selectLocationCheckBoxNotifier,
              builder: (BuildContext context, dynamic value, Widget? child) {
                return Checkbox(
                  value: value,
                  onChanged: (bool? value) {
                    if(value!){
                      locationFilter.addSort(trainersDetails,false,false,true);
                      selectLocationCheckBoxNotifier.changeCheckBox(value);
                    }else{
                      locationFilter.removeSort(trainersDetails);
                      selectLocationCheckBoxNotifier.changeCheckBox(value);
                    }
                  },
                );
              }
          ), //SizedBox
          Text(
            trainersDetails.trainerLocation,
            style: TextStyle(fontSize: 15.0),
          ), //Text
        ],
      ),
    );
  }
  );
}
Builder buildNameCheckBox(TrainersDetailsModel trainersDetails, int index, BuildContext context) {
  var nameFilter = context.read<TrainersModel>();
  var itItThere = false;
  SelectNameCheckBoxNotifier  selectNameCheckBoxNotifier;
  selectNameCheckBoxNotifier = SelectNameCheckBoxNotifier(false);

  return Builder(builder: (context) {
    var isItChecked = context.select<TrainersModel, bool>(
          (checkList) => checkList.items.contains(trainersDetails),
    );
    if(nameFilter.itemBoolList.isNotEmpty)
      if(nameFilter.itemBoolList.indexWhere((element) => element.id == trainersDetails.id) !=-1)
        itItThere = nameFilter.itemBoolList[nameFilter.itemBoolList.indexWhere((element) => element.id == trainersDetails.id)].trainerName;
    selectNameCheckBoxNotifier = SelectNameCheckBoxNotifier(isItChecked&&itItThere);
    return Container(
      height: 50,
      width: 150,
      child:Row(
        children: <Widget>[
          ValueListenableBuilder(
              valueListenable: selectNameCheckBoxNotifier,
              builder: (BuildContext context, dynamic value, Widget? child) {
                return Checkbox(
                  value: value,
                  onChanged: (bool? value) {
                    if(value!){
                      nameFilter.addSort(trainersDetails,true,false,false);
                      selectNameCheckBoxNotifier.changeCheckBox(value);
                    }else{
                      nameFilter.removeSort(trainersDetails);
                      selectNameCheckBoxNotifier.changeCheckBox(value);
                    }

                  },
                );
              }
          ), //SizedBox
          Text(
            trainersDetails.trainerName,
            style: TextStyle(fontSize: 15.0),
          ), //Text
        ],
      ),
    );
  });


}
Builder buildTrainerCheckBox(TrainersDetailsModel trainersDetails, int index, BuildContext context) {
  var trainerFilter = context.read<TrainersModel>();
  var itItThere = false;
  SelectTrainerCheckBoxNotifier  selectTrainerCheckBoxNotifier;
  selectTrainerCheckBoxNotifier = SelectTrainerCheckBoxNotifier(false);


  return Builder(builder: (context) {
    var isItChecked = context.select<TrainersModel, bool>(
          (checkList) => (checkList.items.contains(trainersDetails)),
    );
    if(trainerFilter.itemBoolList.isNotEmpty)
      if(trainerFilter.itemBoolList.indexWhere((element) => element.id == trainersDetails.id)!=-1)
        itItThere = trainerFilter.itemBoolList[trainerFilter.itemBoolList.indexWhere((element) => element.id == trainersDetails.id)].trainerTitle;
    selectTrainerCheckBoxNotifier = SelectTrainerCheckBoxNotifier(isItChecked&&itItThere);

    return Container(
      height: 50,
      width: 150,
      child:Row(
        children: <Widget>[
          ValueListenableBuilder(
              valueListenable: selectTrainerCheckBoxNotifier,
              builder: (BuildContext context, dynamic value, Widget? child) {
                return Checkbox(
                  value: value,
                  onChanged: (bool? value) {
                    if(value!){
                      // selectTrainerCheckBoxNotifier.changeCheckBox(value);
                      trainerFilter.addSort(trainersDetails,false,true,false);
                    }else{
                      trainerFilter.removeSort(trainersDetails);
                      selectTrainerCheckBoxNotifier.changeCheckBox(value);
                    }
                  },
                );
              }
          ), //SizedBox
          Text(
            trainersDetails.trainerTitle,
            style: TextStyle(fontSize: 15.0),
          ), //Text
        ],
      ),
    );
  }
  );
}