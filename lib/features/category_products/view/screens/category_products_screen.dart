import 'package:codex_flutter_g1/core/routes/routes.dart';
import 'package:codex_flutter_g1/features/category_products/view_model/category_products_cubit.dart';
import 'package:codex_flutter_g1/shared/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryProductsScreen extends StatelessWidget {
  const CategoryProductsScreen({super.key, required this.id});
final int id;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoryProductsCubit()..getCategoryProducts(id),
      child: Scaffold(
        appBar: AppBar(),
        body:         BlocBuilder<CategoryProductsCubit, CategoryProductsState>(
  builder: (context, state) {
   if(state is CategoryProductsLoading){

     return Center(child: CircularProgressIndicator());
   } else if( state is CategoryProductsSuccess){
     return GridView.builder(
         shrinkWrap: true,
         physics: NeverScrollableScrollPhysics(),
         itemCount: context.read<CategoryProductsCubit>().categoryProductsModel.data.data.length,
         itemBuilder: (BuildContext context, int index) {
           int id = context.read<CategoryProductsCubit>().categoryProductsModel.data.data[index].id;
           return ProductItem(
             image: context.read<CategoryProductsCubit>().categoryProductsModel.data.data[index].image,
             name: context.read<CategoryProductsCubit>().categoryProductsModel.data.data[index].name,
             price:context.read<CategoryProductsCubit>().categoryProductsModel.data.data[index].price,
             productId:id ,

           );
         }, gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
           mainAxisSpacing:  10,
           crossAxisSpacing: 1,
         childAspectRatio: 0.75,
           crossAxisCount: 2) ,
       );
   }else{
     return Center(child: Text('error'));
   }
  },
),
      ),
    );
  }
}
