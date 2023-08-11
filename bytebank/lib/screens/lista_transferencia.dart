import 'package:flutter/material.dart';

import '../main.dart';
import '../models/transferencia.dart';
import 'formulario_transferencia.dart';

const _tituloAppBar = 'Transferência';

class ListaTransferenciasState extends State<ListaTransferencias> {
  @override
  Widget build(BuildContext context) {
    //widget._transferencias.add (Transferencia(100.0, 110111));
    return Scaffold(
        appBar: AppBar (
        title: Text (_tituloAppBar),
        ),
        body: ListView.builder(
          itemBuilder: (context, indice) { 
            final transferencia = widget._transferencias[indice];
            return ItemTransferencia(transferencia);
           },
          itemCount: widget._transferencias.length, 
        ),
        floatingActionButton: FloatingActionButton(
        onPressed: () {
          //final Future <Transferencia?> future = 
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return FormularioTrasnferencia();
          })).then((transferenciaRecebida) => _atualiza(transferenciaRecebida), 
            /*Future.delayed(Duration(seconds: 1), () {
              se colocar o código abaixo aqui dentro ele esta o atraso
            });*/
            //debugPrint('chegou no then do future');
            //debugPrint('$transferenciaRecebida');
          );
        },
        child: Icon (Icons.add),
        ),  
    );
  }

  void _atualiza(Transferencia? transferenciaRecebida) {
    if(transferenciaRecebida != null) {
      setState(() {
        widget._transferencias.add(transferenciaRecebida);
      }); 
    }
  }

}

class ListaTransferencias extends StatefulWidget {

  final List <Transferencia> _transferencias = List.empty(growable: true);
    
  @override
  State<StatefulWidget> createState() {
    return ListaTransferenciasState();
  } 
}

class ItemTransferencia extends StatelessWidget {

  final Transferencia _transferencia;
  ItemTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    return Card(
          child: ListTile(
            leading: Icon(Icons.monetization_on),
            title: Text(_transferencia.valor.toString()),
            subtitle: Text(_transferencia.numeroConta.toString()),
          ),
        );
  }
}