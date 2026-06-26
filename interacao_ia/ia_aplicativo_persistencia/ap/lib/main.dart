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
      title: 'SharedPreferences Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Controllers para ler o texto digitado nos campos
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _sobrenomeController = TextEditingController();

  // Variáveis que guardam o que foi salvo, para exibir na tela
  String _nomeSalvo = '';
  String _sobrenomeSalvo = '';

  @override
  void initState() {
    super.initState();
    // Quando o app abre, já carrega os dados salvos anteriormente
    _carregarDados();
  }

  // Carrega o nome e sobrenome do SharedPreferences
  Future<void> _carregarDados() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      // Se não existir nada salvo, usa '' (string vazia) como padrão
      _nomeSalvo = prefs.getString('nome') ?? '';
      _sobrenomeSalvo = prefs.getString('sobrenome') ?? '';
    });
  }

  // Salva o nome e sobrenome no SharedPreferences
  Future<void> _salvarDados() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString('nome', _nomeController.text);
    await prefs.setString('sobrenome', _sobrenomeController.text);

    setState(() {
      _nomeSalvo = _nomeController.text;
      _sobrenomeSalvo = _sobrenomeController.text;
    });

    // Mostra uma mensagem confirmando que salvou
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Dados salvos com sucesso!')),
      );
    }
  }

  @override
  void dispose() {
    // Libera os controllers da memória quando a tela é destruída
    _nomeController.dispose();
    _sobrenomeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Salvar Nome e Sobrenome'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _nomeController,
              decoration: const InputDecoration(
                labelText: 'Nome',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _sobrenomeController,
              decoration: const InputDecoration(
                labelText: 'Sobrenome',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _salvarDados,
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 12.0),
                child: Text('Salvar'),
              ),
            ),
            const SizedBox(height: 30),
            const Divider(),
            const SizedBox(height: 10),
            const Text(
              'Dados salvos:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              'Nome: $_nomeSalvo',
              style: const TextStyle(fontSize: 18),
            ),
            Text(
              'Sobrenome: $_sobrenomeSalvo',
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}