
import 'package:flutter/material.dart';

import '../screens/note.dart';

class AddButton extends StatelessWidget {
  const AddButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      width: 80,
      child: FittedBox(
        child: FloatingActionButton(
          backgroundColor: Colors.red,
          shape: CircleBorder(),
          onPressed: () => Navigator.push(context,MaterialPageRoute(builder: (context) => Note())),
          child: Icon(Icons.add,size: 25,fontWeight: FontWeight.w400,color: Colors.white,
          ),
        ),
      ),
    );
  }
}
