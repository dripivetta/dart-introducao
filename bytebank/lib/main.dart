import 'package:flutter/material.dart';
import 'package:teste/http/webclient.dart';
import 'package:teste/models/contact.dart';
import 'package:teste/models/transaction.dart';
import 'package:teste/pages/home_page.dart';


void main() {
  runApp (ByteBankApp());
  //save(Contact(0, 'alex', 1000)).then((id){
    //findAll().then((contacts) => debugPrint(contacts.toString()));
  //});
  //save(Transaction(2000, Contact(0, 'Gui', 2000))).then((transaction) => print(transaction));
  //findAll().then((transactions) => print('new transactions $transactions'));
} 

class ByteBankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.amber,
        ).copyWith(
          secondary: Colors.deepPurple,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
          primary: Colors.deepPurple[100],
        )),
        //accentColor: Colors.deepPurple[100],
        buttonTheme: ButtonThemeData (
          buttonColor: Colors.deepPurple [100],
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      home:HomePage(),
    ); 
  }
}




  






