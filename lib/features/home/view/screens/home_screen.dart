import 'package:carousel_slider/carousel_slider.dart';
import 'package:codex_flutter_g1/core/styles/app_colors.dart';
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
                  CarouselSlider.builder(

                      itemCount: context.read<HomeCubit>().homeResponseModel.homeData.homeBanners.length,

                      options: CarouselOptions(
                        height: 200,
                      ),
                    itemBuilder: (BuildContext context, int index, int realIndex) {
                        return Image.network(context.read<HomeCubit>().homeResponseModel.homeData.homeBanners[index].image,
                        height: 150,
                          fit: BoxFit.fill,
                        );
                  },),
                  Divider(),
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
                      return Container(
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all()
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
                      );

                    }, gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing:  10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 0.75,
                    crossAxisCount: 2) , ),

                ],
              ),
            ),
          )  : SizedBox();
        },
      ),
    );
  }
}
