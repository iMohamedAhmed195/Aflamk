part of 'movies_details_bloc.dart';

class MoviesDetailsState extends Equatable {
  const MoviesDetailsState({
    this.recommendation = const [],
    this.moviesRecommendationState = RequestState.loading,
    this.moviesRecommendationMessage = '',
    this.moviesDetails,
    this.moviesDetailsState = RequestState.loading,
    this.moviesDetailsMessage = '',
  });
  final MoviesDetails? moviesDetails;
  final RequestState moviesDetailsState;
  final String moviesDetailsMessage;
  final List<Recommendation> recommendation;
  final RequestState moviesRecommendationState;
  final String moviesRecommendationMessage;
  MoviesDetailsState copyWith({
    MoviesDetails? moviesDetails,
    RequestState? moviesDetailsState,
    String? moviesDetailsMessage,
    List<Recommendation>? recommendation,
    RequestState? moviesRecommendationState,
    String? moviesRecommendationMessage,
  }) {
    return MoviesDetailsState(
        moviesDetails: moviesDetails ?? this.moviesDetails,
        moviesDetailsState: moviesDetailsState ?? this.moviesDetailsState,
        moviesDetailsMessage: moviesDetailsMessage ?? this.moviesDetailsMessage,
        recommendation: recommendation ?? this.recommendation,
        moviesRecommendationState:
            moviesRecommendationState ?? this.moviesRecommendationState,
        moviesRecommendationMessage:
            moviesRecommendationMessage ?? this.moviesRecommendationMessage);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        moviesDetails,
        moviesDetailsState,
        moviesDetailsMessage,
      ];
}
