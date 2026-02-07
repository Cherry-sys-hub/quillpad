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

  void updateNote(int index, NoteModel newNote) {
    state = [
      for (int i = 0; i < state.length; i++)
        if (i == index) newNote else state[i],
    ];
  }
}

final noteNotifier = StateNotifierProvider<NewNote , List<NoteModel>>((ref) {
  return NewNote();
});