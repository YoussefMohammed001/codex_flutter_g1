import 'package:codex_flutter_g1/counter_manager/counter_cubit.dart';
import 'package:codex_flutter_g1/counter_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          useMaterial3: true,
        ),
        home: BlocProvider(
          create: (BuildContext context) => CounterCubit(),
          child:  CounterScreen(),

        )
    );
  }

}