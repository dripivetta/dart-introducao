void main() {
  // Enum: forma onde trabalho com valores que representam determinada informação e essa informação é imutável
 
  var pagamento = Pagamento ();
  //pagamento.pagar ('PIX');
  //pagamento.pagar ('Cartão');
  //pagamento.pagar ('Cheque'); // vai rodar e não vai retornar nada
  // agora com enum preciso fazer:
  pagamento.pagar (TipoPagamento.PIX); // porém se fizer desta forma não terá ainda nenhum resultado
  // porque ele está fazendo uma comparação para isso usamos extensions (abaixo)
  
}

enum TipoPagamento {
  PIX, BOLETO, CARTAO;
  
}

extension ExtensionTipoPagamento on TipoPagamento {
  String toValue () {
    
    // criar um map 
    Map map = {
      TipoPagamento.PIX: 'PIX',
      TipoPagamento.BOLETO: 'Boleto',
      TipoPagamento.CARTAO: 'Cartão',
    };
    
    return map[this];
  }
}

class Pagamento{
  
  //void pagar(String tipoPagamento) { // depois que você colocar o enum você não passa mais String e sim o enum
  void pagar(TipoPagamento tipoPagamento) {
    // if (tipoPagamento == 'PIX') { depois que colocar o extension o tipo de pagamento ficará com toValeu
    if (tipoPagamento.toValue() == 'PIX') {
      print ('Pagando com pix');
    } else if (tipoPagamento.toValue() == 'Boleto') {
      print ('Pagando com boleto');
    } else if (tipoPagamento.toValue() == 'Cartão'){
      print ('Pagando com cartão');
    }
    
  }
}