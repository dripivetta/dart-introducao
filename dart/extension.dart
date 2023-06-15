void main() {
  // Extension: estensões
  
  String nome  = 'Jessica';
  print (nome);
  // como é um nome a primeira do nome deve ser maíscula como resolver isso?
  // as strings tem algumas propriedades que podemos trabalhar com ela
  print (nome.toUpperCase());
  print (nome.toString());
  // etc... porém não tem nenhuma forma de passar só a primeira letra pra maiscula
  // com lógica teria como resolver:
  print (nome[0].toUpperCase() + nome.substring(1));
  // outra forma seria criar uma class Utils (abaixo) e realizer:
  print (Utils ().toFirstCharToUpperCase(nome));
  // porém o ideal seria usar Extension, que é um mecanismo do dark a dar novas propriedades a objetos existentes
  print (nome.toFirstCharToUpperCase());
  print ('abel'.toFirstCharToUpperCase()); // agora posso usar pra toda String extensões
  
  //print (EnumTest.enumValue);
  // temos poder de com as extensões adiconar papeis ao enum
  print (EnumTest.enumValue.toValue());
  print (EnumTest.enumNovo.toValue());
  
}

class Utils {
  toFirstCharToUpperCase (String value) {
    return value [0].toUpperCase() + value.substring(1);
  }
}

extension ExtersionString on String { // aplicar a estensão para o objeto String
  String toFirstCharToUpperCase () {
    return this[0].toUpperCase() + this.substring(1);
  }
}

// ---------------------------------------------------------------------------
enum EnumTest {
  enumValue, enumNovo;
}

extension ExtensionsEnum on Enum {
  String toValue() {
    //return 'XPTO';
    // ou criar um MAP
    
    Map map =  {
      EnumTest.enumValue: 'xpto',
      EnumTest.enumNovo: 'XPTO'
    };
    return map [this];
    
  }
}