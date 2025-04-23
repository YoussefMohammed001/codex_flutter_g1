import 'package:codex_flutter_g1/core/routes/routes.dart';
import 'package:codex_flutter_g1/core/styles/app_colors.dart';
import 'package:codex_flutter_g1/features/product_details/product_details_args.dart';
import 'package:codex_flutter_g1/shared/widgets/discount_widget.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.image, required this.name, required this.price, required this.productId,  this.discount = 0,});
  final String image;
  final String name;
  final num price;
  final int productId;
  final int discount;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, Routes.productDetails,
        arguments: ProductDeailsArgs(productId: productId),
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
                Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: [
                    Image.network(image,
                      height: 150,width: 150,
                    ),
                    DiscountWidget(discount:discount ),

                  ],
                ),
                Divider(),
                Text("$price EGP",
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),

                Text(name,
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
            ),
          ],
        ),
      ),
    );
  }
}
