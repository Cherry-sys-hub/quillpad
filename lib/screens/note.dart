import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notetaking/provider/noteprovider.dart';
import '../widgets/titletext.dart';
import '../widgets/toolbar.dart';

class Note extends ConsumerStatefulWidget {
  final NoteModel? existingNote;
  final int? index;

  const Note({super.key, this.existingNote, this.index});
  @override
  ConsumerState<Note> createState() => _NoteState();
}

class _NoteState extends ConsumerState<Note> {

  late QuillController _mainTxtController;
  late TextEditingController _titleController;

  @override
  void initState() {
    super.initState();

    _titleController = TextEditingController(
      text: widget.existingNote?.title ?? '',
    );

    if (widget.existingNote != null) {
      final doc = Document.fromJson(jsonDecode(widget.existingNote!.content));
      _mainTxtController = QuillController(
        document: doc,
        selection: const TextSelection.collapsed(offset: 0),
      );
    } else {
      _mainTxtController = QuillController.basic();
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _mainTxtController.dispose();
    super.dispose();
  }

  void _saveNote() {
    final currentJson = jsonEncode(
        _mainTxtController.document.toDelta().toJson());
    final randomColor = Colors.primaries[Random().nextInt(
        Colors.primaries.length)];

    final newNote = NoteModel(
      title: _titleController.text.isEmpty ? "Untitled" : _titleController.text,
      content: currentJson,
      colorValue: widget.existingNote?.colorValue ??
          Colors.primaries[Random().nextInt(Colors.primaries.length)].value,
    );

    if (widget.index != null) {
      ref.read(noteNotifier.notifier).updateNote(widget.index!, newNote);
    } else {
      ref.read(noteNotifier.notifier).addNotes(newNote);
    }

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Padding(
        padding: const EdgeInsets.only(top: 12),
        child: Center(child: Text('Edit Note', style: GoogleFonts.inter(
            fontSize: 20,
            color: Colors.black,
            fontWeight: .bold,
            letterSpacing: 1
        ),)),
      ),
        actions: [IconButton(onPressed: _saveNote, icon: Icon(Icons.save))],
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(children: [
          Container(decoration: BoxDecoration(
          ),
            child: TitleText(titleController: _titleController),
          ),
          SizedBox(height: 25,),

          Expanded(child: QuillEditor.basic(
            controller: _mainTxtController,
            config: QuillEditorConfig(
              placeholder: 'Your Message Here...',
              expands: true,
              customStyles: DefaultStyles(paragraph: DefaultTextBlockStyle(
                  GoogleFonts.poppins(color: Colors.black, fontSize: 22),
                  HorizontalSpacing(0, 0),
                  VerticalSpacing(0, 0),
                  VerticalSpacing(0, 0),
                  BoxDecoration()
              ),
              ),
            ),
          ),
          ),

          ToolBar(mainTxtController: _mainTxtController)
        ],
        ),
      ),
    );
  }
}