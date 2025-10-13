import 'package:flutter/material.dart';
import 'package:voupedir/banco/restaurante_DAO.dart';
import 'package:voupedir/banco/tipo_DAO.dart';
import '../tipo.dart';

class TelaCadRestaurante extends StatefulWidget {
  TelaCadRestaurante({super.key});

  @override
  State<StatefulWidget> createState() {
    return TelaCadRestauranteState();
  }
}

class TelaCadRestauranteState extends State<TelaCadRestaurante>{

  final TextEditingController nomeController = TextEditingController();
  final TextEditingController latitudeController = TextEditingController();
  final TextEditingController longitudeController = TextEditingController();
  String? culinariaSelecionada;

  List<Tipo> tiposCulinaria = [];
  int? tipoCulinaria;

  Future<void> carregarTipos() async{
    final listar = tipoDAO.listarTipos();
    setState(() async {
      tiposCulinaria = await listar;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('cadastro de Restaurante')),
      body: Padding(padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Informações do Restaurante"),
          SizedBox(height: 30),
          Text("Tipo de Comida:"),
          DropdownButtonFormField<String>(
              value: culinariaSelecionada,
              items: tiposCulinaria.map((tipo){
                return DropdownMenuItem(
                    value: tipo.descricao,
                    child: Text("${tipo.descricao}")
                );
              }).toList(),
              onChanged: (String? novaCulinaria){
                culinariaSelecionada = novaCulinaria;
                Tipo tipoSelecionado = tiposCulinaria.firstWhere(
                    (tipo) => tipo.descricao == novaCulinaria,
                );
                tipoCulinaria = tipoSelecionado.codigo;
            }
          ),

          TextFormField(
            decoration: const InputDecoration(hintText: 'Nome do Restaurante'),
            validator: (String? value) {},
            controller: nomeController,
          ),
        TextFormField(
          decoration: const InputDecoration(hintText: 'Latitude'),
          validator: (String? value) {},
          controller: latitudeController,
          ),
        TextFormField(
          decoration: const InputDecoration(hintText: 'Longitude'),
          validator: (String? value) {},
          controller: longitudeController,
          ),
          SizedBox(height: 30),
          ElevatedButton(
              onPressed: ()async{
                final sucesso = await RestauranteDAO.cadastrarRestaurante(
                  nomeController.text,
                  latitudeController.text,
                  longitudeController.text,
                  tipoCulinaria
                );
                String msg = 'ERRO: restaurante não cadastrado.';
                Color corFundo = Colors.red;
                if(sucesso > 0){
                  //sucesso é o ID do restaurante cadastrado, que será maior que 0(zero)
                  msg = '"${nomeController.text}" cadastrado! ID: $sucesso';
                  corFundo = Colors.green;
                }
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(msg),
                    backgroundColor: Colors.red,
                    duration: Duration(seconds: 5),
                  )
                );

              }, child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.save),
                Text("Cadastrar")
            ],
          ))
          ],
        ),
        ),
        );
  }
}