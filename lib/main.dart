import 'package:flutter/material.dart';
import 'pages/homePage.dart';

// JSON TO DART:
// Pokemon: https://raw.githubusercontent.com/biuni/pokemongo-pokedex/master/pokedex.json
void main() => runApp(PokemonApp());

class PokemonApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PokemonAppState();
}

class _PokemonAppState extends State<PokemonApp> {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Pokemon',
      theme: ThemeData.light(),
      home: HomePage(),
    );
  }
  
}
