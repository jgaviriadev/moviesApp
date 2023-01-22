
import 'package:flutter/material.dart';
import '../../../models/movie.dart';

class PosterAndTitle extends StatelessWidget {
  
  final Movie movie;

  const PosterAndTitle({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final TextTheme textheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.only(top:20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              placeholder: const AssetImage('assets/no-image.jpg'), 
              image: NetworkImage(movie.fullPosterImg),
              height: 150,
              width: 100,
            ),
          ),
          const SizedBox(width: 20,),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: size.width - 190),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:[
                Text(
                  movie.title,
                  style: textheme.headline5,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                Text(
                  movie.originalTitle, 
                  style: textheme.headline5, 
                  overflow: TextOverflow.ellipsis, 
                  maxLines: 2
                ),
                Row(
                  children:[
                    const Icon(
                      Icons.star_outline, 
                      size: 15, 
                      color: Colors.grey,
                    ),
                    const SizedBox(width: 5,),
                    Text(
                      movie.voteAverage.toString(), 
                      style: textheme.caption,
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}