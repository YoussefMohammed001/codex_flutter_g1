import 'package:codex_flutter_g1/features/news/view/manager/news_cubit.dart';
import 'package:codex_flutter_g1/features/news/view/screens/news_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),

      home: BlocProvider(
        create: (context) => NewsCubit()..getTopHeadlines(category: 'general'),
        child: NewsScreen(),
      ),
    );
  }
}