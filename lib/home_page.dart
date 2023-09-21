import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/providers/movie_provider.dart';
import 'package:todo/tasks.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var fav = context.watch<MovieProviders>().favList;
    // print(fav);
    return Scaffold(
      appBar: AppBar(
        title: Text("provider ${fav.length}"),
      ),
      body: ListView.builder(
          itemCount: 40,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(10),
              child: ListTile(
                title: Text("Provider, $index"),
                trailing: GestureDetector(
                    onTap: () {
                      setState(() {
                        if (!fav.contains(index)) {
                          context.read<MovieProviders>().addtoList(index);
                        } else {
                          context.read<MovieProviders>().removeFav(index);
                        }
                      });
                    },
                    child: Icon(
                      Icons.favorite,
                      color: fav.contains(index) ? Colors.red : Colors.grey,
                    )),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (contex) => const Tasks()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
