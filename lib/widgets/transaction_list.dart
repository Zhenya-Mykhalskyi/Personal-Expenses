// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? Column(
            children: [
              SizedBox(
                height: 15,
              ),
              Text(
                'No Transactions added yet!',
                style: Theme.of(context).textTheme.titleLarge,
              ),

              // Container(
              //   height: 75,
              //   child: Image.asset(
              //     'assets/images/waiting.png',
              //     fit: BoxFit.cover,
              //   ),
              // ),
            ],
          )
        : ListView.builder(
            itemBuilder: (ctx, index) {
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
                      padding: EdgeInsets.all(8),
                      child: FittedBox(
                        child: Text(
                          '₴ ${transactions[index].amount.toStringAsFixed(2)}',
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            color: Theme.of(context).accentColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  title: Text(transactions[index].title,
                      style: Theme.of(context).textTheme.titleLarge),
                  subtitle: Text(
                    DateFormat.yMMMd().format(transactions[index].date),
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    color: Theme.of(context).accentColor,
                    onPressed: () => deleteTx(
                      transactions[index].id,
                    ),
                  ),
                ),
              );

              // return Card(
              //   child: Row(
              //     children: [
              //       Container(
              //         width: 100,
              //         // color: Colors.black,
              //         margin: EdgeInsets.symmetric(
              //           vertical: 10,
              //           horizontal: 15,
              //         ),
              //         decoration: BoxDecoration(
              //           border: Border.all(
              //             width: 2,
              //             color: Theme.of(context).primaryColor,
              //           ),
              //         ),
              //         padding: EdgeInsets.all(7),
              //         child: Text(
              //           '\$: ${transactions[index].amount.toStringAsFixed(2)}',
              //           style: TextStyle(
              //             fontWeight: FontWeight.bold,
              //             fontSize: 15,
              //             color: Theme.of(context).primaryColor,
              //           ),
              //         ),
              //       ),
              //       Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           Text(
              //             transactions[index].title,
              //             style: Theme.of(context).textTheme.titleMedium,
              //           ),
              //           Text(
              //             DateFormat('dd.MM.yyyy  HH:mm')
              //                 .format(transactions[index].date),
              //             style: TextStyle(
              //               fontWeight: FontWeight.w400,
              //               color: Color.fromARGB(255, 103, 103, 103),
              //               fontSize: 14,
              //             ),
              //           ),
              //         ],
              //       ),
              //     ],
              //   ),
              // );
            },
            itemCount: transactions.length,
          );
  }
}
