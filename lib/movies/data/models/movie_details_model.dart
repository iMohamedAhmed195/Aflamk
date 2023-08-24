import 'package:clean_arch/movies/data/models/genres_model.dart';
import 'package:clean_arch/movies/domain/entities/movies_details.dart';

class MoviesDetailsModel extends MoviesDetails {
  const MoviesDetailsModel(
      {required super.backdropPath,
      required super.id,
      required super.genres,
      required super.runTime,
      required super.overview,
      required super.releaseDate,
      required super.title,
      required super.voteAverage});

  factory MoviesDetailsModel.fromJson(Map<String, dynamic> json) =>
      MoviesDetailsModel(
          backdropPath: json['backdrop_path'],
          id: json['id'],
          genres: List<GenresModel>.from(
              json['genres'].map((x) => GenresModel.fromJson(x))),
          runTime: json['runtime'],
          overview: json['overview'],
          releaseDate: json['release_date'],
          title: json['title'],
          voteAverage: json['vote_average'].toDouble());
}
