import 'package:codex_flutter_g1/core/di/di.dart';
import 'package:codex_flutter_g1/core/network/app_end_points.dart';
import 'package:codex_flutter_g1/features/home/data/data_source/get_movies_api.dart';
import 'package:codex_flutter_g1/features/home/data/repository/top_movies_repository_imp.dart';
import 'package:codex_flutter_g1/features/home/domain/usecase/top_movies_use_case.dart';
import 'package:codex_flutter_g1/features/home/presentation/manager/top_movies_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TopMoviesCubit(getIt())
        ..getTopMovies(),
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
                itemCount: state.topMovies.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: EdgeInsets.all(5),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.r),
                      border: Border.all(color: Colors.black),
                    ),
                    child: Row(
                      children: [
                        Image.network(
                          AppEndPoints.baseImageIrl+state.topMovies[index].img,
                          height: 100.h,
                          width: 50.w,
                        ),
                        SizedBox(width: 10.w,),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Text( state.topMovies[index].title,
                                      maxLines: 1,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13.sp,
                                      ),
                                    ),
                                  ),
                                  Text( state.topMovies[index].date.toString(),
                                    style: TextStyle(
                                        color: Colors.grey.shade700
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(height: 5.h,),
                              Text(
                                state.topMovies[index].description,
                                maxLines: 3,
                              ),

                            ],
                          ),
                        ),

                      ],
                    ),
                  );
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
