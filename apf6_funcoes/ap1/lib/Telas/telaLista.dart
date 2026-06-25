//Imports
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/estado_lista_pessoas.dart';
import '../models/pessoa.dart';
import '../Telas/telaEditar.dart';

//Tela da lista de Pessoas
class TelaLista extends StatefulWidget {
  static const routeName = "/Lista";
  const TelaLista({super.key});

  @override
  State<TelaLista> createState() => _MyTelaLista();
}

class _MyTelaLista extends State<TelaLista> {

  //Build
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: AppBar(title: const Text("Lista de Pacientes")),
      body: Column(
        children: [
          //Padding
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: const InputDecoration(
                      labelText: 'Buscar por nome',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (texto) {
                      context.read<EstadoListaDePessoas>().aplicarFiltros(nome: texto);
                    },
                  ),
                ),

                const SizedBox(width: 10),

                Expanded(
                  flex: 1,
                  child: DropdownButtonFormField<TipoSanguineo?>(
                    decoration: const InputDecoration(
                      labelText: 'Tipo',
                      border: OutlineInputBorder(),
                    ),
                    hint: const Text("Todos"),
                    items: [
                      const DropdownMenuItem<TipoSanguineo?>(
                        value: null,
                        child: Text("Todos"),
                      ),
                      ...TipoSanguineo.values.map((tipo) {
                        return DropdownMenuItem<TipoSanguineo?>(
                          value: tipo,
                          child: Text(tipo.sigla),
                        );
                      }),
                    ],
                    onChanged: (novoTipo) {
                      if (novoTipo == null) {
                        context.read<EstadoListaDePessoas>().aplicarFiltros(limparTipo: true);
                      } else {
                        context.read<EstadoListaDePessoas>().aplicarFiltros(tipo: novoTipo);
                      }
                    },
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            child: Consumer<EstadoListaDePessoas>(
              builder: (context, lista, child) {
                if (lista.pessoas.isEmpty) {
                  return const Center(child: Text("Nenhum paciente encontrado."));
                }

                return ListView.builder(
                  itemCount: lista.pessoas.length,
                  itemBuilder: (context, indice) {
                    final pessoa = lista.pessoas[indice];
                    return Card(
                      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      color: lista.verificarTipoSanguineo(pessoa),
                      child: ListTile(
                        title: Text(
                          'Nome: ${pessoa.nome}',
                          style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          'email: ${pessoa.email}\n' +
                          'telefone: ${pessoa.telefone}\n' +
                          'github: ${pessoa.github}\n' +
                          'Tipo Sanguíneo: ${pessoa.tipoSanguineo.sigla}',
                          style: const TextStyle(color: Colors.black),
                        ),

                        //Ícone para excluir
                        trailing: IconButton(
                          icon: const Icon(Icons.delete, color: Colors.black),
                          onPressed: () => lista.excluir(pessoa),
                        ),
                        onTap: () {
                          Navigator.of(context).pushNamed(TelaEditar.routeName, arguments: pessoa);
                        }
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}