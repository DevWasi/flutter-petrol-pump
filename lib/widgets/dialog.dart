import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:h2n_app/utils/helper.dart';
import 'package:h2n_app/widgets/pie_char.dart';
import 'package:intl/intl.dart';

buildDialog(stat, context){
  return showDialog(
    context: context,
    builder: (context) {
      return Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 30, right: 24, top: 30, bottom: 50),
              child: Material(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    bottomLeft: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0),
                    topRight: Radius.circular(20.0)
                ),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
                      child: Row(
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              buildTypo("total", NumberFormat.compact().format(stat["sold"]), Colors.greenAccent),
                              const SizedBox(height: 8),
                              buildTypo("remaining", NumberFormat.compact().format(stat["remaining"]), Colors.brown),
                              const SizedBox(height: 8),
                              buildTypo("sold", NumberFormat.compact().format(stat["sold"]), Colors.green),
                            ],
                          ),
                          Expanded(
                            child: Center(
                              child: buildPieChart(stat),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 24, right: 24, top: 8, bottom: 8),
                      child: Container(
                        height: 2,
                        decoration: const BoxDecoration(
                          color: Colors.black38,
                          borderRadius: BorderRadius.all(Radius.circular(4.0)),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
      );
    },
  );
}

buildTypo(title, value, legendColor, {unit = "liter"}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              height: 48,
              width: 2,
              decoration: BoxDecoration(
                color: legendColor,
                borderRadius: const BorderRadius.all(Radius.circular(4.0)),
              ),
            ),
            FittedBox(
              fit: BoxFit.fitWidth,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                     Padding(
                      padding: const EdgeInsets.only(left: 4, bottom: 2),
                      child: FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text(
                          capitalize(title),
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16, letterSpacing: -0.1, color: Colors.black,),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 4, bottom: 3),
                          child: FittedBox(
                            fit: BoxFit.fitWidth,
                            child: Text(
                              '$value',
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontWeight:FontWeight.w600, fontSize: 16, color: Colors.black,),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 4, bottom: 3),
                          child: Text(
                            capitalize(unit),
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 12, letterSpacing: -0.2, color: Colors.grey.withOpacity(0.5),),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        )
      ],
    ),
  );
}