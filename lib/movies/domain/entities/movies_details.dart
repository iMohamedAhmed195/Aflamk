import 'package:clean_arch/movies/domain/entities/genres.dart';
import 'package:equatable/equatable.dart';

class MoviesDetails extends Equatable {
  final String backdropPath;
  final List<Genres> genres;
  final int id;
  final int runTime;
  final String overview;
  final String releaseDate;
  final String title;
  final double voteAverage;

  const MoviesDetails(
      {required this.backdropPath,
      required this.id,
      required this.genres,
      required this.runTime,
      required this.overview,
      required this.releaseDate,
      required this.title,
      required this.voteAverage});

  @override
  // TODO: implement props
  List<Object?> get props => [
        backdropPath,
        id,
        genres,
        runTime,
        overview,
        releaseDate,
        title,
        voteAverage
      ];
}
