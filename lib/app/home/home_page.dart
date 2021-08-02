import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final textController = TextEditingController();

  var isLoading = false;
  String? error;
  var cepResult = {};

  Future<void> searchCep(String cep) async {
    try {
      cepResult = {};
      error = null;
      setState(() {
        isLoading = true;
      });

      final response = await Dio().get("https://viacep.com.br/ws/$cep/json/");
      setState(() {
        cepResult = response.data;
      });
    } catch (e) {
      error = "Erro na pesquisa";
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Container(
        height: double.infinity,
        padding: const EdgeInsets.all(10),
        alignment: Alignment.center,
        child: Column(
          children: [
            TextField(
              controller: textController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: "cep"),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                searchCep(textController.text);
              },
              child: const Text("Pesquisar"),
            ),
            const SizedBox(height: 20),
            if (isLoading)
              const Expanded(
                  child: Center(
                child: CircularProgressIndicator(),
              )),
            if (error != null)
              Text(error!, style: const TextStyle(color: Colors.red)),
            if (!isLoading && cepResult.isNotEmpty)
              Text("Cidade ${cepResult['localidade']}")
          ],
        ),
      ),
    );
  }
}
