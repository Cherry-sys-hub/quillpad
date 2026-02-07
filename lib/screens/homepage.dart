import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notetaking/provider/noteprovider.dart';
import 'package:notetaking/screens/note.dart';
import '../widgets/addbutton.dart';

class Homepage extends ConsumerWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context , WidgetRef ref) {

    final notes = ref.watch(noteNotifier);

    return Scaffold(
      floatingActionButton: AddButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
        title: Center(child: Text('Recent Notes',style: GoogleFonts.inter(
          fontSize: 18,
          color: Colors.black,
          fontWeight: .bold,
          letterSpacing: 1
        ),),),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15 , vertical: 25),
        child: GridView.builder(
          itemCount: notes.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 15),
            itemBuilder: (context,index){
            final note = notes[index];

            String previewText;
            try{
              final decodeJson = jsonDecode(note.content);
              previewText = Document.fromJson(decodeJson).toPlainText();
            }catch(e) {
              previewText = note.content;
            }

              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color(note.colorValue),
                ),
                height: 45,
                padding: EdgeInsets.only(left: 10,top: 25,right: 15,bottom: 0),
              child: Column(
                mainAxisAlignment: .end,
                crossAxisAlignment: .start,
                children: [
                Text(note.title,style: GoogleFonts.inter(color: Colors.white,fontWeight: .bold,fontSize: 18 , letterSpacing: 1),),
                SizedBox(height: 5,),
                Text(previewText,style: GoogleFonts.poppins(color: Colors.white,fontSize: 18 , letterSpacing: 1),maxLines: 4,overflow: TextOverflow.ellipsis,),
                  IconButton(icon: Icon(Icons.edit,size: 25,color: Colors.white,),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Note(existingNote: note,index: index,),));
                  },
                  )

                ],),
              );
            }),
      ),
    );
  }
}
