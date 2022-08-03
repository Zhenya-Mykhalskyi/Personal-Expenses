// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../models/transaction.dart';

import './transaction_item.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    print('build() TransactionList');
    return transactions.isEmpty
        ? LayoutBuilder(
            builder: ((ctx, index) {
              return Column(
                children: [
                  const SizedBox(
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
              );
            }),
          )
        : ListView.builder(
            itemBuilder: (ctx, index) {
              return TransactionItem(
                  transaction: transactions[index], deleteTx: deleteTx);

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
