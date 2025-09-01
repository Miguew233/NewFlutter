class Usuario {
  int? _codigo;
  String? _nome;
  String? _login;
  String? _senha;

  Usuario({int? codigo, String? senha, String? login, String? nome}) {
    _codigo = codigo;
    _login = login;
    _nome = nome;
    _senha = senha;
  }

  //getters
  //exemplo tradicional
  String? get login {
    return _login;
  }

//metodo ao estilo dart
  int? get codigo => _codigo;

  String? get nome => _nome;

  String? get senha => _senha;


//setters
//setter tradicional
  set login(String? login) {
    _login = login;
  }

//metodo set ao estilo dart
  set nome(String? nome) => _nome = nome;

  set codigo(int? codigo) => _codigo = codigo;

  set senha(String? senha) => _senha = senha;
}

class Tipo{
  int? _codigo;
  String? _nome;

  Tipo(int? codigo, String? nome){
    _codigo = codigo;
    _nome = nome;
  }

  int? get codigo => _codigo;
  String? get nome => _nome;

  set codigo(int? codigo) => _codigo = codigo;
  set nome(String? nome) => _nome = nome;
}


class Restaurante{
  int? _codigo;
  String? _nome;
  double? _latitude;
  double? _longitude;
  Usuario? _proprietario;
  Tipo? _tipoCulinaria;


  Restaurante(int? codigo, String? nome, double? latitude, double? longitude, Usuario? proprietario, Tipo? tipoCulinaria) {
    _codigo = codigo;
    _nome = nome;
    _latitude = latitude;
    _longitude = longitude;
    _proprietario = proprietario;
    _tipoCulinaria = tipoCulinaria;
  }

  int? get codigo => codigo;
  String? get nome => _nome;
  double? get latitude => _latitude;
  double? get longitude => _longitude;
  Usuario? get proprietario => _proprietario;
  Tipo? get tipoCulinaria => _tipoCulinaria;

  set codigo(int? codigo) => _codigo;
}