import 'package:clean_arch/core/error/failure.dart';

import 'package:clean_arch/movies/domain/entities/Movie.dart';
import 'package:clean_arch/movies/domain/entities/movies_details.dart';
import 'package:clean_arch/movies/domain/entities/recommendation.dart';
import 'package:clean_arch/movies/domain/usecase/get_details_movies.dart';
import 'package:clean_arch/movies/domain/usecase/get_recommendation_movies.dart';
import 'package:dartz/dartz.dart';

abstract  class BaseMoviesRepository{


  Future<Either<Failure ,List<Movies>>> getNowPlayingMovies();
  Future<Either<Failure ,List<Movies>>> getPopularMovies();
  Future<Either<Failure ,List<Movies>>> getTopRatedMovies();
  Future<Either<Failure ,MoviesDetails>> getMoviesDetails(MoviesDetailsParameters parameters);
  Future<Either<Failure ,List<Recommendation>>> getMoviesRecommendation(
      MoviesRecommendationParameters parameters
      );
}