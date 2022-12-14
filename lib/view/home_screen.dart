import 'package:flutter/material.dart';
import 'package:mvvm/data/response/status.dart';
import 'package:mvvm/utils/routes/routes_name.dart';
import 'package:mvvm/view_models/home_view_model.dart';
import 'package:mvvm/view_models/user_view_models.dart';
import 'package:provider/provider.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

   HomeViewViewmodel homeViewViewmodel = HomeViewViewmodel();
  @override
  void initState(){

     homeViewViewmodel.FetchMoviesListApi();
     super.initState();
  }
  Widget build(BuildContext context) {
    final userRemove = Provider.of<UserViewModels>(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          InkWell(
            onTap: (){
              userRemove.remove().then((value) {
                Navigator.pushNamed(context, RoutesName.login,);
              });
            },
            child: Text("logout"),
          ),
        ],
      ),
      body: ChangeNotifierProvider<HomeViewViewmodel>(
        create: (BuildContext context) => homeViewViewmodel,
        child: Consumer<HomeViewViewmodel>(
          builder: (context,value, chill){
            switch(value.moviesList.status){
              case Status.LOADING:
                 return CircularProgressIndicator();
              case Status.ERROR:
                return Text(value.moviesList.message.toString());
              case Status.COMPLETED:
                return ListView.builder(
                  itemCount: value.moviesList.data!.movies!.length,
                    itemBuilder: (context,index){
                      return ListTile(
                        title: Text('${value.moviesList.data!.movies![index].title}'),
                      );
                    }
                );


            }
            return Container();
          },
        ),
      )


    );
  }
}
