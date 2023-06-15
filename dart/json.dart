import 'dart:convert';

void main() {
  // JSON:
  // é um tipo de objeto que trefega quando consumir grande parte de APIs
  // toda vez que você faz login e senha em 90% dos casos você envia os dados pelo JSON
  
  // criar um JSON
  // String de mútiplas linhas
  String json = '''
    {
      "usuário" : "jessica@silva.com",
      "senha" : 123456,
      "permissões" : [ 
        "owner" , "admin"
      ]
    }
  
  ''';
  
  print (json);
  
  // como trabalhar (fazer o parcer) pegar os valores (usuário e senha) e trabalhar com ele
  // para isso importamos 'dart: convert'
  // var resultJason = jsonDecode (json);
  Map resultJason = jsonDecode (json);
  print (resultJason);
  print (resultJason.runtimeType); // para mostrar o tipo de objeto
  print (resultJason["usuário"]); // como ele é um JSON tipo map, podemos capturar pelo metodo do MAP os valores através das chaves
  // podemos tipar ele pra MAP inves de var então (acima);
  // adicionamos uma lista de permissões, e nosso resultado fica ssim:
  print (resultJason);
  // como agora trabalhamos com lista fica da seguinte forma:
  print (resultJason ['permissões']);
  // para pegar os objetos na ordem das listas:
  print (resultJason ['permissões'][0]);
  
  // fazer um objeto virar JSON:
  Map mapa = {
    'nome' : 'Jessica',
    'pass' : 123,
    'permissions' : ['owner', 'admin']
  };
  print (mapa);
  // assim como temos o JSON Decode temos o JSON Encode, onde um mapa vai virar JSON válido
  var result = jsonEncode(mapa);
  print (result);
  
}