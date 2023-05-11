import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RevenuePage extends StatefulWidget {
  @override
  _RevenuePageState createState() => _RevenuePageState();
}

class _RevenuePageState extends State<RevenuePage> {
  List<Revenue> revenues = [
    Revenue(
      month: 'January',
      revenue: 10000,
    ),
    Revenue(
      month: 'February',
      revenue: 20000,
    ),
    Revenue(
      month: 'March',
      revenue: 30000,
    ),
    Revenue(
      month: 'April',
      revenue: 40000,
    ),
    Revenue(
      month: 'May',
      revenue: 50000,
    ),
  ];

  double totalRevenue = 0;

  @override
  void initState() {
    super.initState();
    for (Revenue revenue in revenues) {
      totalRevenue += revenue.revenue;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Revenue'),
        ),
      body: ListView.builder(
        itemCount: revenues.length,
        itemBuilder: (context, index) {
          Revenue revenue = revenues[index];
          return Card(
            child: ListTile(
              title: Text(revenue.month),
              subtitle: Text(
                NumberFormat.currency(locale: 'en_US', symbol: '₹').format(revenue.revenue),
              ),
            ),
          );
        },
      ),
      bottomSheet: Container(
        padding: EdgeInsets.all(10),
        child: Text(
          'Total Revenue: ₹ $totalRevenue',
            style: TextStyle(fontSize: 20),
          ),
        ),
      );
    }
  }

  class Revenue {
  String month;
  double revenue;

  Revenue({required this.month, required this.revenue});
}