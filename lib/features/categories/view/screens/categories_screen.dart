import 'package:codex_flutter_g1/core/routes/routes.dart';
import 'package:codex_flutter_g1/features/categories/view_model/categories_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocBuilder, BlocProvider, ReadContext;

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoriesCubit()..getCategories(),
      child: BlocBuilder< CategoriesCubit, CategoriesState>(
  builder: (context, state) {
    return state is CategoriesLoading ? Center(child: CircularProgressIndicator()) :
    state is CategoriesFailure ? Center(child: Text("Error")) :
        state is CategoriesSuccess ?
    Scaffold(
        body: ListView.builder(
          itemCount: context.read<CategoriesCubit>().categoriesResponse.data.categories.length,
          itemBuilder: (BuildContext context, int index) {


            return InkWell(
              onTap: () {
                final int id = context.read<CategoriesCubit>().categoriesResponse.data.categories[index].id;

                Navigator.pushNamed(context, Routes.categoryProductsScreen,arguments: id);

              },
              child: Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Image.network(context.read<CategoriesCubit>().categoriesResponse.data.categories[index].image,
                    width: 100,
                        height: 100,
                    ),
                    SizedBox(width: 10,),
                    Text(context.read<CategoriesCubit>().categoriesResponse.data.categories[index].name,
                    style: TextStyle(
                      color: Colors.black,
                    fontWeight: FontWeight.bold,
                      fontSize: 20
                    ),
                    ),
                  ],
                ),
              ),
            );
          },

        ),
      ) : SizedBox();
  },
),
    );
  }
}
