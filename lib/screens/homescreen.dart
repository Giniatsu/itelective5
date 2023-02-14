import 'package:flutter/material.dart';
import 'package:itelective5/screens/loginscreen.dart';
import 'package:itelective5/shared%20widget/leftdrawer.dart';
import 'package:itelective5/shared%20widget/rightdrawer.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Pokemon {
  final String name;
  final String imageUrl;

  Pokemon({required this.name, required this.imageUrl});
}

class Homescreen extends StatefulWidget {
  final Map<String, dynamic> userData;

  Homescreen({required this.userData});

  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  late List<Pokemon> _pokemonList;
  @override
  void initState() {
    super.initState();
    _getPokemonList();
  }

  void _getPokemonList() async {
    final response = await http
        .get(Uri.parse('https://pokeapi.co/api/v2/pokemon?limit=100'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final results = data['results'];

      setState(() {
        _pokemonList = results.map<Pokemon>((result) {
          final name = result['name'];
          final imageUrl =
              'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/${result['url'].split('/')[6]}.png';
          return Pokemon(name: name, imageUrl: imageUrl);
        }).toList();
      });
    } else {
      throw Exception('Failed to load Pokemon list');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Home Screen'),
          actions: [
            Builder(
              builder: (context) => IconButton(
                icon: CircleAvatar(
                  backgroundImage:
                      NetworkImage(widget.userData['picture']['thumbnail']),
                ),
                onPressed: () => Scaffold.of(context).openEndDrawer(),
              ),
            )
          ],
        ),
        endDrawer: RightDrawer(userData: widget.userData),
        drawer: MediaQuery.of(context).size.width < 600
            ? NavigationDrawer(userData: widget.userData,)
            : null,
        body: _pokemonList == null
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: _pokemonList.length,
                itemBuilder: (context, index) {
                  final pokemon = _pokemonList[index];
                  return ListTile(
                    leading: Image.network(pokemon.imageUrl),
                    title: Text(pokemon.name),
                  );
                },
              ),
      ),
    );
  }
}
