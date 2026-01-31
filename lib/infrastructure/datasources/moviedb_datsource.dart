import 'package:cinemapedia/config/const/environment.dart';
import 'package:cinemapedia/domain/datasources/movies_datasource.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/infrastructure/mappers/movie_mapper.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/moviedb_response.dart';
import 'package:dio/dio.dart';

class MoviedbDatasource extends MoviesDatasource {
  /*Esta es la base de la Url a la que se hara la conexión en esta se define
  la base de la Url (La parte que no cambia) y algunas parametros que implementra
  cuando se llame a la api tomando esta base*/
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {
        'api_key': Environment.theMovieDbKey,
        'language': 'es-Mx',
      },
    ),
  );

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    //Se hace el llamado a la api
    final response = await dio.get('/movie/new_playing');
    final movieDBResponse = MovieDbResponse.fromJson(response.data);
    //Información obtenida
    final List<Movie> movies = movieDBResponse.results
        .where((moviedb) => moviedb.posterPath != 'no-poster')
        .map((moviedb) => MovieMapper.movieDBToEntity(moviedb))
        .toList();
    throw movies;
  }
}
