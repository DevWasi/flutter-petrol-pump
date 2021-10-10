import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

import 'dialog.dart';

buildStatCard(context, stat, valueColor, nameColor, cardColor){
  return GestureDetector(
    onTap: (){
      buildDialog(stat, context);
    },
    child: Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: cardColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          FittedBox(
              fit: BoxFit.fitWidth,
              child: Text(NumberFormat.compact().format(stat["sold"]),
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                      color: valueColor))),
          Text(stat["stock_type"].toUpperCase(), style: TextStyle(color: nameColor))
        ],
      ),
    ),
  );
}