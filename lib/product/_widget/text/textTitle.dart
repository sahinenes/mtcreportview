import 'package:flutter/material.dart';

import '../../../core/extension/context_extension.dart';

@immutable
class MyTextTitleWidget extends StatelessWidget {
  MyTextTitleWidget({super.key, required this.text, this.textStyle});
  final String text;
  TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: textStyle ?? context.textStyleTitle,
    );
  }
}
