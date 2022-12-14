
import 'package:flutter/cupertino.dart';
import 'package:mvvm/data/response/api_response.dart';
import 'package:mvvm/model/movieslListModel.dart';
import 'package:mvvm/respository/home_repository.dart';

class HomeViewViewmodel with ChangeNotifier{

  final _myRepo = HomeRepository();

  ApiResponse<MoviesListModel> moviesList = ApiResponse.loading();

  setMoviesList(ApiResponse<MoviesListModel>  response){
    moviesList= response;
    notifyListeners();

  }

  Future<void> FetchMoviesListApi() async{

    setMoviesList( ApiResponse.loading());

     _myRepo.fetchMoviesList().then((value) {
       setMoviesList( ApiResponse.compled(value));
     }).onError((error, stackTrace) {
       setMoviesList( ApiResponse.error(error.toString()));
     });
  }
}