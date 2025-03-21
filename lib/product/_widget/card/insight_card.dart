import 'package:flutter/material.dart';

import '../../../core/extension/context_extension.dart';
import '../text/locale/textBodyLocale.dart';
import '../text/locale/textTitleLocale.dart';

class InsightCardWidget extends StatelessWidget {
  const InsightCardWidget({super.key, required this.body});
  final String body;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.zero,
      margin: const EdgeInsets.only(bottom: 10, top: 10),
      decoration: const BoxDecoration(
        color: Color.fromRGBO(245, 245, 245, 1),
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      width: context.width,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(color: context.theme.colorScheme.secondary, borderRadius: const BorderRadius.all(Radius.elliptical(30, 30))),
              child: Icon(
                Icons.lightbulb_outlined,
                color: context.theme.colorScheme.surface,
              )),
          SizedBox(
            width: context.width * 0.02,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                MyTextTitleLocaleWidget(
                  text: "Insight",
                  textStyle: context.textStyleTitle.copyWith(color: context.theme.colorScheme.secondary),
                ),
                MyTextBodyLocaleWidget(
                  text: body,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
