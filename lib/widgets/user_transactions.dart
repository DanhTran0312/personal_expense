import 'package:flutter/material.dart';
import './transaction_list.dart';
import './new_transaction.dart';
import '../models/transaction.dart';

class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _userTransaction = [
    Transaction(
      id: '123',
      title: 'Transaction 1',
      amount: 99.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: '124',
      title: 'Transaction 2',
      amount: 19.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: '125',
      title: 'Transaction 3',
      amount: 29.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: '126',
      title: 'Transaction 4',
      amount: 39.99,
      date: DateTime.now(),
    ),
  ];

  void _addNewTransaction(String title, double amount) {
    final newTx = Transaction(
      title: title,
      amount: amount,
      date: DateTime.now(),
      id: DateTime.now().toString(),
    );

    setState(() {
      _userTransaction.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(_addNewTransaction),
        TransactionList(_userTransaction),
      ],
    );
  }
}
