import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:github_search_dart_clean/modules/search/presenter/search/search_bloc.dart';
import 'package:github_search_dart_clean/modules/search/presenter/search/states/state.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  final bloc = Modular.get<SearchBloc>();

  @override
  void dispose() {
    super.dispose();
    bloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Github Search'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0, left: 8, top: 8),
            child: TextField(
              onChanged: bloc.add,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Search..."
              )
            ),
          ),
          StreamBuilder(
            stream: bloc,
            builder: (context, snapshot) {

              final state = bloc.state;

              if(state is SearchStart) {
                return Center(
                  child: Text('Digite um Texto'),
                );
              }

              if(state is SearchError) {
                return Center(
                  child: Text('Houve um error'),
                );
              }

              if(state is SearchLoading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              final list = (state as SearchSuccess).list;

              return Expanded(
                child: ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (_, id) {
                    final item = list[id];
              
                    return ListTile(
                      leading: item.img == null ? Container() : CircleAvatar(
                        backgroundImage: NetworkImage(item.img)
                      ),
                      title: Text(item.title ?? ""),
                    );
                  },
                ),
              );
            }
          )
        ],
      ),
    );
  }
}