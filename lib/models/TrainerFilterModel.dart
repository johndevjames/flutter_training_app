
import 'package:flutter/material.dart';

class TrainerFilter {
  static List<TrainersDetailsModel> trainersDetailList = [
    TrainersDetailsModel(0,'Helen','Safe Scrum Master(4.6)','West Des Moines'),
    TrainersDetailsModel(1,'John','Safe Scrum Master(5.0)','Chicago,IL'),
    TrainersDetailsModel(2,'Patrick','Safe Scrum Master(6.0)','Phoenix,AZ'),
    TrainersDetailsModel(3,'Jeff','Safe Scrum Master(7.0)','Dallas,TX'),
    TrainersDetailsModel(4,'Alan','Safe Scrum Master(8.0)','San Diego,CA'),
    TrainersDetailsModel(5,'Jim','Safe Scrum Master(9.0)','San Francisco,CA'),
    TrainersDetailsModel(6,'Paul','Safe Scrum Master(10.0)','New York,ZK'),
  ];

  TrainersDetailsModel getById(int id) {
    return TrainersDetailsModel(id, trainersDetailList[id].trainerName,trainersDetailList[id].trainerTitle,trainersDetailList[id].trainerLocation,);
  }

  TrainersDetailsModel getByPosition(int position) {
    return getById(position);
  }
  List<TrainersDetailsModel> get trainersList {
    return trainersDetailList.toList();
  }
}

@immutable
class TrainersDetailsModel {
  final int id;
  final String trainerName;
  final String trainerTitle;
  final String trainerLocation;

  TrainersDetailsModel(this.id, this.trainerName,this.trainerTitle,this.trainerLocation);

  @override
  int get hashCode => id;

  @override
  bool operator ==(Object other) => other is TrainersDetailsModel && other.id == id;
}
