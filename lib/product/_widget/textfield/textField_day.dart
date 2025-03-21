import 'package:flutter/material.dart';

import '../../../core/extension/context_extension.dart';
import '../../../core/extension/string_extension.dart';
import '../../../core/init/language/language_keys.g.dart';
import '../text/textDropDown.dart';

class myTextFieldDay extends StatelessWidget {
  const myTextFieldDay({super.key, required this.value,  required this.onChange});
  final Object value;
  final Function(Object?) onChange;


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
            style:context.textStyleTitle,
            items: dropdownItems,
            onChanged: onChange
          ),
        ),
        SizedBox(
          height: context.height * 0.02,
        ),
      ],
    );
  }
}

List<DropdownMenuItem<String>> get dropdownItems {
  List<DropdownMenuItem<String>> menuItems = [
    DropdownMenuItem(value: LocaleKeys.monday.locale, child: MyTextDropDownWidget(text: LocaleKeys.monday)),
    DropdownMenuItem(value: LocaleKeys.tuesday.locale, child: MyTextDropDownWidget(text: LocaleKeys.tuesday)),
    DropdownMenuItem(value: LocaleKeys.wednesday.locale, child: MyTextDropDownWidget(text: LocaleKeys.wednesday)),
    DropdownMenuItem(value: LocaleKeys.thursday.locale, child: MyTextDropDownWidget(text: LocaleKeys.thursday)),
    DropdownMenuItem(value: LocaleKeys.friday.locale, child: MyTextDropDownWidget(text: LocaleKeys.friday)),
    DropdownMenuItem(value: LocaleKeys.saturday.locale, child: MyTextDropDownWidget(text: LocaleKeys.saturday)),
    DropdownMenuItem(value: LocaleKeys.sunday.locale, child: MyTextDropDownWidget(text: LocaleKeys.sunday)),
  ];
  return menuItems;
}
