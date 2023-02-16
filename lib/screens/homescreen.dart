import 'package:flutter/material.dart';
import 'package:itelective5/shared%20widget/leftdrawer.dart';
import 'package:itelective5/shared%20widget/rightdrawer.dart';
import 'package:itelective5/models/pokeapi.dart';
import 'package:itelective5/models/pokemon.dart';

class Homescreen extends StatefulWidget {
  final Map<String, dynamic> userData;

  Homescreen({required this.userData});

  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  late Future<List<Pokemon>> _futurePokemonList;

  @override
  void initState() {
    super.initState();
    _futurePokemonList = PokeAPI.fetchPokemonList();
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
            ? LeftDrawer(userData: widget.userData,)
            : null,
        body: Row(
          children: [
            MediaQuery.of(context).size.width > 600
                ? Flexible(flex: 1, child: LeftDrawer(userData: widget.userData))
                : Container(),
            Flexible(
              flex: 3,
              child: Center(
                child: FutureBuilder<List<Pokemon>>(
                  future: _futurePokemonList,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          final pokemon = snapshot.data![index];
                          return ListTile(
                            leading: Image.network(pokemon.imageUrl),
                            title: Text(pokemon.name),
                            subtitle: Text(
                                '${pokemon.types.join(', ')} • ${pokemon.weight} kg'),
                          );
                        },
                      );
                    } else if (snapshot.hasError) {
                      return Text('${snapshot.error}');
                    }
                    return CircularProgressIndicator();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
