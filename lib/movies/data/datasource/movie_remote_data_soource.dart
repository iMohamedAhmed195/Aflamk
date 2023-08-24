import 'package:clean_arch/core/error/exceptions.dart';
import 'package:clean_arch/core/network/api_constaces.dart';
import 'package:clean_arch/core/network/error_message_model.dart';
import 'package:clean_arch/movies/data/models/movie_details_model.dart';
import 'package:clean_arch/movies/data/models/movies_model.dart';
import 'package:clean_arch/movies/data/models/recommendation_model.dart';

import 'package:clean_arch/movies/domain/usecase/get_details_movies.dart';
import 'package:clean_arch/movies/domain/usecase/get_recommendation_movies.dart';
import 'package:dio/dio.dart';
abstract class BaseMoviesRemoteDataSource {
  Future<List<MoviesModel>> getNowPlayingMovies();
   Future<List<MoviesModel>> getPopularMovies();
   Future<List<MoviesModel>> getTopRatedMovies();
   Future<MoviesDetailsModel> getMoviesDetails(MoviesDetailsParameters parameters);
   Future<List<RecommendationModel>> getRecommendationMovies(MoviesRecommendationParameters parameters);
}
class MoviesRemoteDataSource extends BaseMoviesRemoteDataSource{
  @override
  Future<List<MoviesModel>> getNowPlayingMovies() async {
    final response = await Dio().get(ApiConstance.nowPlayingMoviesPath);
    if (response.statusCode == 200) {
      return List<MoviesModel>.from((response.data['results'] as List)
          .map((e) => MoviesModel.fromJson(e)));
    }
    else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<MoviesModel>> getPopularMovies() async{
    final response = await Dio().get(ApiConstance.popularMoviesPath);

    if (response.statusCode == 200) {
      return List<MoviesModel>.from((response.data['results'] as List)
          .map((e) => MoviesModel.fromJson(e)));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<MoviesModel>> getTopRatedMovies() async{
    final response = await Dio().get(ApiConstance.topRatedMoviesPath);

    if (response.statusCode == 200) {
      return List<MoviesModel>.from((response.data['results'] as List)
          .map((e) => MoviesModel.fromJson(e)));
    }
    else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<MoviesDetailsModel> getMoviesDetails(MoviesDetailsParameters parameters) async{
    final response = await Dio().get(ApiConstance.detailsMoviesPath(parameters.movieId ));

    if (response.statusCode == 200) {
      return MoviesDetailsModel.fromJson(response.data);
    }
    else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<RecommendationModel>> getRecommendationMovies(MoviesRecommendationParameters parameters) async{
    // print('${parameters.movieId}');
    final response = await Dio().get(ApiConstance.recommendationMoviesPath(parameters.movieId));
     // print('========>> respon $response');
    if (response.statusCode == 200) {
      return List<RecommendationModel>.from((response.data['results'] as List)
          .map((e) => RecommendationModel.fromJson(e)));
    }
    else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
