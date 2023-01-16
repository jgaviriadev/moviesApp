import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:themoviesdb/providers/movies_provider.dart';
import 'package:themoviesdb/widgets/widgets.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final moviesProvider = Provider.of<MoviesProvider>(context);

    return  Scaffold(
      appBar: AppBar(
        title: const Text('Peliculas en cine'),
        elevation: 0,
        centerTitle: true,
        // actions: [
        //   IconButton(
        //     icon: const Icon(Icons.search_outlined),
        //     onPressed: (){}, 
        //   )
        // ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children:[
            //card swipers
            CardSwiper(movies: moviesProvider.onDisplayMovies),
            //listado horizontal de peliculas
            Movieslider(
              movies: moviesProvider.popularMovies,
              title: 'Populares',
              onNextPage: ()=> moviesProvider.getPopularmovies(),
            ),
          ],
       ),
      )
    );
  }
}