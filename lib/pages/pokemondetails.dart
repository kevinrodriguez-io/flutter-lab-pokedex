import 'package:flutter/material.dart';
import 'package:pokemon/model/pokemon.dart';

class PokemonDetails extends StatelessWidget {
  final Pokemon pokemon;

  PokemonDetails({this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        elevation: 0.0,
        title: Text('Details'),
      ),
      body: Stack(
        children: <Widget>[
          Positioned(
            height: MediaQuery.of(context).size.height / 1.5,
            width: MediaQuery.of(context).size.width - 20,
            left: 10.0,
            top: MediaQuery.of(context).size.height * 0.12,
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SizedBox(
                    height: 70.0,
                  ),
                  Text(
                    pokemon.name,
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  Text('Height: ${pokemon.height}'),
                  Text('Weight: ${pokemon.weight}'),
                  Text('Types'),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: pokemon.type
                          .map((type) => FilterChip(
                                backgroundColor: Colors.amber,
                                label: Text(type),
                                onSelected: (s) {},
                              ))
                          .toList()),
                  Text('Weaknesses'),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: pokemon.weaknesses
                          .map((weakness) => FilterChip(
                                backgroundColor: Colors.red,
                                label: Text(
                                  weakness,
                                  style: TextStyle(color: Colors.white),
                                ),
                                onSelected: (s) {},
                              ))
                          .toList()),
                  Text('Next Evolution'),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: pokemon.nextEvolution == null
                          ? [
                              Center(
                                child: Text('No evolutions for this pokemon'),
                              )
                            ]
                          : pokemon.nextEvolution
                              .map((evolution) => FilterChip(
                                    backgroundColor: Colors.green,
                                    label: Text(
                                      evolution.name,
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    onSelected: (s) {},
                                  ))
                              .toList()),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Hero(
              tag: pokemon.img,
              child: Container(
                height: 200.0,
                width: 200.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(pokemon.img),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
