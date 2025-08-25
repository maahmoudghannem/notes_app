import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:notess_app/constants.dart';
import 'package:notess_app/models/note_model.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());

  List? notes;

  fetchAllNotes() async {
    await Hive.openBox(kNotesBox);
    var notesBox = Hive.box(kNotesBox);
    notes = notesBox.values.toList();
    emit(NotesSuccess(notes!));
  }
}
