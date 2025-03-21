import 'package:flutter/material.dart';

import '../../../core/extension/context_extension.dart';
import '../../../core/extension/string_extension.dart';

class myTextField extends StatelessWidget {
  myTextField({super.key, required this.hintText, this.onChanged, this.onSubmitted, this.controller, this.maxLines, this.onEditingComplete});
  final String hintText;
  Function(String val)? onChanged;
  Function(String val)? onSubmitted;
  Function()? onEditingComplete;
  TextEditingController? controller;
  int? maxLines;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: const Color.fromRGBO(236, 239, 241, 1),
          child: TextField(
            maxLength: 75,
            autofocus: false,
            onSubmitted: onSubmitted,
            onChanged: onChanged,
            onEditingComplete: onEditingComplete,
            style: context.textStyleBody,
            minLines: maxLines,
            maxLines: maxLines ?? 1,
            controller: controller,
            decoration: InputDecoration(
                counterText: "",
                focusColor: context.theme.colorScheme.surface,
                enabledBorder: const OutlineInputBorder(borderSide: BorderSide(width: 0, color: Color.fromRGBO(236, 239, 241, 1))),
                border: const OutlineInputBorder(borderSide: BorderSide(width: 0, color: Color.fromRGBO(236, 239, 241, 1))),
                fillColor: context.theme.colorScheme.surface,
                hoverColor: context.theme.colorScheme.surface,
                hintText: hintText.locale,
                hintStyle: context.textStyleBody),
          ),
        ),
        SizedBox(
          height: context.height * 0.02,
        ),
      ],
    );
  }
}
