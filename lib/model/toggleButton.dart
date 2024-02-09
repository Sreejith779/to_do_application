import 'package:flutter/material.dart';


class ToggleButton extends StatefulWidget {
  const ToggleButton({super.key});

  @override
  State<ToggleButton> createState() => _ToggleButtonState();
}

class _ToggleButtonState extends State<ToggleButton> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _toggleButton("In Progress","To Do","Done","Upcoming")
      ],
    );
  }
  Widget _toggleButton(String text, String text1, String text2, String text3){
    return Row(
      children: [
        TextButton(onPressed: (){},
            child: Text(text,)),
        TextButton(onPressed: (){},
            child: Text(text1)),
        TextButton(onPressed: (){},
            child: Text(text2)),
        TextButton(onPressed: (){},
            child: Text(text3)),
      ],
    );
  }
}
