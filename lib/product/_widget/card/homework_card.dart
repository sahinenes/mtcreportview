import 'package:flutter/material.dart';

import '../../../core/extension/context_extension.dart';
import '../text/textBody.dart';
import '../text/textTitle.dart';

class HomeworkCardWidget extends StatelessWidget {
  final bool check;
  final Function(bool? value)? checkChange;
  final String title;
  final String body;
  final String hour;
  final int color;

  const HomeworkCardWidget(
      {super.key, required this.check, this.checkChange, required this.title, required this.body, required this.hour, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8, bottom: 8),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
        boxShadow: [BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.07999999821186066), offset: Offset(0, 1), blurRadius: 4)],
        color: Color.fromRGBO(255, 255, 255, 1),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Checkbox(
            shape: const CircleBorder(),
            value: check,
            onChanged: checkChange,
          ),
          SizedBox(width: context.width * 0.02),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              MyTextTitleWidget(text: title),
              SizedBox(height: context.height * 0.02),
              SizedBox(
                width: context.width - 121,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                            width: 10,
                            height: 10,
                            decoration: BoxDecoration(
                              color: Color(color),
                              borderRadius: const BorderRadius.all(Radius.elliptical(10, 10)),
                            )),
                        SizedBox(
                          width: context.width * 0.01,
                        ),
                        MyTextBodyWidget(
                          text: body,
                          textStyle: context.textStyleBody.copyWith(color: const Color.fromRGBO(130, 130, 130, 1)),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.access_time_rounded,
                          color: Color.fromRGBO(130, 130, 130, 1),
                        ),
                        SizedBox(
                          width: context.width * 0.01,
                        ),
                        MyTextBodyWidget(
                          text: hour,
                          textStyle: context.textStyleBody.copyWith(color: const Color.fromRGBO(130, 130, 130, 1)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}


/*
class HomeworkCardWidget extends StatelessWidget {
  const HomeworkCardWidget({super.key, required this.check, required this.checkChange, required this.title, required this.body, required this.hour});
  final bool check;
  final Function(bool? value)? checkChange;
  final String title;
  final String body;
  final String hour;

  @override
  Widget build(BuildContext context) {
    Random random = Random();
    return Container(
      padding: EdgeInsets.zero,
      margin: const EdgeInsets.only(bottom: 5, top: 5),
      decoration: BoxDecoration(borderRadius: const BorderRadius.all(Radius.circular(12)), color: context.theme.colorScheme.background),
      width: context.width,
      height: context.height * 0.1,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Checkbox(
                shape: const CircleBorder(),
                value: check,
                onChanged: checkChange,
              ),
              SizedBox(
                width: context.width * 0.01,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyTextTitleWidget(text: title),
                  SizedBox(
                    height: context.height * 0.01,
                  ),
                  Row(
                    children: [
                      Container(
                        width: context.width * 0.02,
                        height: context.height * 0.02,
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(
                              random.nextInt(255),
                              random.nextInt(255),
                              random.nextInt(255),
                              1,
                            ),
                            shape: BoxShape.circle),
                        margin: const EdgeInsets.only(right: 5),
                      ),
                      MyTextBodyWidget(
                        text: body,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10, right: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.access_time_rounded,
                ),
                SizedBox(
                  width: context.width * 0.01,
                ),
                MyTextBodyWidget(text: hour)
              ],
            ),
          )
        ],
      ),
    );
  }
}
*/
/*

 Padding(
      padding: const EdgeInsets.only(top: 5, bottom: 5),
      child: CheckboxListTile(
        contentPadding: const EdgeInsets.only(top: 5, bottom: 5, right: 5, left: 5),
        controlAffinity: ListTileControlAffinity.leading,
        value: false,
        onChanged: (value) {},
        title: MyTextTitleWidget(
          text: "Sayfa 5-7",
        ),
        subtitle: MyTextBodyWidget(text: "Kalkülüs 2"),
        secondary: MyTextBodyWidget(
          text: "Sayfa 5-7",
        ),
      ),
    );

*/