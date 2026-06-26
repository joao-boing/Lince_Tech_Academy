import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lista de Tarefas',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const TaskListPage(),
    );
  }
}

// Modelo simples de tarefa: um texto + se está concluída ou não
class Task {
  String title;
  bool isDone;

  Task({required this.title, this.isDone = false});

  // Converte a tarefa para um Map (para depois transformar em JSON)
  Map<String, dynamic> toMap() {
    return {'title': title, 'isDone': isDone};
  }

  // Cria uma Task a partir de um Map (vindo do JSON salvo)
  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      title: map['title'] as String,
      isDone: map['isDone'] as bool,
    );
  }
}

class TaskListPage extends StatefulWidget {
  const TaskListPage({super.key});

  @override
  State<TaskListPage> createState() => _TaskListPageState();
}

class _TaskListPageState extends State<TaskListPage> {
  static const String _chave = 'tarefas'; // chave usada no SharedPreferences

  final TextEditingController _textController = TextEditingController();
  final List<Task> _tasks = [];

  @override
  void initState() {
    super.initState();
    _carregarTarefas(); // ao abrir o app, recupera as tarefas salvas
  }

  // Lê a lista de tarefas salva no SharedPreferences
  Future<void> _carregarTarefas() async {
    final prefs = await SharedPreferences.getInstance();
    final String? dadosSalvos = prefs.getString(_chave);

    if (dadosSalvos != null) {
      // Transforma a string JSON de volta em uma lista de Maps,
      // e depois cada Map em um objeto Task
      final List<dynamic> listaDecodificada = jsonDecode(dadosSalvos);
      setState(() {
        _tasks.addAll(
          listaDecodificada.map((item) => Task.fromMap(item)).toList(),
        );
      });
    }
  }

  // Salva a lista de tarefas inteira no SharedPreferences
  Future<void> _salvarTarefas() async {
    final prefs = await SharedPreferences.getInstance();
    // Transforma a lista de Tasks em uma lista de Maps, e depois em JSON
    final String dadosCodificados =
        jsonEncode(_tasks.map((task) => task.toMap()).toList());
    await prefs.setString(_chave, dadosCodificados);
  }

  // Adiciona uma nova tarefa à lista
  void _adicionarTarefa() {
    final texto = _textController.text.trim();
    if (texto.isEmpty) return; // não adiciona tarefa vazia

    setState(() {
      _tasks.add(Task(title: texto));
    });
    _textController.clear();
    _salvarTarefas(); // salva sempre que a lista muda
  }

  // Marca/desmarca uma tarefa como concluída
  void _alternarConcluida(int index) {
    setState(() {
      _tasks[index].isDone = !_tasks[index].isDone;
    });
    _salvarTarefas();
  }

  // Remove uma tarefa da lista
  void _removerTarefa(int index) {
    setState(() {
      _tasks.removeAt(index);
    });
    _salvarTarefas();
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Tarefas'),
      ),
      body: Column(
        children: [
          // Campo de texto + botão de adicionar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _textController,
                    decoration: const InputDecoration(
                      labelText: 'Nova tarefa',
                      border: OutlineInputBorder(),
                    ),
                    onSubmitted: (_) => _adicionarTarefa(), // Enter também adiciona
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: _adicionarTarefa,
                  child: const Icon(Icons.add),
                ),
              ],
            ),
          ),

          // Lista de tarefas (ou mensagem se estiver vazia)
          Expanded(
            child: _tasks.isEmpty
                ? const Center(
                    child: Text(
                      'Nenhuma tarefa ainda.\nAdicione uma acima!',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  )
                : ListView.builder(
                    itemCount: _tasks.length,
                    itemBuilder: (context, index) {
                      final task = _tasks[index];
                      return Card(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 4.0,
                        ),
                        child: ListTile(
                          leading: Checkbox(
                            value: task.isDone,
                            onChanged: (_) => _alternarConcluida(index),
                          ),
                          title: Text(
                            task.title,
                            style: TextStyle(
                              decoration: task.isDone
                                  ? TextDecoration.lineThrough
                                  : TextDecoration.none,
                              color: task.isDone ? Colors.grey : Colors.black,
                            ),
                          ),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () => _removerTarefa(index),
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}