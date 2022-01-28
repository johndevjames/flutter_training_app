import 'package:flutter/material.dart';
import 'package:flutter_training_app/models/TrainerFilterModel.dart';
import 'package:flutter_training_app/notifiers/Notifiers.dart';
import 'package:provider/provider.dart';
import 'BuildFilterHeaderList.dart';
import 'BuildFilterTailList.dart';

Future<dynamic> buildFilterBottomSheet(BuildContext context, double screenSizeHeight) {
  SelectFilterNotifier selectFilterNotifier = SelectFilterNotifier(0);
  return showModalBottomSheet(
    context: context,
    isDismissible: true,
    isScrollControlled: true,
    enableDrag: true,
    builder: (BuildContext bct) {
      return WillPopScope(
        onWillPop: () async => true,
        child: Container(
          height: screenSizeHeight/1.5,
          child: DefaultTabController(
            length: 3,
            child: Scaffold(
              appBar: AppBar(
                backgroundColor:Colors.white,
                title: Text('Sort and Filters',style: Theme.of(context)
                    .textTheme
                    .subtitle2!.copyWith(fontSize: 20)),
                automaticallyImplyLeading: false,
                actions: [
                  IconButton(
                    icon: const Icon(Icons.clear,color: Colors.black54,),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],

              ),
              body: Row(
                children: <Widget>[
                  Expanded(
                    flex: 4,
                    child: Column(
                      children: [
                        Expanded(
                          child: Container(
                            height: 50,
                            child: ListView.builder(
                              itemCount: 4,
                              itemBuilder: (context, index) {
                                return buildFilterHeaderList(context,index,selectFilterNotifier);
                              },
                            ),
                          ),
                        )

                      ],
                    ),
                  ),
                  const VerticalDivider(thickness: 1, width: 1),
                  Expanded(
                    flex: 6,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextField(
                          style: new TextStyle(
                            color: Colors.black,

                          ),
                          decoration: new InputDecoration(
                              prefixIcon: new Icon(Icons.search,color: Colors.black12),
                              hintText: "Search...",
                              hintStyle: new TextStyle(color: Colors.black12)
                          ),
                        ),
                        Expanded(
                          child: Container(
                              height: 50,
                              child: ListView.builder(
                                itemCount: 7,
                                itemBuilder: (context, index) {
                                  return Builder(builder: (context) {
                                    var trainersDetails =
                                    context.select<TrainerFilter, TrainersDetailsModel>((catalog) => catalog.getByPosition(index),
                                    );
                                    return  buildFilterTailList(context, index,selectFilterNotifier,trainersDetails);
                                  });
                                },
                              )
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}