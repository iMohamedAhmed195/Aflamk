import 'package:clean_arch/core/error/failure.dart';
import 'package:clean_arch/core/usecase/base_usecase.dart';
import 'package:clean_arch/movies/domain/entities/Movie.dart';
import 'package:clean_arch/movies/domain/repository/base_movies_repository.dart';
import 'package:dartz/dartz.dart';

class GetPopularMoviesUseCase extends BaseUseCase<List<Movies>,NoParameters>{
  final BaseMoviesRepository baseMoviesRepository;

  GetPopularMoviesUseCase(this.baseMoviesRepository);
  @override
  Future<Either<Failure ,List<Movies>>> call(NoParameters parameters)async{
    return await baseMoviesRepository.getPopularMovies();
  }
}