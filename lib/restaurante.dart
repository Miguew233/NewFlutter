import 'usuario.dart' hide Tipo;
import 'tipo.dart';

class Restaurante {
  int? _codigo;
  String? _nome;
  String? _latitude;
  String? _longitude;
  Usuario? _proprietario;
  Tipo? _tipoCulinaria;

  Restaurante({
  int? codigo,
  String? nome,
  String? latitude,
  String? longitude,
  Usuario? proprietario,
  Tipo? tipoCulinaria,
}) {
  _codigo = codigo;
  _nome = nome;
  _latitude = latitude;
  _longitude = longitude;
  _proprietario = proprietario;
}

  int? get codigo => _codigo;
  String? get nome => _nome;
  String? get latitude => _latitude;
  String? get longitude => _longitude;
  Usuario? get proprietario => _proprietario;
  Tipo? get tipoCulinaria => _tipoCulinaria;

  set codigo(int? valor) => _codigo = valor;
  set nome(String? valor) => _nome = valor;
  set latitude(String? valor) => _latitude = valor;
  set longitude(String? valor) => _longitude = valor;
  set proprietario(Usuario? usuario) => _proprietario = usuario;
  set tipoCulinaria(Tipo? tipo) => _tipoCulinaria = tipo;
}
