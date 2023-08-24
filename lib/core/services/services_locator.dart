

import 'package:clean_arch/movies/data/datasource/movie_remote_data_soource.dart';
import 'package:clean_arch/movies/data/repository/movies_repository.dart';
import 'package:clean_arch/movies/domain/repository/base_movies_repository.dart';
import 'package:clean_arch/movies/domain/usecase/get_details_movies.dart';
import 'package:clean_arch/movies/domain/usecase/get_now_playing_movies.dart';
import 'package:clean_arch/movies/domain/usecase/get_popular_movies.dart';
import 'package:clean_arch/movies/domain/usecase/get_recommendation_movies.dart';
import 'package:clean_arch/movies/domain/usecase/get_top_rated_movies.dart';
import 'package:clean_arch/movies/presentation/controller/movies_details_controller/movies_details_bloc.dart';
import 'package:clean_arch/movies/presentation/controller/movies_home_controller/movies_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance ;
class ServicesLocator{
  void init(){
    ///Bloc
     sl.registerFactory( () => MoviesBloc(sl(),sl(),sl()));
     sl.registerFactory( () => MoviesDetailsBloc(sl(),sl()));
    ///use Cases
    sl.registerLazySingleton(() => GetNowPlayingMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetPopularMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetTopRatedMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetDetailsMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetRecommendationUseCase(sl()));
    ///Repository
    sl.registerLazySingleton<BaseMoviesRepository>(() => MoviesRepository(sl()));
    ///Data SOURCE
    sl.registerLazySingleton<BaseMoviesRemoteDataSource>(() => MoviesRemoteDataSource());

  }
}