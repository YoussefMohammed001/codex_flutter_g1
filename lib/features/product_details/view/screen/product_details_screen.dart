import 'package:carousel_slider/carousel_slider.dart';
import 'package:codex_flutter_g1/core/styles/app_colors.dart';
import 'package:codex_flutter_g1/features/product_details/product_details_args.dart';
import 'package:codex_flutter_g1/features/product_details/view_model/product_details_cubit.dart';
import 'package:codex_flutter_g1/shared/widgets/discount_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:readmore/readmore.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key, required this.productDeailsArgs, });
  final ProductDeailsArgs productDeailsArgs;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => ProductDetailsCubit()..getProductDetails(productId: productDeailsArgs.productId),
  child: Scaffold(
      appBar: AppBar(
        title: Text("Product Details"),
      ),
      body: BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
        builder: (context, state) {
          if(state is ProductDetailsLoading){

            return Center(child: CircularProgressIndicator());
          }else if( state is ProductDetailsSuccess){
           return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CarouselSlider.builder(
                    itemCount: context.read<ProductDetailsCubit>().productDetailsModelResponse.data!.images.length,
                    itemBuilder: (BuildContext context, int index, int realIndex) {
                      return Image.network(context.read<ProductDetailsCubit>().productDetailsModelResponse.data!.images[index],
                        fit: BoxFit.fill,
                      );
                    },
                    options: CarouselOptions(
                      height: 200,
                      autoPlay: true,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10,),
                        Divider(),
                        SizedBox(height: 10,),
                        Row(
                          children: [
                            Expanded(
                              child: Text(context.read<ProductDetailsCubit>().productDetailsModelResponse.data!.name,
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 17,
                                ),
                              ),
                            ),
                            IconButton(onPressed: (){}, icon: Icon(Icons.favorite_border_rounded,
                              color: Colors.red,
                            )),
                            IconButton(onPressed: (){}, icon: Icon(Icons.add_shopping_cart_rounded,
                              color: AppColors.secondaryColor,
                            )),

                          ],
                        ),
                        SizedBox(height: 10,),
                        Divider(),
                        SizedBox(height: 10,),
                        Row(
                          children: [
                            Text("${context.read<ProductDetailsCubit>().productDetailsModelResponse.data!.price} EGP",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                            ),
                            ),
                            SizedBox(width: 10,),
                            Visibility(
                              visible:  context.read<ProductDetailsCubit>().productDetailsModelResponse.data!.discount != 0,
                              child: Row(
                                children: [
                                  Text("${context.read<ProductDetailsCubit>().productDetailsModelResponse.data!.oldPrice} EGP",
                                  style: TextStyle(
                                    color: Colors.red,
                                    decoration: TextDecoration.lineThrough,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  ),
                                  SizedBox(width: 10,),
                                  DiscountWidget(discount: context.read<ProductDetailsCubit>().productDetailsModelResponse.data!.discount,)
                                ],
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 10,),
                        Divider(),
                        SizedBox(height: 10,),
                        Text("Description",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(height: 5,),
                        ReadMoreText(
                          context.read<ProductDetailsCubit>().productDetailsModelResponse.data!.description,
                          trimMode: TrimMode.Line,
                          trimLines: 15,
                          colorClickableText: Colors.pink,
                          trimCollapsedText: 'Show more',
                          trimExpandedText: 'Show less',
                          moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                        ),

                      ],
                    ),
                  ),

                ],
              ),
            );
          } else if(state is ProductDetailsError){
           return Center(child: Text(state.message));
          }else{
            return SizedBox();
          }
          //
          // return state is ProductDetailsLoading ? Center(child: CircularProgressIndicator(),):
          //
          // state is ProductDetailsSuccess ?
          // SingleChildScrollView(
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //              CarouselSlider.builder(
          //                itemCount: context.read<ProductDetailsCubit>().productDetailsModelResponse.data.images.length,
          //                itemBuilder: (BuildContext context, int index, int realIndex) {
          //                  return Image.network(context.read<ProductDetailsCubit>().productDetailsModelResponse.data.images[index],
          //                  fit: BoxFit.fill,
          //                  );
          //                },
          //                options: CarouselOptions(
          //                  height: 200,
          //                  autoPlay: true,
          //                ),
          //              ),
          //       Padding(
          //         padding: const EdgeInsets.all(15),
          //         child: Column(
          //           crossAxisAlignment: CrossAxisAlignment.start,
          //           children: [
          //             SizedBox(height: 10,),
          //             Divider(),
          //             SizedBox(height: 10,),
          //             Row(
          //               children: [
          //                 Expanded(
          //                   child: Text(context.read<ProductDetailsCubit>().productDetailsModelResponse.data.name,
          //                   style: TextStyle(
          //                     fontWeight: FontWeight.w700,
          //                     fontSize: 17,
          //                   ),
          //                   ),
          //                 ),
          //                 IconButton(onPressed: (){}, icon: Icon(Icons.favorite_border_rounded,
          //                 color: Colors.red,
          //                 )),
          //
          //               ],
          //             ),
          //             SizedBox(height: 10,),
          //             Divider(),
          //             SizedBox(height: 10,),
          //             Text("Description",
          //             style: TextStyle(
          //               fontWeight: FontWeight.w700,
          //               fontSize: 20,
          //             ),
          //             ),
          //             SizedBox(height: 5,),
          // ReadMoreText(
          //   context.read<ProductDetailsCubit>().productDetailsModelResponse.data.description,
          // trimMode: TrimMode.Line,
          // trimLines: 15,
          // colorClickableText: Colors.pink,
          // trimCollapsedText: 'Show more',
          // trimExpandedText: 'Show less',
          // moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          // ),
          //
          //           ],
          //         ),
          //       ),
          //
          //     ],
          //   ),
          // )
          //
          // :
          //     state is ProductDetailsError ? Text("error") :
          //         SizedBox()
          // ;
        },
      ),
    ),
);
  }
}
