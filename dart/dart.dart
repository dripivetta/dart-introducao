void main() {
  
  // 1 - Introdução a variável:
  
  String nome = "Jessica";
  print (nome);
  int valorInteiro = 10;
  print (valorInteiro);
  bool valorCondicional = true;
  print (valorCondicional);
  List<String> lista = ["Jessica", "Silva", "Silveira"];
  print ('${lista[0]} - ${lista[1]} - ${lista[2]}');
  
  // 2 - Introdução null-safety:
  // a variável não pode receber valor nulo
  // Sring nome;
  // print(nome);
  // ou seja não pode trabalhar com variável que não tem valor
  // como forçar a variável ser nulo? Usar ? após o tipo
  //DANDO BO String? nome;
  // Colocar valor na variável:
  //DANDO BO nome = "ABC";
  // para garantir que a variável não é um valor nulo usar ! após nome da variável
  //DANDO BO print(nome!);
  // desta maneira podemos voltar a variável a nulo
  //DANDO BO nome = null;
  // outra maneira de atribuir nulo em um variável é o late
  late String sobrenome;
  // porém quando eu adicionar um valor para variável nunca mais irá poder ser tornar null
  sobrenome = "Silveira";
  print (sobrenome);
  // não vai poder mais fazer sobrenome = null pois com o late não permite
  
  // 3 - IF e SWITCH:
  bool seguirEmFrente = false;
  
  if(seguirEmFrente){
    print ('Andar');
  }
  else {
    print ('Parar');
  }
  
  if (10>5){
    print ("10 é maior que 5");
  }
  
  int valorInt = 2;
    switch (valorInt) {
      case 0:
        print('ZERO');
        break;
      case 1:
        print('UM');
        break;
      case 2:
        print ('DOIS');
        break;
      default:
        print('NÚMERO PADRÃO');
  }
  
  // 4 - Estrutura de repetição:
  
  for (int i = 0; i <=10; i++) {
    print(i * 2);
  }
  
  int contador = 10; // condição
  while (contador != 1 ) {
      contador = contador - 1;
      print ('Loop => $contador');
  }
  
  // 5 - Métodos e Classes: 
  // Classe e atributos vai fora do método que estamos executando (abaixo)
  Celular celularMeu  = Celular ('Azul', 5, 0.800, 5.7);
  Celular celularZe  = Celular ('Preto', 10, 0.100, 5.7);
  print (celularMeu.cor);
  // Para agrupar informações usamos o método toString (abaixo:)
  print (celularZe.toString());
  print (celularMeu.valor(1000));
  // Outra maneira de fazer:
  double resultado = celularZe.valor(1000);
  print (resultado);
  
  // 6 - Orientação a objetos:
  // Classe carro (abaixo:)
  Carro mercedes = Carro ("mercedes");
  Carro gol = Carro ("gol");
  
  // 7 - Herança, Polimorfismo e Abstração:
  // Dart não tem interfaces, tem abstract class, que é a mesma coisa de inferace (modelos de contratos a seguir)
  // (abaixo:)
  Eu Jessica = Eu();
  Jessica.falar();
  Pagamento pagamento = PagarComBoleto ();
  pagamento.pagar();
  pagamento = PagarComPix ();
  pagamento.pagar();
  
}
// -------------------------------------------------------------------------------------
class Celular {
  final String cor;
  final int qntProcessador;
  final double tamanho;
  final double peso;
  
  Celular(this.cor, this.qntProcessador, this.tamanho, this.peso); // CONSTRUTOR
  
  // o método sempre retorna alguma coisa, portanto sempre começamos com o que ele retorna, se não retornar nada começa com void, nesta caso retorna uma String
  String toString () {
    return "Cor $cor, QntProcessador $qntProcessador, Tamanho $tamanho, peso $peso";
  }
  
  double valor (double valor) {
    return valor * qntProcessador;
  }
}
// -------------------------------------------------------------------------------------

class Carro {
  
  final String modelo;
  Carro (this.modelo); // CONSTRUTOR
  // Escopo de visibilidade ENCAPSULAMENTO (atributos que o mundo não precisa conhecer)
  String _segredo = "Muito dinheiro"; // vairável privada sempre vai começar com _antesdonome
  int get valorCarro => _valor;
  // Métodos setters e getters:
  int _valor = 1000; // método get acessar (arrow function)
  void setValue (int valor) => _valor = valor; // método setter alterar (arrow function)
  
}
// --------------------------------------------------------------------------------------

// ABSTRAÇÃO (CONTRATOS)
abstract class Pessoa {
  String comunicar ();
  
}
class PessoaET implements Pessoa {
  String comunicar () {
    return "Ola mundo";
  }
}
class PessoaNaoET implements Pessoa {
  String comunicar (){
    return "Bom dia";
  }
}
// HERANÇA
class Pai {
  String falar () {
    return "girias";
  }
}
class Eu extends Pai {
  
}
// POLIMORFISMO
// começa com um contrato abstract
abstract class Pagamento {
  void pagar ();
}
class PagarComBoleto implements Pagamento {
  void pagar () {
    print ("Pagando com boleto");
  }
}
class PagarComPix implements Pagamento {
  void pagar () {
    print ("Pagando com pix");
  }
}
