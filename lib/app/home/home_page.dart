import 'package:bloc/app/home/search_cep_bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final textController = TextEditingController();

  final searchCepBloc = SearchCepBloc();

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
                searchCepBloc.searchCep.add(textController.text);
              },
              child: const Text("Pesquisar"),
            ),
            const SizedBox(height: 20),
            StreamBuilder<SearchCepState>(
                stream: searchCepBloc.cepResult,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Container();
                  }

                  var state = snapshot.data;

                  if (state is SearchCepError) {
                    return Text("${snapshot.error}",
                        style: const TextStyle(color: Colors.red));
                  }

                  if (state is SearchCepLoading) {
                    return const Expanded(
                        child: Center(
                      child: CircularProgressIndicator(),
                    ));
                  }

                  state = state as SearchCepSuccess;

                  return Text("Cidade ${state.data['localidade']}");
                }),
            // if (searchCepBloc.isLoading)
            //   const Expanded(
            //       child: Center(
            //     child: CircularProgressIndicator(),
            //   )),
          ],
        ),
      ),
    );
  }
}
