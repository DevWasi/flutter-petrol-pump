import 'dart:math';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:h2n_app/request/data_handler.dart';
import 'package:h2n_app/res/animation1.dart';
import 'package:h2n_app/utils/common.dart';
import 'package:h2n_app/utils/constants.dart';
import 'package:h2n_app/widgets/stat_card.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class HomeScreen extends StatefulWidget {
  static String image = images[0];
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List stats = [];
  get baseURl => baseURL;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
      getDataByRole("/stats").then((response) {
        setState(() => stats = response);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).buttonColor,
      appBar: appBar("dashboard"),
      body: _buildBody(context),
    );
  }
  _buildBody(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        _buildStats(),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: _buildTitledContainer("Sales",
                child: Center(
                    child: SfCartesianChart(
                      // Initialize category axis
                        primaryXAxis: CategoryAxis(),
                        series: <LineSeries<SalesData, String>>[
                          LineSeries<SalesData, String>(
                            // Bind data source
                              dataSource:  <SalesData>[
                                SalesData('Jan', 35),
                                SalesData('Feb', 28),
                                SalesData('Mar', 34),
                                SalesData('Apr', 32),
                                SalesData('May', 40)
                              ],
                              xValueMapper: (SalesData sales, _) => sales.year,
                              yValueMapper: (SalesData sales, _) => sales.sales
                          )
                        ]
                    )
                )),
          ),
        ),
        _buildActivities(context),
      ],
    );
  }

  SliverPadding _buildStats() {
    return SliverPadding(
      padding: const EdgeInsets.all(16.0),
      sliver: SliverGrid.count(
        crossAxisSpacing: 16.0,
        mainAxisSpacing: 16.0,
        childAspectRatio: 1.5,
        crossAxisCount: 3,
        children: getCards(stats, context)
      ),
    );
  }

  SliverPadding _buildActivities(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.all(16.0),
      sliver: SliverToBoxAdapter(
        child: _buildTitledContainer(
          "Activities",
          height: 280,
          child: Expanded(
            child: GridView.count(
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 3,
              children: activities
                  .map(
                    (activity) => Column(
                  children: <Widget>[
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: Theme.of(context).buttonColor,
                      child: activity.icon != null
                          ? Icon(
                        activity.icon,
                        size: 18.0,
                      )
                          : null,
                    ),
                    const SizedBox(height: 5.0),
                    Text(
                      activity.title!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 14.0),
                    ),
                  ],
                ),
              )
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }

  Container _buildTitledContainer(String title,
      {Widget? child, double? height}) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      width: double.infinity,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 28.0),
          ),
          if (child != null) ...[const SizedBox(height: 10.0), child]
        ],
      ),
    );
  }
}

Widget build(BuildContext context) {
  return Scaffold(
      body: Center(
          child: SfCartesianChart(
            // Initialize category axis
              primaryXAxis: CategoryAxis(),
              series: <LineSeries<SalesData, String>>[
                LineSeries<SalesData, String>(
                  // Bind data source
                    dataSource:  <SalesData>[
                      SalesData('Jan', 35),
                      SalesData('Feb', 28),
                      SalesData('Mar', 34),
                      SalesData('Apr', 32),
                      SalesData('May', 40)
                    ],
                    xValueMapper: (SalesData sales, _) => sales.year,
                    yValueMapper: (SalesData sales, _) => sales.sales
                )
              ]
          )
      )
  );
}

getCards(stats, context){
  List<Widget> cards = [];
  for(var stat in stats) {
    cards.add(buildStatCard(context, stat, Colors.white, Colors.black,
        Colors.primaries[Random().nextInt(Colors.primaries.length)]));
  }
  return cards;
}

class SalesData {
  SalesData(this.year, this.sales);
  final String year;
  final double sales;
}


/// Sample linear data type.
class LinearSales {
  final String month;
  final int sales;

  LinearSales(this.month, this.sales);
}

class Activity {
  final String? title;
  final IconData? icon;
  Activity({this.title, this.icon});
}

final List<Activity> activities = [
  Activity(title: "Results", icon: FontAwesomeIcons.listOl),
  Activity(title: "Messages", icon: FontAwesomeIcons.sms),
  Activity(title: "Appointments", icon: FontAwesomeIcons.calendarDay),
  Activity(title: "Video Consultation", icon: FontAwesomeIcons.video),
  Activity(title: "Summary", icon: FontAwesomeIcons.fileAlt),
  Activity(title: "Billing", icon: FontAwesomeIcons.dollarSign),
];
