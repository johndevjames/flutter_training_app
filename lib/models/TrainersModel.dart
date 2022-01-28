
import 'package:flutter/foundation.dart';
import 'TrainerFilterModel.dart';

class TrainersModel extends ChangeNotifier {
  late TrainerFilter _trainerFilter;

  final List<TrainersCheckBoxModel> _itemIds = [];

  TrainerFilter get trainers => _trainerFilter;

  set trainers(TrainerFilter newCatalog) {
    _trainerFilter = newCatalog;
    notifyListeners();
  }

  List<TrainersDetailsModel> get items {
    return _itemIds.map((object) {
      return _trainerFilter.getById(object.id);
    }).toList();
  }

  void addSort(TrainersDetailsModel item,bool checkBoxName,bool checkBoxTrainer,bool checkBoxLocation) {
    print(_itemIds.every((e) => e.id==item.id));
    if(_itemIds.every((e) => e.id!=item.id)) {
      _itemIds.add(TrainersCheckBoxModel(
          item.id, checkBoxName, checkBoxTrainer, checkBoxLocation));
      notifyListeners();
    }
  }

  void removeSort(TrainersDetailsModel item) {
    // if(_itemIds.every((e) => e.id==item.id))
    {
      for(int i=0;i<_itemIds.length;i++) {
        if(_itemIds[i].id == item.id)
          _itemIds.removeAt(i);
      }
      notifyListeners();
    }
  }

  List<TrainersCheckBoxModel> get itemBoolList {
    return _itemIds.toList();
  }
}
@immutable
class TrainersCheckBoxModel {
  final int id;
  final bool trainerName;
  final bool trainerTitle;
  final bool trainerLocation;

  TrainersCheckBoxModel(this.id, this.trainerName,this.trainerTitle,this.trainerLocation);

  @override
  int get hashCode => id;

  @override
  bool operator ==(Object other) => other is TrainersCheckBoxModel && other.id == id;
}
