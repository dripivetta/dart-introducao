void main() {
  // ERROS:
  // 2/0 da erro porque não é possível dividir
  // print ((2/0).toInt());
    
  // temos que fazer a tratativa do erro
  try { // tentar alguma coisa
    print ((2/0).toInt());
    
  // o catch captura o erro e mostra
  //} catch (e) { // capturar a falha
    //print ('deu erro');
    // ou printamos o erro que mostra ele sem tratar
    // print (e);
  //}
  // o cactch aceita receber dois parâmetros, o nosso erro (e) e nossa pilha de erros (StackStrace)
  } catch (e,stackStrace) { 
    //print (stackStrace);
    // caso quisermos propagar o erro pra frente, ou seja mesmo com catch ele vai aparecer o erro, ai usamos rethow no final:
    print('printando o erro $e');
    //rethrow; // propagar o erro a aplicação continua falhando porque é como se não tivesse feito a tratativa 
    //throw Exception ("Ocorreu um erro X"); // faz uma exessão com o erro retorna um novo erro
    // se não colocar nada dentro do parâmetro da Exception aparece só a mensagem de Execption
    throw CustomError ('erro customizado'); // não apareceu a frase pois não tem o método toString, então retorna só o erro é Intance of 'CustomError'
  
  }

  // ---------------------------- outro exemplo ---------------------------------------------
  // é preciso comentar a parte de cima do código caso queria ver o segundo erro, porque nossa aplicação
  // não continua rodando depois que parou no primeiro erro
  
  String user = 'admin';
  String pass = '123';
  
  if (pass.length <= 6) throw PassLengthError();
  
  // podemos fazer uma classe de login que também já tem o proprio erro customizado
  // instancinado uma classe login que já tem dentro um método de tratamento de erro:  
  Login login = Login ();
  // login.logar (); 
  // vai devolver erro logo então:
  
  try {
    login.logar();
  }
  //catch (e){
   // print ('Falhou ao logar'); // para ver esse erro é necessário comentar código pra cima
  //}
  // para capturar pelo tipo de erro fazemos:
  on PassLengthError catch (e){
    print ('Falhou ao logar');
  }
  catch (e) { // mas se for outro tipo de erro que não o PassLengthErro vai devolver um erro geral:
    print ('Outro erro');
  }
  finally { // ele tenta fazer alguma coisa, captura o erro, e faz outra coisa no final
    print ('finalizou');  
  }
  
}

// construir nossas excpetions de erros
class CustomError implements Exception {
  final String error;
  CustomError (this.error); // Construtor
}

// ----------------------------------------------------------------------------------------

class PassLengthError implements Exception {
  
  PassLengthError (); // Construtor
  
}

class Login {
  void logar () {
    String user = 'admin';
    String pass = '123'; 
    //if (pass.length <= 6) throw PassLengthError(); // Erro da PassLegthErro
    if (pass.length <= 6) throw PassLengthError(); 
  }
}