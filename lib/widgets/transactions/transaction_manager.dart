import "package:flutter/material.dart";

import './transaction_chart.dart';
import './transaction_list.dart';
import '../../models/transaction.dart';

class TransactionManager extends StatelessWidget {
  final List<Transaction> transaction;
  final Function(String ind) onDelete;

  const TransactionManager(this.transaction, this.onDelete, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TransactionChart(transaction),
        TransactionList(
          transaction,
          onDelete
        ),
      ],
    );
  }
}
