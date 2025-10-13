import 'package:flutter/material.dart';
import '../banco/usuario_DAO.dart';
import '../telas/tela_home.dart';
import 'package:voupedir/usuario.dart';

class TelaLogin extends StatelessWidget{
  TelaLogin({super.key});

  final TextEditingController usuarioController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: const Text("tela de login")),
      body: Padding(padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: const InputDecoration(labelText: 'Usuario'),
              controller: usuarioController,
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: const InputDecoration(labelText: 'Senha'),
              obscureText: true,
              controller: senhaController,
            ),
            SizedBox(height: 20),
            ElevatedButton(onPressed:() async{
               final sucesso = await UsuarioDao.autenticar(usuarioController.text, senhaController.text);

                if (sucesso){
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TelaHome())
                 );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Usuário ou senha inválida!!"))
                  );
                }
              }, child: const Text('logar'))
          ],
        ),
      ),
    );
  }
}