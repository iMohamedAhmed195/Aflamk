class ApiConstance{
  static const baseUrl= 'https://api.themoviedb.org/3';
  static const apiKey= 'cca2824c679109c7f031db6a9ec92dc6';
  static const nowPlayingMoviesPath= '$baseUrl/movie/now_playing?api_key=$apiKey';
  static const popularMoviesPath= '$baseUrl/movie/popular?api_key=$apiKey';
  static const topRatedMoviesPath= '$baseUrl/movie/top_rated?api_key=$apiKey';
  static  detailsMoviesPath(int movieId)=> '$baseUrl/movie/$movieId?api_key=$apiKey';
  static  recommendationMoviesPath(int movieId)=> '$baseUrl/movie/$movieId/recommendations?api_key=$apiKey';
  static const String baseImageUrl= 'https://image.tmdb.org/t/p/w500';
  static  String imageUrl(String path)=> '$baseImageUrl$path';

}