import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:themoviesdb/models/models.dart';
import 'package:themoviesdb/providers/movies_provider.dart';
import 'package:themoviesdb/widgets/widgets.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      appBar: AppBar(
        title: const Text('Peliculas en cine'),
        elevation: 0,
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.search_outlined),
            onPressed: (){}, 
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children:[
            //card swipers
            Selector<MoviesProvider, List<Movie>>(
              selector: (_, myType) => myType.onDisplayMovies,
              shouldRebuild: (a, b) => a != b,
              builder: (context, List<Movie> onDisplayMovies, _) {
                return CardSwiper(movies: onDisplayMovies);
              },
            ),
            //horizontal list of movies
            Selector<MoviesProvider, List<Movie>>(
              selector: (_, myType) => myType.popularMovies,
              shouldRebuild: (a, b) => a != b,
              builder: (context, List<Movie> popularMovies, _) {
                return Movieslider(
                  movies: popularMovies, 
                  onNextPage: () => context.read<MoviesProvider>().getPopularmovies(),
                );
              },
            )
          ],
       ),
      )
    );
  }
}