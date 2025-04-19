import 'package:codex_flutter_g1/core/routes/routes.dart';
import 'package:codex_flutter_g1/core/styles/app_colors.dart';
import 'package:codex_flutter_g1/features/home/view_model/home_cubit.dart';
import 'package:codex_flutter_g1/features/product_details/product_details_args.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.index});
final int index;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        final int id = context.read<HomeCubit>().homeResponseModel.homeData.homeProducts[index].id;
        print("id ===> $id");
        Navigator.pushNamed(context, Routes.productDetails,
        arguments:  ProductDeailsArgs(
          productId: id,
        ),
        );
      },
      child: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
                color: AppColors.secondaryColor.withOpacity(0.3)
            )
        ),
        child: Stack(
          children: [
            Column(
              children: [
                Image.network(context.read<HomeCubit>().homeResponseModel.homeData.homeProducts[index].image,
                  height: 150,width: 150,
                ),
                Divider(),
                Text(context.read<HomeCubit>().homeResponseModel.homeData.homeProducts[index].name,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                    radius: 15,
                    backgroundColor: AppColors.primaryColor,
                    child: Icon(Icons.favorite_border_rounded,color: Colors.red,size: 15,)),
                CircleAvatar(
                    radius: 15,
                    backgroundColor: AppColors.primaryColor,
                    child: Icon(Icons.add_shopping_cart_rounded,color: AppColors.secondaryColor,size: 15,)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
