
import 'package:flutter/cupertino.dart';
//import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:themoviesdb/models/models.dart';
import 'package:themoviesdb/providers/movies_provider.dart';


class CastingCards extends StatelessWidget {
  final int movieId;
  const CastingCards({Key? key, required this.movieId, }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    //final moviesProvider = Provider.of<MoviesProvider>(context, listen: false);

    return FutureBuilder(
      future: context.read<MoviesProvider>().getMovieCast(movieId),
      builder: (_, AsyncSnapshot<List<Cast>> snapshot){
        if(!snapshot.hasData){
          return Container(
            constraints: const BoxConstraints(maxHeight: 300),
            height: 180,
            child: const CupertinoActivityIndicator(),
          );
        }
        final List<Cast> cast = snapshot.data!;

        return Container(
        width: double.infinity,
          height: 180,
          margin: const EdgeInsets.only(bottom: 30),
          child: ListView.builder(
            itemCount: cast.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, int index) => _CastCard(actor: cast[index],),
          ),
        );
      }
    );
    
  }
}
 class _CastCard extends StatelessWidget {

  final Cast actor;

  const _CastCard({Key? key, required this.actor, }) : super(key: key);
   @override
   Widget build(BuildContext context) {
     return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: 110,
      height: 100,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              placeholder: const AssetImage('assets/no-image.jpg'), 
              image: NetworkImage(actor.fullProfilePath), 
              height: 140,
              width: 100,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 5,),
          Text(
            actor.name,
            maxLines: 2,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
     );
   }
 }