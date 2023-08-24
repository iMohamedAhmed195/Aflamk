import 'dart:async';

import 'package:clean_arch/core/utils/enums.dart';
import 'package:clean_arch/movies/domain/entities/movies_details.dart';
import 'package:clean_arch/movies/domain/entities/recommendation.dart';
import 'package:clean_arch/movies/domain/usecase/get_details_movies.dart';
import 'package:clean_arch/movies/domain/usecase/get_recommendation_movies.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'movies_details_event.dart';
part 'movies_details_state.dart';

class MoviesDetailsBloc extends Bloc<MoviesDetailsEvent, MoviesDetailsState> {
  MoviesDetailsBloc(this.getDetailsMoviesUseCase, this.getRecommendationUseCase)
      : super(const MoviesDetailsState()) {
    on<GetMoviesDetailsEvent>(_getMoviesDetailsEvent);
    on<GetMoviesRecommendationEvent>(_getMoviesRecommendationEvent);
  }
  final GetDetailsMoviesUseCase getDetailsMoviesUseCase;
  final GetRecommendationUseCase getRecommendationUseCase;

  FutureOr<void> _getMoviesDetailsEvent(
      GetMoviesDetailsEvent event, Emitter<MoviesDetailsState> emit) async {
    final result = await getDetailsMoviesUseCase(
        MoviesDetailsParameters(movieId: event.id));
    result.fold(
        (l) => emit(state.copyWith(
            moviesDetailsState: RequestState.error,
            moviesDetailsMessage: l.message)),
        (r) => emit(state.copyWith(
            moviesDetailsState: RequestState.loaded, moviesDetails: r)));
  }

  FutureOr<void> _getMoviesRecommendationEvent(GetMoviesRecommendationEvent event, Emitter<MoviesDetailsState> emit)async {
    final result = await getRecommendationUseCase(
        MoviesRecommendationParameters(movieId: event.id));
    result.fold(
            (l) => emit(state.copyWith(
            moviesRecommendationState: RequestState.error,
            moviesRecommendationMessage: l.message)),
            (r) => emit(state.copyWith(
            moviesRecommendationState: RequestState.loaded, recommendation: r)));
  }
}
