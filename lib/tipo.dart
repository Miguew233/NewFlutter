class Tipo {

  int? _codigo;
  String? _descricao;

  int? get codigo => _codigo;
  String? get descricao => _descricao;

  set codigo(int? valor) => _codigo = valor;
  set descricao(String? valor) => _descricao = valor;

  Tipo({int? codigo, String? descricao}) {
  _codigo = codigo;
  _descricao = descricao;
  }
}
