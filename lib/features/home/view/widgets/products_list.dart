import 'package:codex_flutter_g1/core/styles/app_colors.dart';
import 'package:codex_flutter_g1/features/home/view/widgets/product_item.dart';
import 'package:codex_flutter_g1/features/home/view_model/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsList extends StatelessWidget {
  const ProductsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Top Products",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w800,
            color: AppColors.secondaryColor,
          ),
        ),
        GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: context.read<HomeCubit>().homeResponseModel.homeData.homeProducts.length,
          itemBuilder: (BuildContext context, int index) {
            return ProductItem(index: index,);
          }, gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing:  10,
            crossAxisSpacing: 1,
            childAspectRatio: 0.8,
            crossAxisCount: 2) ,
        ),

      ],
    );
  }
}
