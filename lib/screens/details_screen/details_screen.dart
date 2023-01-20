import 'package:flutter/material.dart';
import 'package:themoviesdb/models/models.dart';
import 'package:themoviesdb/widgets/widgets.dart';
import 'widgets/widgets.dart';


class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // cambiar luego poru una instacia de movie
    final Movie movie = ModalRoute.of(context)!.settings.arguments as Movie;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          CustomAppBar(movie: movie,),
          SliverList( 
            delegate:  SliverChildListDelegate([
              PosterAndTitle(movie: movie,),
              Overview(movie: movie),
              CastingCards(movieId: movie.id),
            ])
          )
        ],
      ),
    );
  }
}




