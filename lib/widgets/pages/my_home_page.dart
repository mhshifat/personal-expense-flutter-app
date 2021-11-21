import 'package:flutter/material.dart';

import '../../models/transaction.dart';
import "../transactions/new_transaction.dart";
import "../transactions/transaction_manager.dart";

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _transactions = [
    Transaction(
      id: "1",
      title: "Transaction 1",
      amount: 9.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: "2",
      title: "Transaction 2",
      amount: 19.99999999999,
      date: DateTime.now(),
    ),
    Transaction(
      id: "3",
      title: "Transaction 3",
      amount: 0.00,
      date: DateTime.now(),
    ),
  ];

  void _startNewTransactionProcess(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return NewTransaction((title, amount, date) {
            setState(() {
              _transactions.add(Transaction(
                id: DateTime.now().toString(),
                title: title,
                amount: amount,
                date: date,
              ));
            });
            Navigator.of(context).pop();
          });
        });
  }

  void _deleteTransaction(id) {
    setState(() {
      _transactions.removeWhere((element) => element.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("PerExp"),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => _startNewTransactionProcess(context),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: TransactionManager(_transactions, _deleteTransaction),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => _startNewTransactionProcess(context),
      ),
    );
  }
}
