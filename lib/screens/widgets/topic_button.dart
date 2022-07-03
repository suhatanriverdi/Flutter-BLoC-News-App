// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import '../constants/colors.dart';

class TagButton extends StatefulWidget {
  late double heigth;
  late double width;
  late String topic;

  late Color backgroundColor = transparent;
  late Color textColor = tagBackgroundColor;

  TagButton(
      {Key? key,
      required this.heigth,
      required this.width,
      required this.topic})
      : super(key: key);

  @override
  State<TagButton> createState() => _TagButtonState();
}

class _TagButtonState extends State<TagButton> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: widget.heigth,
        width: widget.width,
        child: OutlinedButton(
          onPressed: _onPressed,
          style: ButtonStyle(
            side: MaterialStateProperty.all(BorderSide(
                color: tagBackgroundColor, width: widget.width * 0.01)),
            backgroundColor: MaterialStateProperty.all(widget.backgroundColor),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(widget.width * 0.3),
              ),
            ),
          ),
          child: Text(
            widget.topic,
            style: TextStyle(color: widget.textColor),
          ),
        ),
      ),
    );
  }

  void _onPressed() {
    setState(() {
      if (widget.backgroundColor == transparent) {
        widget.backgroundColor = tagBackgroundColor;
        widget.textColor = white;
      } else {
        widget.backgroundColor = transparent;
        widget.textColor = tagBackgroundColor;
      }
    });
  }
}
