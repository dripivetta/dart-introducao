import 'package:flutter/material.dart';
import 'package:teste/components/centered_message.dart';
import 'package:teste/components/progress.dart';
import 'package:teste/http/webclient.dart';
import 'package:teste/http/webclients/transaction_webclient.dart';
import 'package:teste/models/contact.dart';
import 'package:teste/models/transaction.dart';


class TransactionsList extends StatelessWidget {
  final TransactionWebClient _webClient = TransactionWebClient();
  @override
  Widget build(BuildContext context) {
    //transactions.add(Transaction(100.0, Contact(0, 'Alex', 1000)));
    return Scaffold(
      appBar: AppBar(
        title: Text('Transactions'),
      ),
      body: FutureBuilder<List<Transaction>>(
        future: _webClient.findAll(),
        // para colocar delay:
        // future: Future.delay(Duration(seconds:1)).then((value) => findAll()),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              return Progress();
              break;
            case ConnectionState.active:
              break;
            case ConnectionState.done:
              if (snapshot.hasData) {
                final List<Transaction> transactions = snapshot.data!;
                if (transactions.isNotEmpty) {
                  return ListView.builder(
                    itemBuilder: (context, index) {
                      final Transaction transaction = transactions[index];
                      return Card(
                        child: ListTile(
                          leading: Icon(Icons.monetization_on),
                          title: Text(
                            transaction.value.toString(),
                            style: TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            transaction.contact.accountNumber.toString(),
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: transactions.length,
                  );
                }
              }

              return CenteredMessage(
                'No transactions found',
                icon: Icons.warning,
              );

              break;
          }
          return CenteredMessage('Unknown error');
        },
      ),
    );
  }
}
