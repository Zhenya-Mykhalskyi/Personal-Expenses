import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    Key key,
    @required this.transaction,
    @required this.deleteTx,
  }) : super(key: key);

  final Transaction transaction;
  final Function deleteTx;

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
          backgroundColor: Color.fromARGB(255, 21, 21, 21),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: FittedBox(
              child: Text(
                '₴ ${transaction.amount.toStringAsFixed(2)}',
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  color: Theme.of(context).accentColor,
                ),
              ),
            ),
          ),
        ),
        title: Text(transaction.title,
            style: Theme.of(context).textTheme.titleLarge),
        subtitle: Text(
          DateFormat.yMMMd().format(transaction.date),
          style: Theme.of(context).textTheme.titleSmall,
        ),
        trailing: MediaQuery.of(context).size.width > 460
            ? FlatButton.icon(
                onPressed: () => deleteTx(
                  transaction.id,
                ),
                label: const Text('Delete'),
                icon: const Icon(Icons.delete),
                textColor: Theme.of(context).accentColor,
              )
            : IconButton(
                icon: const Icon(Icons.delete),
                color: Theme.of(context).accentColor,
                onPressed: () => deleteTx(
                  transaction.id,
                ),
              ),
      ),
    );
  }
}
