import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import "./transaction_chart_bar.dart";
import '../../models/transaction.dart';

class TransactionChart extends StatelessWidget {
  final List<Transaction> transactions;

  const TransactionChart(this.transactions, {Key? key}) : super(key: key);

  List<Transaction> get getRecentTransactions {
    return transactions
        .where((element) => element.date
            .isAfter(DateTime.now().subtract(const Duration(days: 7))))
        .toList();
  }

  List<Map<String, Object>> get groupedTransactionData {
    final double totalAmount = transactions.fold(
        0, (previousValue, element) => previousValue + element.amount);
    return List.generate(7, (index) {
      final weekday = DateTime.now().subtract(Duration(days: index));
      var amount = 0.0;
      for (int i = 0; i < transactions.length; i++) {
        if (transactions[i].date.day == weekday.day &&
            transactions[i].date.month == weekday.month &&
            transactions[i].date.year == weekday.year) {
          amount += transactions[i].amount;
        }
      }
      return {
        "amount": amount,
        "percent": amount > 0 ? amount / totalAmount : 0.0,
        "weekday": DateFormat.E().format(weekday).substring(0, 1),
      };
    }).toList().reversed.toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(20),
      child: Card(
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: groupedTransactionData
                .map((item) => TransactionChartBar(
                      item["amount"] as double,
                      item["percent"] as double,
                      item["weekday"] as String,
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }
}
