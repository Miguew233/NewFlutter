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
                onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => TelaCadRestaurante()));
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
                        onPressed: (){
                          //Codigo para Editar Restaurante
                        },
                        icon: Icon(Icons.edit, color: Colors.blue)
                    ),
                    IconButton(
                        onPressed: (){
                          AlertDialog(
                            title: Text('Confirmar ação'),
                            content: Text('Deseja realmente excluir ?'),
                            actions: <Widget>[
                              TextButton(
                                  onPressed: (){
                                    //Código para excluir o registro
                                  },
                                  child: Text('sim')
                              ),
                              TextButton(onPressed: (){
                                //
                              },
                                  child: Text('não')
                              )
                            ],
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