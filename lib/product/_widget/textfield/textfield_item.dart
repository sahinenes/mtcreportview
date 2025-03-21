import 'package:flutter/material.dart';

import '../../../core/extension/context_extension.dart';

class myTextFieldItem extends StatelessWidget {
  const myTextFieldItem({super.key, required this.value, required this.onChange, required this.menuItems});
  final Object? value;
  final Function(Object?) onChange;
  final List<DropdownMenuItem<String>> menuItems;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(left: 10),
          width: context.width,
          color: const Color.fromRGBO(236, 239, 241, 1),
          child: DropdownButton(
              dropdownColor: const Color.fromRGBO(236, 239, 241, 1),
              borderRadius: BorderRadius.circular(4),
              elevation: 0,
              alignment: Alignment.center,
              underline: Container(),
              value: value,
              style: context.textStyleBody.copyWith(color: context.theme.colorScheme.outline),
              items: menuItems,
              onChanged: onChange),
        ),
        SizedBox(
          height: context.height * 0.02,
        ),
      ],
    );
  }
}
