import 'package:codex_flutter_g1/core/routes/routes.dart';
import 'package:codex_flutter_g1/core/styles/app_colors.dart';
import 'package:codex_flutter_g1/features/home/model/home_response_model.dart';
import 'package:codex_flutter_g1/features/home/view_model/home_cubit.dart';
import 'package:codex_flutter_g1/features/product_details/product_details_args.dart';
import 'package:codex_flutter_g1/shared/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsList extends StatelessWidget {
  const ProductsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
            List<HomeProducts> homeProducts = context.read<HomeCubit>().homeResponseModel.homeData.homeProducts;
            return InkWell(
                onTap: (){
                  final int id = context.read<HomeCubit>().homeResponseModel.homeData.homeProducts[index].id;
                  Navigator.pushNamed(context, Routes.productDetails,arguments: ProductDeailsArgs(productId: id));
                },
                child: ProductItem(
                  image: homeProducts[index].image,
                  name: homeProducts[index].name,
                  price: homeProducts[index].price, productId: homeProducts[index].id,
                  discount: homeProducts[index].discount.toInt(),

                ));
          }, gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing:  10,
            crossAxisSpacing: 1,
            childAspectRatio: 0.75,
            crossAxisCount: 2) ,
        ),

      ],
    );
  }
}
