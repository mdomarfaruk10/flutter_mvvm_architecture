




import 'package:mvvm/data/network/BaseApiServices.dart';
import 'package:mvvm/data/network/NetworkApiServices.dart';
import 'package:mvvm/model/movieslListModel.dart';
import 'package:mvvm/res/app_url.dart';

class HomeRepository{

  BaseApiServices _apiServices = NetworkApiServices() ;

  Future<MoviesListModel> fetchMoviesList()async{
    try{
      dynamic response = await _apiServices.getGetApiResponse(AppUrl.moviesListEntPoint);
      return response = MoviesListModel.fromJson(response);
    }catch(e){
      throw e;
    }
  }

}