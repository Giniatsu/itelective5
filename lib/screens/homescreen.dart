import 'package:flutter/material.dart';
import 'package:itelective5/shared%20widget/leftdrawer.dart';
import 'package:itelective5/shared%20widget/rightdrawer.dart';
import 'package:itelective5/models/pokeapi.dart';
import 'package:itelective5/models/pokemon.dart';
import 'package:glassmorphism/glassmorphism.dart';

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
          title: Text('Pokemon Screen'),
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
            ? LeftDrawer(
                userData: widget.userData,
              )
            : null,
        body: Row(
          children: [
            MediaQuery.of(context).size.width > 600
                ? Flexible(
                    flex: 1, child: LeftDrawer(userData: widget.userData))
                : Container(),
            Flexible(
              flex: 3,
              child: LayoutBuilder(builder: (context, constraints) {
                if (constraints.maxWidth <= 600) {
                  return Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                      image: AssetImage('assets/images/pokemon.jpg'),
                      fit: BoxFit.cover,
                    )
                    ),
                    child: Center(
                      child: FutureBuilder<List<Pokemon>>(
                        future: _futurePokemonList,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return ListView.builder(
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) {
                                final pokemon = snapshot.data![index];
                                return GlassmorphicContainer(
                                  margin: EdgeInsets.all(10),
                                  width: 100,
                                  height: 75,
                                  borderRadius: 20,
                                  blur: 10,
                                  border: 2,
                                  alignment: Alignment.topLeft,
                                  linearGradient: LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [
                                        Color.fromARGB(255, 255, 255, 255)
                                            .withOpacity(0.1),
                                        Color.fromARGB(255, 255, 255, 255)
                                            .withOpacity(0.05),
                                      ],
                                      stops: [
                                        0.1,
                                        1
                                      ]),
                                  borderGradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [
                                      Color.fromARGB(255, 113, 160, 25)
                                          .withOpacity(0.5),
                                      Color.fromARGB(255, 134, 19, 119)
                                          .withOpacity(0.5),
                                    ],
                                  ),
                                  child: ListTile(
                                    hoverColor: Colors.black,
                                    leading: Image.network(pokemon.imageUrl),
                                    title: Text(pokemon.name),
                                    subtitle: Text(
                                        '${pokemon.types.join(', ')} • ${pokemon.weight} kg'),
                                  ),
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
                  );
                } else {
                  return Container(
                    decoration: BoxDecoration(image: DecorationImage(
                      image: AssetImage('assets/images/pokemon.jpg'), fit: BoxFit.cover,
                    )),
                    child: Center(
                      child: FutureBuilder<List<Pokemon>>(
                        future: _futurePokemonList,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 4,
                                childAspectRatio: 1.4,
                              ),
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) {
                                final pokemon = snapshot.data![index];
                                return GlassmorphicContainer(
                                  margin: EdgeInsets.all(10),
                                  width: 250,
                                  height: 250,
                                  borderRadius: 20,
                                  blur: 10,
                                  border: 2,
                                  alignment: Alignment.center,
                                  linearGradient: LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [
                                        Color.fromARGB(255, 255, 255, 255).withOpacity(0.1),
                                        Color.fromARGB(255, 255, 255, 255).withOpacity(0.05),
                                      ],
                                      stops: [
                                        0.1,
                                        1
                                      ]),
                                  borderGradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [
                                      Color.fromARGB(255, 113, 160, 25).withOpacity(0.5),
                                      Color.fromARGB(255, 134, 19, 119).withOpacity(0.5),
                                    ],
                                  ),
                                  child: Column(
                                    children: [
                                      Image.network(pokemon.imageUrl),
                                      Text(pokemon.name),
                                      Text(
                                          '${pokemon.types.join(', ')} • ${pokemon.weight} kg'),
                                    ],
                                  ),
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
                  );
                }
              }),
            ),
          ],
        ),
      ),
    );
  }
}
