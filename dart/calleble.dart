void main() {
  // Callable Interface (CALL)
  // no Dart temos um mecanismo interessante que facilita a leitura de código
  // a Callable interface melhora a semântica dos códigos
  
  // criar a instancia da classe
  BuscarAlunos buscarAlunos = BuscarAlunos ();
  // buscarAlunos.buscar();
  // faz sentido ter uma classe BuscarAlunos que tem um único método que é buscar?
  // agora podemos passar apenas o Call:
  // buscarAlunos.call();
  // e ainda mais posso omitir o call:
  buscarAlunos ();
  // Isto quer dizer que temos que temos uma classe com um único método e que esse método 
  // se executa apenas com o nome da classe que eu passar
  
  
}

class BuscarAlunos {
  
  // método
  // void buscar () => print('Pedro, Jéssica');
  // porém é significativo que a classe já seja o próprio método para isso fazemos:
  void call () => print ('Pedro, Jéssica');
  
}