import 'package:codex_flutter_g1/features/notes/notes_manager/notes_cubit.dart';
import 'package:codex_flutter_g1/features/notes/view/screens/notes_screen.dart';
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
       create: (context) {
         // final noteCubit = NotesCubit();
         // noteCubit.getNotes();
         // return noteCubit;
         return NotesCubit()..getNotes();
       },
        child: NotesScreen(),
      ),

    );
  }
}