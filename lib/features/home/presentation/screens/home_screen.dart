import 'package:codex_flutter_g1/core/di/di.dart';
import 'package:codex_flutter_g1/core/utils%20/safe_print.dart';
import 'package:codex_flutter_g1/features/home/presentation/manager/top_movies_cubit.dart';
import 'package:codex_flutter_g1/features/home/presentation/widgets/end_of_results_widget.dart';
import 'package:codex_flutter_g1/features/home/presentation/widgets/loading_widget.dart';
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
    cubit = TopMoviesCubit(getIt())..getTopMovies(isInitial: true);
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 100.h) {
        safePrint("end of list");
        cubit.getTopMovies();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: cubit,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Top Movies",
          ),
          centerTitle: true,
        ),
        body: BlocBuilder<TopMoviesCubit, TopMoviesState>(
          builder: (context, state) {
            if (state is TopMoviesLoading) {
              return LoadingWidget(
                length: 9,
              );
            }
            if (state is TopMoviesFailure) {
              return Center(child: Text(state.errorMessage));
            }
            if (state is TopMoviesSuccess) {
              return Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      controller: _scrollController,
                      itemCount: state.topMovies.length + 1,
                      itemBuilder: (BuildContext context, int index) {
                        if (index == state.topMovies.length) {
                          return cubit.isMorePages
                              ? LoadingWidget(
                                  length: 1,
                                )
                              : EndOfResultsWidget();
                        }
                        return MovieItem(
                          topMoviesEntity: state.topMovies[index],
                        );
                      },
                    ),
                  ),
                ],
              );
            }
            return SizedBox();
          },
        ),
      ),
    );
  }
}
