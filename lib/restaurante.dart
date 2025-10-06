import 'usuario.dart' hide Tipo;
import 'tipo.dart';

class Restaurante {
  int _codigo;
  String _nome;
  double _latitude;
  double _longitude;
  Usuario _proprietario;
  Tipo _tipoCulinaria;

  Restaurante(
      this._codigo,
      this._nome,
      this._latitude,
      this._longitude,
      this._proprietario,
      this._tipoCulinaria, {required int codigo, required String nome}
      );

  int get codigo => _codigo;
  String get nome => _nome;
  double get latitude => _latitude;
  double get longitude => _longitude;
  Usuario get proprietario => _proprietario;
  Tipo get tipoCulinaria => _tipoCulinaria;

  set codigo(int valor) => _codigo = valor;
  set nome(String valor) => _nome = valor;
  set latitude(double valor) => _latitude = valor;
  set longitude(double valor) => _longitude = valor;
  set proprietario(Usuario usuario) => _proprietario = usuario;
  set tipoCulinaria(Tipo tipo) => _tipoCulinaria = tipo;
}
