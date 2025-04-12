import 'package:codex_flutter_g1/features/news/view/manager/news_cubit.dart';
import 'package:codex_flutter_g1/features/news/view/widgets/news_error_widget.dart';
import 'package:codex_flutter_g1/features/news/view/widgets/success_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsScreen extends StatelessWidget {
 const  NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            onTap: (index){
              context.read<NewsCubit>().getToHeadLinesByTabBar(index: index);
            },
              isScrollable: true,
              tabs: [
            Tab(text: "General",),
            Tab(text: "Business",),
            Tab(text: "Entertainment",),
            Tab(text: "Health",),
            Tab(text: "Science",),
          ]),
          title: Text("News",style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white
          ),
          ),
          backgroundColor: Colors.green,
        ),

        body: BlocBuilder<NewsCubit, NewsState>(
  builder: (context, state) {
     if(state  is NewsLoadingState){
       return Center(child: CircularProgressIndicator(),);
     }
     else if (state is NewsSuccessState) {
    return SuccessWidget(articles: context.read<NewsCubit>().newsResponseModel!.articles,);
     }
  else if (state is NewsErrorState) {
    return NewsErrorWidget(errorMessage: state.error,);
     }
  else{
    return SizedBox();
     }
  },
)
      ),
    );
  }
}