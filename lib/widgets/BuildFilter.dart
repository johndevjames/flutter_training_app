import 'package:flutter/material.dart';

import 'BuildFilterBottomModalSheet.dart';

Padding buildFilter(BuildContext context, double screenSizeHeight,) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      mainAxisAlignment:MainAxisAlignment.end ,
      crossAxisAlignment:CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: ()=> buildFilterBottomSheet(context,screenSizeHeight),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black12),
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Row(
              mainAxisAlignment:MainAxisAlignment.center ,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Icon(Icons.sort,size: 20,),
                ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text('Filter',
                      // textAlign: TextAlign.left,
                      style: Theme.of(context)
                          .textTheme
                          .subtitle2),
                ),
              ],
            ),
          ),
        )
      ],
    ),
  );
}