import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/providers/movie_provider.dart';

class Tasks extends StatefulWidget {
  const Tasks({super.key});

  @override
  State<Tasks> createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
  @override
  Widget build(BuildContext context) {
    var fav = context.watch<MovieProviders>().favList;
    return Scaffold(
      appBar: AppBar(
        title: Text("Favorite Provider ${fav.length}"),
      ),
      body: ListView.builder(
          itemCount: fav.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(10),
              child: ListTile(
                title: Text("Provider, ${fav[index]}"),
                trailing: TextButton(
                  onPressed: () {
                    context.read<MovieProviders>().removeFav(fav[index]);
                  },
                  child: const Text(
                    "Remove",
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
