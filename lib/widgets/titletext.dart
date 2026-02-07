import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleText extends StatelessWidget {
  const TitleText({
    super.key,
    required TextEditingController titleController,
  }) : _titleController = titleController;

  final TextEditingController _titleController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _titleController,
      textAlign: TextAlign.center,
      style: GoogleFonts.poppins(color: Colors.black,
          letterSpacing: 2,
          fontWeight: .w700,fontSize: 19),
      decoration: InputDecoration(
        enabledBorder: .none,
        focusedBorder: .none,
        errorBorder: .none,
        hintText: 'Enter Your Title....',
        hintStyle: GoogleFonts.poppins(fontWeight: .w700,fontSize: 19),
      ),
    );
  }
}
