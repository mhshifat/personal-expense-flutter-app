import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../models/transaction.dart';

class TransactionCard extends StatelessWidget {
  final Transaction transaction;
  final Function(String ind) onDelete;

  const TransactionCard(this.transaction, this.onDelete, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: FittedBox(
          fit: BoxFit.fitWidth,
          child: Text(
            '\$${transaction.amount.toStringAsFixed(2)}',
          ),
        ),
        radius: 30,
      ),
      title: Text(
        transaction.title,
        style: Theme.of(context).textTheme.headline6,
      ),
      subtitle: Text(DateFormat.yMMMd().format(transaction.date)),
      trailing: IconButton(
        icon: const Icon(Icons.delete),
        color: Theme.of(context).errorColor,
        onPressed: () {
          onDelete(transaction.id);
        },
      ),
    );
  }
}
