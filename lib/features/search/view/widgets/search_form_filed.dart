import 'package:codex_flutter_g1/features/search/view_model/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchFormFiled extends StatelessWidget {
  const SearchFormFiled({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            onChanged: (v){
              print(v);
              context.read<SearchCubit>().searchForProducts(searchText: v);
            },

            // onFieldSubmitted: (v){
            //   context.read<SearchCubit>().searchForProducts(searchText: v);
            // },
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              hintText: 'Search',
              prefixIcon: Icon(Icons.search),

            ),
          ),
        );
      },
    );
  }
}
