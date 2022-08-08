// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../widgets/chart_bar.dart';
import '../models/transaction.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  Chart(this.recentTransactions) {
    print('Constructor Chart');
  }

  List<Map<String, Object>> get groupTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );
      var totalSum = 0.0;
      for (var i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date.day == weekDay.day &&
            recentTransactions[i].date.month == weekDay.month &&
            recentTransactions[i].date.year == weekDay.year) {
          totalSum += recentTransactions[i].amount;
        }
      }

      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': totalSum,
      };
    }).reversed.toList();
  }

  double get totalSpending {
    return groupTransactionValues.fold(0.0, (sum, item) {
      return sum + item['amount'];
    });
  }

  @override
  Widget build(BuildContext context) {
    print('build() Chart');
    return Card(
      color: Theme.of(context).backgroundColor,
      elevation: 6,
      margin: EdgeInsets.all(20),
      child:
          // child: Column(
          //   mainAxisSize: MainAxisSize.min,
          //   children: [
          // Container(
          //   padding: EdgeInsets.symmetric(vertical: 8),
          //   child: Text(
          //     'Expenses for the last week:',
          //     style: TextStyle(
          //         color: Theme.of(context).primaryColor,
          //         fontWeight: FontWeight.w700),
          //   ),
          // ),
          Padding(
        padding: EdgeInsets.all(6),
        child: LayoutBuilder(builder: (context, constraints) {
          return Container(
            height: constraints.maxHeight * 0.7,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: groupTransactionValues.map((data) {
                return Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: ChartBar(
                    data['day'],
                    data['amount'],
                    totalSpending == 0.0
                        ? 0.0
                        : (data['amount'] as double) / totalSpending,
                  ),
                );
              }).toList(),
            ),
          );
        }),
      ),
    );
  }
}
