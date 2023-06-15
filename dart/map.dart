void main() {
  // mapas: muito parecido com listas, sequência de objetos, porém na lista tenho indices [0], [1]... porém não usa index para trabalhar com ela
  // se usa chave e cada chave vai estar associada a um valor/ objeto.
  
  List <String> lista = [];
  print (lista);
  
  // MAP: tem que passar a chave e o valor, nossa chave vai ser String e nosso valor String, mas não necessarimente precisa ser igual
  Map <String, String> mapa =  {};
  print (mapa);
  // para inicializa o mapa com valor
  Map <String, String> mapa2 =  {'chave' :  'valor'};
  print (mapa2);
  // como fazer o print somente o valor:
  print (mapa2['chave']);
  // como adicionar valores para dentro de um mapa:
  // neste primeiro método put ele faz a inclusão do objeto, 
  // este método espera receber 2 parâmetros, o primeiro parâmetro o nome da nova chave, e o segundo uma função que adicona o valor
  mapa2.putIfAbsent('novaChave' , () => 'novoValor');
  print (mapa2);
  // também consigo adionar diretamente:
  mapa2 ['novaChaveDois'] = 'novoValorDois';
  print (mapa2);
  // remoção de valores
  mapa2.remove ('chave');
  print (mapa2);
  // atualização de valor diretamente
  mapa2 ['novaChaveDois'] = 'atualizado';
  print (mapa2);
  // atualizar pelo método update 
  // quando achavar a chave novaChaveDois ele envia uma função pro value atulizar o valor da chave
  mapa2.update('novaChaveDois', (value) => 'atualizado2');
  print (mapa2);
  // interar sobre o mapa e mostrar todos objetos com chave e valor
  mapa2.forEach((chave, valor) => print ('A chave é: $chave , e o valor é: $valor '));
  // também conseguimos interar a partir das chaves
  mapa2.keys.forEach(print);
  // também consigo fazer a mesma coisa para os valores
  mapa2.values.forEach(print);
}