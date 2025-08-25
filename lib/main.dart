import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notess_app/constants.dart';
import 'package:notess_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notess_app/models/note_model.dart';
import 'package:notess_app/simple_bloc_observer.dart';
import 'package:notess_app/views/notes_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  Bloc.observer = SimpleBlocObserver();
  await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());
  Hive.openBox(kNotesBox);
  runApp(Notes());
}

class Notes extends StatelessWidget {
  const Notes({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotesCubit(),
      child: MaterialApp(
        theme: ThemeData(brightness: Brightness.dark, fontFamily: "Poppins"),
        home: const NotesView(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
