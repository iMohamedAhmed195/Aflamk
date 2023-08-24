import 'dart:async';

import 'package:clean_arch/core/usecase/base_usecase.dart';
import 'package:clean_arch/core/utils/enums.dart';
import 'package:clean_arch/movies/domain/usecase/get_now_playing_movies.dart';
import 'package:clean_arch/movies/domain/usecase/get_popular_movies.dart';
import 'package:clean_arch/movies/domain/usecase/get_top_rated_movies.dart';
import 'package:clean_arch/movies/presentation/controller/movies_home_controller/movies_event.dart';
import 'package:clean_arch/movies/presentation/controller/movies_home_controller/movies_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  final GetPopularMoviesUseCase getPopularMoviesUseCase;
  final GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;
  MoviesBloc(this.getNowPlayingMoviesUseCase, this.getTopRatedMoviesUseCase,
      this.getPopularMoviesUseCase)
      : super(const MoviesState()) {
    on<GetNowPlayingMoviesEvent>(_getNowPlayingMovies);
    on<GetPopularMoviesEvent>(_getPopularMovies) ;
    on<GetTopRatedMoviesEvent>(_getTopRatedMovies) ;
  }

  FutureOr<void> _getNowPlayingMovies(GetNowPlayingMoviesEvent event, Emitter<MoviesState> emit) async{
    final result = await getNowPlayingMoviesUseCase(const NoParameters());
    result.fold(
          (l) =>
          emit(state.copyWith(nowPlayingState: RequestState.error, nowPlayingMessage: l.message)),
          (r) =>
          emit(state.copyWith(nowPlayingMovies: r, nowPlayingState: RequestState.loaded)),
    );
  }

  FutureOr<void> _getPopularMovies(GetPopularMoviesEvent event, Emitter<MoviesState> emit)async {
    final result = await getPopularMoviesUseCase(const NoParameters());
    result.fold(
            (l) =>
            emit (state.copyWith(popularState: RequestState.error, popularMessage: l.message)),
            (r) =>
            emit(state.copyWith(popularMovies: r,popularState: RequestState.loaded))
    );
  }

  FutureOr<void> _getTopRatedMovies(GetTopRatedMoviesEvent event, Emitter<MoviesState> emit)async {
    final result = await getTopRatedMoviesUseCase(const NoParameters());
    result.fold(
            (l) =>
            emit (state.copyWith(topRatedState: RequestState.error, topRatedMessage: l.message)),
            (r) =>
            emit(state.copyWith(topRatedMovies: r,topRatedState: RequestState.loaded))
    );
  }
}