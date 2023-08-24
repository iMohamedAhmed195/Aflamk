import 'package:clean_arch/core/error/exceptions.dart';
import 'package:clean_arch/core/error/failure.dart';
import 'package:clean_arch/movies/data/datasource/movie_remote_data_soource.dart';
import 'package:clean_arch/movies/domain/entities/Movie.dart';
import 'package:clean_arch/movies/domain/entities/movies_details.dart';
import 'package:clean_arch/movies/domain/entities/recommendation.dart';
import 'package:clean_arch/movies/domain/repository/base_movies_repository.dart';
import 'package:clean_arch/movies/domain/usecase/get_details_movies.dart';
import 'package:clean_arch/movies/domain/usecase/get_recommendation_movies.dart';
import 'package:dartz/dartz.dart';

class MoviesRepository extends BaseMoviesRepository{
  final BaseMoviesRemoteDataSource baseMoviesRemoteDataSource ;

  MoviesRepository(this.baseMoviesRemoteDataSource);

  @override
  Future<Either<Failure ,List<Movies>>> getNowPlayingMovies() async{
   final result =  await baseMoviesRemoteDataSource.getNowPlayingMovies();
   try {
     return Right(result);
   }on ServerException catch(failure){
     return Left(ServerFailure(failure.errorMessageModel.statusMessage));
   }
  }

  @override
  Future<Either<Failure, List<Movies>>> getPopularMovies()async{

    final result =  await baseMoviesRemoteDataSource.getPopularMovies();
    try {
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movies>>> getTopRatedMovies() async{

    final result =  await baseMoviesRemoteDataSource.getTopRatedMovies();
    try {
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, MoviesDetails>> getMoviesDetails(MoviesDetailsParameters parameters)async {
    final result =  await baseMoviesRemoteDataSource.getMoviesDetails(parameters);
    try {
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Recommendation>>> getMoviesRecommendation(MoviesRecommendationParameters parameters)async  {
    final result =  await baseMoviesRemoteDataSource.getRecommendationMovies(parameters);
    try {
      print(result);
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }



}