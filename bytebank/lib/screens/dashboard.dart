import 'package:flutter/material.dart';
import 'package:teste/screens/contacts_list.dart';
import 'package:teste/screens/transactions_list.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Image.network('https://cdn.pixabay.com/photo/2017/10/25/19/46/piggy-bank-2889046_960_720.jpg')
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('images/bytebank_logo.png'),
          ),
          Container(
            height: 120,
            child: ListView(
              scrollDirection: Axis.horizontal,
              // se envolver o Row no widget SingleChildScrollView tem que colocar uma opção pra ele ficar rolagem horizontal
              // scrollDirection: Axis.horizontal,
              // também consguirmos trabalhar com o ListView, ai no lugar do Row envolvido no SingleChildScrollView usamos direto o ListView
              // porém como o ListView costuma pegar o tamanho da tela temos que envolver ele em um container
              // agora tiramos a configuração de height do card porque o ListView que vai fazer
              children: [
                _FeatureItem(
                  'Transfer',
                  Icons.monetization_on,
                  onClick: () => _showContactsList(context),
                ),
                _FeatureItem(
                  'Transaction Feed',
                  Icons.description,
                  onClick: () => _showTransactionsList(context),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showContactsList(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => ContactsList()));
  }
  
  _showTransactionsList(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => TransactionsList()));
  }
}

class _FeatureItem extends StatelessWidget {
  final String name;
  final IconData icon;
  final Function? onClick;

  const _FeatureItem(this.name, this.icon, {@required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: Theme.of(context).colorScheme.primary,
        child: InkWell(
          onTap: () => onClick!(),
          child: Container(
            padding: EdgeInsets.all(8.0),
            //height: 100,
            width: 160,
            //color: Theme.of(context).colorScheme.primary, por estar usando InkWell quem defini a cor agora é o Material
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    icon,
                    color: Colors.deepPurple,
                    size: 32.0,
                  ),
                  Text(
                    name,
                    style: TextStyle(
                      color: Colors.deepPurple,
                      fontSize: 24,
                    ),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
