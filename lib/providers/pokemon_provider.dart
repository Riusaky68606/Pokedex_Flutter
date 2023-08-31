import 'dart:collection';
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pokedex_mobile/dtos/pokemon_model.dart'; // se crea un demonico

class PokemonProvier extends ChangeNotifier {
  final List<Pokemon> _pokemons = [];

  int get totalPokemons => _pokemons.length;

  UnmodifiableListView<Pokemon> get pokemons => UnmodifiableListView(_pokemons);

  Pokemon getPokemon(int id) {
    return _pokemons.firstWhere((element) => element.id == id);
  }

  Future<bool> checkPokemons() async {
    if (_pokemons.isEmpty) {
      await _initPokemonsList();
      return true;
    }
    return false;
  }

  Future<void> _initPokemonsList() async {
    var client = http.Client();
    var response = await client.get(Uri.http('pokeapi.co', '/api/v2/pokemon'));
    //print("statusPokemos ${response.statusCode}"); //statuscode, representa el codigo de retorno del servidor http.
    /*
    20X -> OK
    3XX -> Redireccion
    4XX -> Error del cliente (cliente)
    5XX -> Errores de servidor 
    
    DART - JSON -> Map<String, Object>
    */

    var decodedResponde =
        jsonDecode(response.body); //transporta el body a un mapa
    var results = decodedResponde["results"] as List;
    for (var ri in results) {
      //-Map<String, Object>
      var url = ri['url'] as String;
      await addPokemonList(url);
    }
    notifyListeners();
  }

  Future<void> addPokemonList(String url) async {
    var client = http.Client();
    var response = await client.get(Uri.parse(url));
    var pokemonData = jsonDecode(response.body);

    print("Procesando: $url");

    _pokemons.add(Pokemon.fromJson(pokemonData));

    final pokemonDocument = <String, dynamic>{
      "name": pokemonData['name'],
      "id": pokemonData['id'],
      "imageURL": pokemonData['sprites']['front_default']
    };

    var db = FirebaseFirestore.instance;

    var setOptions = SetOptions(merge: true);
    db
        .collection("pokemons")
        .doc(pokemonData['id'].toString())
        .set(pokemonDocument, setOptions)
        .then((value) => print("sucess"));
  }

  Future<void> updatePokemonFavoriteStatus(int id, bool value) async {
    var db = FirebaseFirestore.instance;
    await db.collection('pokemons').doc(id.toString()).update({
      'isFavorite': value,
    });
  }

  void addCommentToPokemonDoc(int id, String comment) {
    var db = FirebaseFirestore.instance;

    final commentObj = <String, dynamic>{"comment": comment};

    var setOptions = SetOptions(merge: true);

    db.collection('pokemons').doc(id.toString()).set(
          commentObj,
          setOptions,
        );
  }
}
