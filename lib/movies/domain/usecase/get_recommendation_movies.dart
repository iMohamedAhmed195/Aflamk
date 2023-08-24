import 'package:clean_arch/core/error/failure.dart';
import 'package:clean_arch/core/usecase/base_usecase.dart';

import 'package:clean_arch/movies/domain/entities/recommendation.dart';
import 'package:clean_arch/movies/domain/repository/base_movies_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class GetRecommendationUseCase extends BaseUseCase<List<Recommendation> , MoviesRecommendationParameters>{
  final BaseMoviesRepository baseMoviesRepository;

  GetRecommendationUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, List<Recommendation>>> call(MoviesRecommendationParameters parameters) async{
    return await baseMoviesRepository.getMoviesRecommendation(parameters);
  }

}

class MoviesRecommendationParameters extends Equatable{
  final int movieId;

  const  MoviesRecommendationParameters({required this.movieId});

  @override
  // TODO: implement props
  List<Object?> get props => [movieId];
}