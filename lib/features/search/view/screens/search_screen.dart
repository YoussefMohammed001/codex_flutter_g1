import 'package:codex_flutter_g1/features/search/view/widgets/search_form_filed.dart';
import 'package:codex_flutter_g1/features/search/view_model/search_cubit.dart';
import 'package:codex_flutter_g1/shared/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit()..searchForProducts(),
      child: Column(
        children: [
          SearchFormFiled(),
          BlocBuilder<SearchCubit, SearchState>(
            builder: (context, state) {
              if (state is SearchLoading) {
                return Center(child: CircularProgressIndicator());
              } else if (state is SearchFailure) {
                return Center(child: Text(state.message));
              } else if (state is SearchSuccess) {
                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Text(
                              "total results: ",
                              style: TextStyle(
                                color: Colors.grey.shade700,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              context
                                  .read<SearchCubit>()
                                  .searchResponseModel
                                  .searchData
                                  .total
                                  .toString(),
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Expanded(
                          child: GridView.builder(
                            shrinkWrap: true,
                            itemCount: context
                                .read<SearchCubit>()
                                .searchResponseModel
                                .searchData
                                .searchProducts
                                .length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 1,
                              childAspectRatio: 0.75,
                            ),
                            itemBuilder: (BuildContext context, int index) {
                              return ProductItem(
                                name: context
                                    .read<SearchCubit>()
                                    .searchResponseModel
                                    .searchData
                                    .searchProducts[index]
                                    .name,
                                image: context
                                    .read<SearchCubit>()
                                    .searchResponseModel
                                    .searchData
                                    .searchProducts[index]
                                    .image,
                                price: context
                                    .read<SearchCubit>()
                                    .searchResponseModel
                                    .searchData
                                    .searchProducts[index]
                                    .price,
                                productId: context
                                    .read<SearchCubit>()
                                    .searchResponseModel
                                    .searchData
                                    .searchProducts[index]
                                    .id,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              } else {
                return SizedBox();
              }
            },
          ),
        ],
      ),
    );
  }
}
