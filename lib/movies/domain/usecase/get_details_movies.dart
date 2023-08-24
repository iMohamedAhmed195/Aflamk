
import 'package:clean_arch/core/error/failure.dart';
import 'package:clean_arch/core/usecase/base_usecase.dart';
import 'package:clean_arch/movies/domain/entities/movies_details.dart';
import 'package:clean_arch/movies/domain/repository/base_movies_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class  GetDetailsMoviesUseCase extends BaseUseCase<MoviesDetails,MoviesDetailsParameters>{
  final BaseMoviesRepository baseMoviesRepository;

  GetDetailsMoviesUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, MoviesDetails>> call(MoviesDetailsParameters parameters) async{
    return await baseMoviesRepository.getMoviesDetails(parameters);
  }


}

class MoviesDetailsParameters extends Equatable{
  final int movieId;

 const  MoviesDetailsParameters({required this.movieId});

  @override
  // TODO: implement props
  List<Object?> get props => [movieId];
}