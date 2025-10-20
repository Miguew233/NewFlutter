import 'package:flutter/material.dart';
import 'package:voupedir/banco/usuario_DAO.dart';
import 'package:voupedir/restaurante.dart';
import 'package:voupedir/telas/tela_cad_restaurante.dart';
import 'package:voupedir/usuario.dart' hide Restaurante;
import '../banco/restaurante_DAO.dart';
import 'package:voupedir/telas/tela_edit_restaurante.dart';

class TelaHome extends StatefulWidget {
  TelaHome({super.key});

  @override
  State<TelaHome> createState() => TelaHomeState();
}

class TelaHomeState extends State<TelaHome>{
  List<Restaurante> restaurantes = [];

  @override
  void initState(){
    super.initState();
    carregarRestaurante();
  }

  Future<void> carregarRestaurante() async{
    final listar = await RestauranteDAO.listarTodos();
    setState((){
      restaurantes = listar;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Lista de restaurantes"),
          actions: [
            IconButton(
                onPressed: () async{
                final t = await Navigator.push(context, MaterialPageRoute(builder: (context) => TelaCadRestaurante()));
                if(t == false || t == null){
                  setState((){
                    carregarRestaurante();
                  });
                  }
                },
                icon: Icon(Icons.add)
            )
          ],
      ),
      body: Padding(padding: const EdgeInsets.all(30),
        child: ListView.builder(
          itemCount: restaurantes.length,
          itemBuilder: (context, index){
            final r = restaurantes[index];
            return Card(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: ListTile(
                title: Text(r.nome ?? 'Sem nome'),
                subtitle: Text('ID: ${r.codigo}'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                        onPressed: () async{
                          TelaEditRestaurante.restaurante = await RestauranteDAO.listar(r.codigo);
                          Navigator.push(context, MaterialPageRoute(builder: (context) => TelaEditRestaurante()));

                        }, icon: Icon(Icons.edit, color: Colors.blue)),
                    IconButton(
                        onPressed: (){
                          showDialog(context: context,
                          builder: (BuildContext context) =>
                          AlertDialog(
                            title: Text('Confirmar ação'),
                            content: Text('Deseja realmente excluir ?'),
                            actions: <Widget>[
                              TextButton(
                                  onPressed: (){
                                    RestauranteDAO.excluir(r);
                                    setState(() {
                                      carregarRestaurante();
                                    });
                                    Navigator.pop(context);
                                  },
                                  child: Text('sim')
                              ),
                              TextButton(onPressed: (){
                                Navigator.pop(context);
                              },
                                  child: Text('não')
                              )
                            ],
                          ),
                          );
                        },
                        icon: Icon(Icons.delete, color: Colors.red)
                    ),
                  ],
                ),
              ),
            );
          }
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => TelaCadRestaurante()));
          },
        child: Icon(Icons.add),
      ),
    );
  }
}