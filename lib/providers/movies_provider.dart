import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:themoviesdb/models/models.dart';


class MoviesProvider extends ChangeNotifier{

  final String _baseurl = 'api.themoviedb.org';
  final String _apiKey = 'b90178836013fdf7bc222e4e78156023';
  final String _lang = 'es-ES';

  List<Movie> onDisplayMovies = [];
  List<Movie> popularMovies = [];

  Map <int, List<Cast>> moviesCast = {};

  int _popularPage=0;
  //constructor
  MoviesProvider(){
    getOnDisplayMovies();
    getPopularmovies();
  }


  Future <String> getJsonData(String endpoint, [int page=1]) async {
    var url = Uri.https(_baseurl, endpoint, {
      'api_key' : _apiKey,
      'language' : _lang,
      'page' : '$page'
    });

    final response = await http.get(url);
    return response.body;
  }

  getOnDisplayMovies() async {
    final jsonData = await getJsonData('3/movie/now_playing');
    final nowPlayingResponse = NowPlayingResponse.fromJson(jsonData);
    onDisplayMovies = nowPlayingResponse.results;
    notifyListeners(); //notifica que algo cambia para redibujar los wdg
  }

  getPopularmovies() async {
    _popularPage++;
    final jsonData = await getJsonData('3/movie/popular',_popularPage);
    final popularResponse = PopularResponse.fromJson(jsonData);
    popularMovies = [...popularMovies, ...popularResponse.results];

    notifyListeners(); //notifica que algo cambia para redibujar los wdg
  }
   Future<List<Cast>> getMovieCast (int movieId) async{
    
    if (moviesCast.containsKey(movieId)) return moviesCast[movieId]!;
    final jsonData = await getJsonData('3/movie/$movieId/credits');
    final creditsResponse = CreditsResponse.fromJson(jsonData);
    moviesCast[movieId] = creditsResponse.cast;
    return creditsResponse.cast;
   }

}