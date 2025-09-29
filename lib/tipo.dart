class Tipo {
  int _codigo;
  String _nome;

  Tipo(this._codigo, this._nome);

  int get codigo => _codigo;
  String get nome => _nome;

  set codigo(int valor) => _codigo = valor;
  set nome(String valor) => _nome = valor;
}
