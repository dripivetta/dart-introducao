import 'package:flutter/material.dart';

import '../components/editor.dart';
import '../models/transferencia.dart';

const _tituloAppBar = 'Criando transferência';
const _rotuloCampoValor = 'Valor';
const _dicaCampoValor = '0.00';
const _rotuloCampoNumeroConta = 'Número da conta';
const _dicaCampoNumeroConta = '0000';
const _textoBotaoConfirmar = 'Confirmar';


class FormularioTrasnferencia extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return FormularioTrasnferenciaState();
  } 
}

class FormularioTrasnferenciaState extends State<FormularioTrasnferencia> {

  final TextEditingController _controladorCampoNumeroConta = TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_tituloAppBar),
      ),
      body: SingleChildScrollView(
        child: Column (
          children: <Widget> [
            Editor(
              controlador: _controladorCampoNumeroConta, 
              rotulo: _rotuloCampoNumeroConta, 
              dica: _dicaCampoNumeroConta, 
              icone: Icons.account_balance,
            ),
            Editor(
              controlador: _controladorCampoValor, 
              rotulo: _rotuloCampoValor, 
              dica: _dicaCampoValor, 
              icone: Icons.monetization_on,
            ),
            ElevatedButton(
              onPressed: () => _criaTransferencia (context),            
              child: Text(_textoBotaoConfirmar),
            ),
          ],
        ),
      ),
    );
  }

  void _criaTransferencia (BuildContext context) {
  final int? numeroConta = int.tryParse(_controladorCampoNumeroConta.text);
  final double? valor = double.tryParse(_controladorCampoValor.text);
    if (numeroConta !=null && valor != null){
      final transferenciaCriada = Transferencia(valor, numeroConta);
      //debugPrint('Criando transferencia');
      //debugPrint ('$transferenciaCriada');
      Navigator.pop(context, transferenciaCriada);
    }
  }
}