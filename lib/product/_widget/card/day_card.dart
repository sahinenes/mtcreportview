import 'package:flutter/material.dart';

import '../../../core/extension/context_extension.dart';
import '../text/textBody.dart';

class DayCardWidget extends StatelessWidget {
  DayCardWidget({super.key, required this.day, required this.selected});
  final String day;
  bool selected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 5),
      child: Container(
          alignment: Alignment.center,
          width: context.width / 8.18,
          decoration: BoxDecoration(
              border: Border.all(color: selected ? context.theme.colorScheme.secondary : context.theme.colorScheme.outline, width: 1.2),
              color: selected ? context.theme.colorScheme.secondary : const Color.fromRGBO(245, 245, 245, 1),
              borderRadius: BorderRadius.circular(12)),
          child: MyTextBodyWidget(
            text: day.substring(0, 2),
            textStyle: context.textStyleBody.copyWith(color: selected ? context.theme.colorScheme.surface : context.theme.colorScheme.secondary),
          )),
    );
  }
}
