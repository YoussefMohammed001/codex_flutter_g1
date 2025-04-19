import 'package:codex_flutter_g1/features/home/view/widgets/banners_list.dart';
import 'package:codex_flutter_g1/features/home/view/widgets/products_list.dart';
import 'package:codex_flutter_g1/features/home/view_model/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      HomeCubit()
        ..getHomeData(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return state is HomeLoading  ? Center(child: CircularProgressIndicator())  :

          state is HomeSuccess ?
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BannersList(),
                  Divider(),
                  ProductsList(),
                ],
              ),
            ),
          )  : SizedBox();
        },
      ),
    );
  }
}
