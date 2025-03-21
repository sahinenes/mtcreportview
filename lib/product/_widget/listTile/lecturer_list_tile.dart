import 'package:flutter/material.dart';

import '../../../core/extension/context_extension.dart';
import '../text/textTitle.dart';

class LecturerListTileWidget extends StatelessWidget {
  const LecturerListTileWidget({super.key, required this.text, required this.check, this.onChanged});
  final String text;
  final bool check;
  final Function(bool?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      shape: const CircleBorder(side: BorderSide.none),
      tileColor: const Color.fromRGBO(245, 245, 245, 1),
      selectedTileColor: const Color.fromRGBO(245, 245, 245, 1),
      activeColor: const Color.fromRGBO(245, 245, 245, 1),
      checkColor: context.theme.colorScheme.outline,
      side: BorderSide(color: context.theme.colorScheme.secondary, width: 3),
      controlAffinity: ListTileControlAffinity.leading,
      checkboxShape: const CircleBorder(side: BorderSide(color: Color.fromRGBO(245, 245, 245, 1), width: 0)),
      value: check,
      onChanged: onChanged,
      title: MyTextTitleWidget(text: text),
    );
  }
}
