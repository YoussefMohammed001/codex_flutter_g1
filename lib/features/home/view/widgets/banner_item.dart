import 'package:codex_flutter_g1/features/home/view_model/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BannerItem extends StatelessWidget {
  const BannerItem({super.key, required this.index});
final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),

        child: Image.network(context.read<HomeCubit>().homeResponseModel.homeData.homeBanners[index].image,
          height: 150,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
