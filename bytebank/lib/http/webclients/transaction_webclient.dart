import 'dart:convert';

import 'package:http/http.dart';
import 'package:teste/http/webclient.dart';
import 'package:teste/models/contact.dart';
import 'package:teste/models/transaction.dart';

class TransactionWebClient {
  Future<List<Transaction>> findAll() async {
    final Response response = await client
        //.get(Uri.parse('http://192.168.1.19:8080/transactions')) -> como extraimos ela pra variável fica assim:
        .get(Uri.parse(baseUrl))
        .timeout(const Duration(seconds: 5));
    final List<dynamic> decodedJson = jsonDecode(response.body);
    return decodedJson
        .map((dynamic json) => Transaction.fromJson(json))
        .toList();
  }

  Future<Transaction> save(Transaction transaction) async {
    // Map<String, dynamic> transactionMap = _toMap(transaction);

    final String transactionJson = jsonEncode(transaction.toJson());

    final Response response = await client.post(Uri.parse(baseUrl),
        headers: {
          'Content-type': 'application/json',
          'password': '1000',
        },
        body: transactionJson);

    return Transaction.fromJson(jsonDecode(response.body));
  }
}
