void main() async {
  // Future, Async e Await
  
  // Future: o objeto do tipo future faz uma requição e após essa condição ter terminado consegue recuperar o valor do objeto
  // toda vez que trabalhamos com algo que não podemos garantir que ele vai garantir logo em seguido do código usamos o objeto future
  // portando não usamos mais assim a string: 
  // String cep = getCepByName ("Rua JK");
  // e Passamos a usar uma Variável futura que vai pegar o CEP
  Future <String> cepFuture = getCepByName("Rua JK");
  // se fizer o print desse objeto ele retorna uma Instancia de Future<String>:
  //print (cepFuture);
  // para printar a Instancia: recuperar o valor, se usa o operador then
  //cepFuture.then ((result) => print (result));
  // Agora vamos adicionar o nosso resultado em uma nova variável
  // como sabemos que ela vai ser inicializada em um pós momento vamos criar a String como late:
  late String cep;
  //cepFuture.then ((result) => cep = result);
  // desta forma irá apresentar um Error: LateInitializationError: Local 'cep' has not been initialized.
  // para que possamos fazer com que nossa aplicação não inicialize a variável até ele ter o retorno dela usaremos
  // na assintura, usando operador async que transforma o método em Future
  // porém agora para imprimir nosso valor de variável devemos:
  
  cep = await cepFuture; 
  
  print (cep);  
  
}

// external service
// String getCepByName (String name) {
//  return "00000000"
// }

Future <String> getCepByName (String name) {
  // simulando requisção
  return Future.value("00000000");
}