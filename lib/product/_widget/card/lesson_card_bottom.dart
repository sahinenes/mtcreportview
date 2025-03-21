import 'package:flutter/material.dart';

import '../../../core/extension/context_extension.dart';
import '../text/textBody.dart';
import '../text/textTitle.dart';

class LessonCardBottomWidget extends StatelessWidget {
  const LessonCardBottomWidget({super.key, required this.name, required this.location, required this.hour, required this.homework});
  final String name;
  final String location;
  final String hour;
  final int homework;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: context.paddingNormal,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        color: context.theme.colorScheme.surface,
      ),
      width: context.width / 1.5,
      child: _titles(context),
    );
  }

  Widget _titles(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.start, children: [
      MyTextTitleWidget(
        text: name,
      ),
      SizedBox(
        height: context.height * 0.01,
      ),
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          location != ""
              ? Row(
                  children: [
                    const Icon(
                      Icons.pin_drop_outlined,
                      size: 18,
                      color: Color.fromRGBO(130, 130, 130, 1),
                    ),
                    SizedBox(width: context.width * 0.01),
                    MyTextBodyWidget(
                      text: location,
                      textStyle: context.textStyleBody.copyWith(color: const Color.fromRGBO(130, 130, 130, 1)),
                    ),
                  ],
                )
              : Container(),
          MyTextBodyWidget(
            text: hour,
            textStyle: context.textStyleBody.copyWith(color: const Color.fromRGBO(130, 130, 130, 1)),
          )
        ],
      ),
      Expanded(
          child: Align(
              alignment: Alignment.bottomLeft,
              child: MyTextBodyWidget(
                  textStyle: context.textStyleBody.copyWith(color: const Color.fromRGBO(242, 153, 74, 1)),
                  text: "You have $homework uncompled task")))
    ]);
  }
}
