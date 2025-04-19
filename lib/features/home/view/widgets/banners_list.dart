import 'package:carousel_slider/carousel_slider.dart';
import 'package:codex_flutter_g1/features/home/view/widgets/banner_item.dart';
import 'package:codex_flutter_g1/features/home/view_model/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BannersList extends StatelessWidget {
  const BannersList({super.key});

  @override
  Widget build(BuildContext context) {
    return       CarouselSlider.builder(
      itemCount: context.read<HomeCubit>().homeResponseModel.homeData.homeBanners.length,
      options: CarouselOptions(
        height: 200,
      ),
      itemBuilder: (BuildContext context, int index, int realIndex) {
        return BannerItem(index: index,);
        
      },);
  }
}
