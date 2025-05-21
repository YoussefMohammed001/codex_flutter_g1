import 'package:codex_flutter_g1/core/di/di.dart';
import 'package:codex_flutter_g1/features/home/presentation/manager/top_movies_cubit.dart';
import 'package:codex_flutter_g1/features/home/presentation/widgets/movie_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

   final ScrollController _scrollController = ScrollController();

   late final TopMoviesCubit cubit;
   @override
  void initState() {
    super.initState();
    cubit =  TopMoviesCubit(getIt())..getTopMovies(isInitial: true);
    _scrollController.addListener((){
      if(_scrollController.position.pixels >=
      _scrollController.position.maxScrollExtent - 100.h){
        print("end of list");
        cubit.getTopMovies();
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: cubit,
      child: Scaffold(
        appBar: AppBar(title: Text("Top Movies",), centerTitle: true,),
        body: BlocBuilder<TopMoviesCubit, TopMoviesState>(
          builder: (context, state) {
            if (state is TopMoviesLoading) {
              return Center(child: CircularProgressIndicator());
            }
            if (state is TopMoviesFailure) {
              return Center(child: Text(state.errorMessage));
            } if(state is TopMoviesSuccess){
              return ListView.builder(
                controller: _scrollController,

                itemCount: state.topMovies.length+1,
                itemBuilder: (BuildContext context, int index) {
                  if(index == state.topMovies.length){
                    return   cubit.isMorePages ?Center(child: Lottie.asset("assets/json/loading.json",
                        height: 50.h,
                        width: 50.w
                    )) : Container(
alignment: Alignment.center,
                      margin: EdgeInsets.only(
                        top: 10.h
                      ),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade400,
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ]

                      ),
                      child: Text("-----End of results-----"),
                    );
                  }
                  return MovieItem(topMoviesEntity:  state.topMovies[index],);
                },

              );
            }
            return SizedBox();

          },
        ),
      ),
    );
  }
}
