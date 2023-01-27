import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionItem extends StatefulWidget {
  const TransactionItem({
    Key key,
    @required this.transaction,
    @required this.deleteTx,
  }) : super(key: key);

  final Transaction transaction;
  final Function deleteTx;

  @override
  State<TransactionItem> createState() => _TransactionItemState();
}

class _TransactionItemState extends State<TransactionItem> {
  Color _bgColor;
  @override
  // void initState() {
  //   const avalibleColors = [
  //     Colors.red,
  //     Colors.black,
  //     Colors.green,
  //     Colors.blue,
  //   ];

  //   _bgColor = avalibleColors[Random().nextInt(4)];
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      // shadowColor: Color.fromARGB(144, 2, 133, 87),
      color: Color.fromARGB(45, 0, 122, 100),
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          // backgroundColor: Color.fromARGB(255, 21, 21, 21),
          backgroundColor: Colors.black,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: FittedBox(
              child: Text(
                '₴ ${widget.transaction.amount.toStringAsFixed(2)}',
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  color: Theme.of(context).accentColor,
                ),
              ),
            ),
          ),
        ),
        title: Text(widget.transaction.title,
            style: Theme.of(context).textTheme.titleLarge),
        subtitle: Text(
          DateFormat.yMMMd().format(widget.transaction.date),
          style: Theme.of(context).textTheme.titleSmall,
        ),
        trailing: MediaQuery.of(context).size.width > 460
            ? TextButton.icon(
                onPressed: () => widget.deleteTx(
                  widget.transaction.id,
                ),
                label: Text(
                  'Delete',
                  style: TextStyle(color: Theme.of(context).accentColor),
                ),
                icon: const Icon(Icons.delete),
              )
            : IconButton(
                icon: const Icon(Icons.delete),
                color: Theme.of(context).accentColor,
                onPressed: () => widget.deleteTx(
                  widget.transaction.id,
                ),
              ),
      ),
    );
  }
}
