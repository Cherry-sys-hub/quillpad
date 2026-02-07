import 'package:flutter_riverpod/legacy.dart';

class NoteModel {
 final String title;
 final String content;
 final int colorValue;

 NoteModel({
   required this.title,
   required this.content,
   required this.colorValue,
});
}

class NewNote extends StateNotifier<List<NoteModel>>{

  NewNote() : super([]);

  void addNotes (NoteModel note) {
    state = [...state,note];
  }

  void updateNote(int index, NoteModel note) {
    final list = List.of(state);
    list[index] = note;
    state = list;
  }
}

final noteNotifier = StateNotifierProvider<NewNote , List<NoteModel>>((ref) {
  return NewNote();
});