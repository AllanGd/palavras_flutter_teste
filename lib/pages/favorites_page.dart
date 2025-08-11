import 'package:flutter/material.dart';
import 'package:palavras_flutter_teste/main.dart';
import 'package:provider/provider.dart';

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    if (appState.favorites.isEmpty) {
      return Center(
        child: Text('No favorites yet.'),
      );
    }

    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text('Você tem '
              '${appState.favorites.length} favoritos:'),
        ),
        for (var pair in appState.favorites)
          ListTile(
            leading: Icon(Icons.delete),
            title: Text(pair.asLowerCase),
            onTap: () {
              appState.removeFavorite(pair);
            },
          ),
      ],
    );
  }
}
