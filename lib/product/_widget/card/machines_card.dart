import 'package:flutter/material.dart';

import '../../../core/extension/context_extension.dart';
import '../text/textBody.dart';
import '../text/textTitle.dart';

class MachinesCardWidget extends StatelessWidget {
  final String name;
  final String location;
  final String code;
  final String date;

  const MachinesCardWidget({
    super.key,
    required this.name,
    required this.location,
    required this.code,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.08),
            offset: Offset(0, 1),
            blurRadius: 4,
          ),
        ],
        color: Colors.white,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MyTextTitleWidget(text: name),

          MyTextBodyWidget(
            text: location,
            textStyle: context.textStyleBody.copyWith(
              color: const Color.fromRGBO(130, 130, 130, 1),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MyTextBodyWidget(
                text: code,
                textStyle: context.textStyleBody.copyWith(
                  color: const Color.fromRGBO(130, 130, 130, 1),
                ),
              ),
              Row(
                children: [
                  const Icon(
                    Icons.access_time_rounded,
                    size: 16,
                    color: Color.fromRGBO(130, 130, 130, 1),
                  ),
                  SizedBox(width: context.width * 0.01),
                  MyTextBodyWidget(
                    text: date,
                    textStyle: context.textStyleBody.copyWith(
                      color: const Color.fromRGBO(130, 130, 130, 1),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
