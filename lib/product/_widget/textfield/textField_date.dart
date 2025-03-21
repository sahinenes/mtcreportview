import 'package:flutter/material.dart';

import '../../../core/extension/context_extension.dart';
import '../../../core/extension/string_extension.dart';

class myTextFieldDate extends StatelessWidget {
  myTextFieldDate({super.key, required this.hintText, this.value});
  final String hintText;
  String? value;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(236, 239, 241, 1),
      width: context.width / 2.4,
      height: context.height * 0.08,
      alignment: Alignment.center,
      child: TextField(
        autofocus: false,
        enabled: false,
        style: context.textStyleBody,
        maxLines: 1,
        decoration: InputDecoration(
            labelText: value,
            disabledBorder: const OutlineInputBorder(borderSide: BorderSide(width: 0, color: Color.fromRGBO(236, 239, 241, 1))),
            hintText: hintText.locale,
            prefixIcon: const Icon(
              Icons.access_time_rounded,
            ),
            labelStyle: context.textStyleBody.copyWith(color: context.theme.colorScheme.shadow),
            // enabledBorder: OutlineInputBorder(borderSide: BorderSide()),
            enabledBorder: const OutlineInputBorder(borderSide: BorderSide(width: 0, color: Color.fromRGBO(236, 239, 241, 1))),
            border: const OutlineInputBorder(borderSide: BorderSide(width: 0, color: Color.fromRGBO(236, 239, 241, 1))),
            fillColor: context.theme.colorScheme.surface,
            hintStyle: context.textStyleBody),
      ),
    );
  }
}
