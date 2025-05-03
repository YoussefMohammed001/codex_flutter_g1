import 'package:codex_flutter_g1/features/home/view/manager/home_cubit.dart';
import 'package:codex_flutter_g1/features/home/view/widgets/blog_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlogsList extends StatelessWidget {
  const BlogsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if(state is HomeLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }else if(state is HomeSuccess){
          return Expanded(
            child: ListView.separated(
              shrinkWrap: true,

              itemCount: context.read<HomeCubit>().blogModel.length,
              itemBuilder: (BuildContext context, int index) {
                return BlogItem(blogModel: context.read<HomeCubit>().blogModel[index],);
              }, separatorBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                ),
                child: const Divider(
                  thickness: 2,
                  color: Colors.grey,

                ),
              );
            },

            ),
          );
        }else if(state is HomeFailure){
          return Center(
            child: Text(state.error),
          );
        }else{
          return SizedBox();
        }


      },
    );
  }
}
