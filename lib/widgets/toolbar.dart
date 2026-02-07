
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';

class ToolBar extends StatelessWidget {
  const ToolBar({
    super.key,
    required QuillController mainTxtController,
  }) : _mainTxtController = mainTxtController;

  final QuillController _mainTxtController;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          color: Colors.grey
      ),
      child: QuillSimpleToolbar(
        controller: _mainTxtController,
        config: QuillSimpleToolbarConfig(
          showUndo: false,
          multiRowsDisplay: false,
          showRedo: false,
          showFontSize: false,
          showAlignmentButtons: false,
          showSubscript: false,
          showSuperscript: false,
          showLink: false,
          showCenterAlignment: false,
          showClearFormat: false,
          showClipboardCopy: false,
          showBackgroundColorButton: true,
          showBoldButton: true,
          showClipboardCut: false,
          showClipboardPaste: false,
          showCodeBlock: false,
          showDividers: false,
          showFontFamily: false,
          showStrikeThrough: false,
          showColorButton: true,
          showDirection: false,
          showHeaderStyle: false,
          showIndent: false,
          showInlineCode: false,
          showItalicButton: true,
          showJustifyAlignment: false,
          showLeftAlignment: false,
          showLineHeightButton: true,
          showSearchButton: false,
          showQuote: false,
          showSmallButton: false,
          showRightAlignment: false,
          showListCheck: false,
          showListNumbers: false,
        ),
      ),
    );
  }
}
