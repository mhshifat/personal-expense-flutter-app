import "package:flutter/material.dart";

import './transaction_card.dart';
import '../../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function(String ind) onDelete;

  const TransactionList(this.transactions, this.onDelete, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SizedBox(
        height: 435,
        child: Card(
            child: transactions.isEmpty
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 150,
                        child: Image.asset(
                          "assets/img/waiting.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text("Empty Transactions List..."),
                    ],
                  )
                : ListView.builder(
                    itemBuilder: (bCtx, index) {
                      return TransactionCard(
                        transactions[index],
                        onDelete,
                      );
                    },
                    itemCount: transactions.length,
                  )),
      ),
    );
  }
}
