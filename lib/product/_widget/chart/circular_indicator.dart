import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../core/extension/context_extension.dart';
import '../text/locale/textBodyLocale.dart';
import '../text/textTitle.dart';

class CircularIndicatorWidget extends StatelessWidget {
  const CircularIndicatorWidget({super.key, required this.data, required this.text});
  final String data;
  final String text;

  @override
  Widget build(BuildContext context) {
    return chart(context);
  }

  Expanded chart(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircularPercentIndicator(
            backgroundColor: Colors.grey.withOpacity(0.1),
            animation: true,
            radius: context.width * 0.1,
            lineWidth: 6,
            percent: 0.1,
            center: MyTextTitleWidget(
              text: data,
              textStyle: context.textStyleTitle.copyWith(fontSize: 22),
            ),
            // progressColor: ColorManager.instance.colorScheme.secondary,
            linearGradient: LinearGradient(colors: [
              context.theme.colorScheme.secondary,
              context.theme.colorScheme.secondary.withOpacity(0.8),
            ]),
          ),
          SizedBox(
            height: context.height * 0.01,
          ),
          chartText(context, text)
        ],
      ),
    );
  }

  Widget chartText(BuildContext context, String text) {
    return Expanded(
      child: MyTextBodyLocaleWidget(
        text: text,
        textStyle: context.textStyle.copyWith(fontSize: 10, color: const Color.fromRGBO(130, 130, 130, 1)),
        textAlign: TextAlign.center,
      ),
    );
  }
}
/*
class MainChartWidget extends StatefulWidget {
  const MainChartWidget({super.key});

  @override
  State<MainChartWidget> createState() => _MainChartWidgetState();
}

class _MainChartWidgetState extends State<MainChartWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      alignment: Alignment.center,
      height: context.height * 0.2,
      width: context.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _chart1(context),
          _chart2(context),
          _chart3(context),
          _chart4(context),
        ],
      ),
    ));
  }

  Expanded _chart4(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          CircularPercentIndicator(
            animationDuration: 1000,
            backgroundColor: Colors.grey.withOpacity(0.1),
            animation: true,
            radius: context.width * 0.1,
            lineWidth: 8,
            percent: 0.90,
            center: MyTextTitleWidget(text: "90"),
            linearGradient: LinearGradient(colors: [
              context.theme.colorScheme.secondary,
              context.theme.colorScheme.secondary.withOpacity(0.8),
            ]),
            //progressColor: ColorManager.instance.colorScheme.secondary,
          ),
          SizedBox(
            height: context.height * 0.01,
          ),
          _chartText(LocaleKeys.chart_4)
        ],
      ),
    );
  }

  Expanded _chart3(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          CircularPercentIndicator(
            backgroundColor: Colors.grey.withOpacity(0.1),
            animation: true,
            radius: context.width * 0.1,
            lineWidth: 8,
            percent: 1,
            center: MyTextTitleWidget(text: "23"),
            // progressColor: ColorManager.instance.colorScheme.secondary,
            linearGradient: LinearGradient(colors: [
              context.theme.colorScheme.secondary,
              context.theme.colorScheme.secondary.withOpacity(0.8),
            ]),
          ),
          SizedBox(
            height: context.height * 0.01,
          ),
          _chartText(LocaleKeys.chart_3)
        ],
      ),
    );
  }

  Expanded _chart2(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          CircularPercentIndicator(
            backgroundColor: Colors.grey.withOpacity(0.1),
            animation: true,
            radius: context.width * 0.1,
            lineWidth: 8,
            percent: 0.4,
            center: MyTextTitleWidget(text: "15"),
            //progressColor: ColorManager.instance.colorScheme.secondary,
            linearGradient: LinearGradient(colors: [
              context.theme.colorScheme.secondary,
              context.theme.colorScheme.secondary.withOpacity(0.8),
            ]),
          ),
          SizedBox(
            height: context.height * 0.01,
          ),
          _chartText(LocaleKeys.chart_2)
        ],
      ),
    );
  }

  Expanded _chart1(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          CircularPercentIndicator(
            backgroundColor: Colors.grey.withOpacity(0.1),
            animation: true,
            radius: context.width * 0.1,
            lineWidth: 8,
            percent: 0.1,
            center: MyTextTitleWidget(text: "2"),
            // progressColor: ColorManager.instance.colorScheme.secondary,
            linearGradient: LinearGradient(colors: [
              context.theme.colorScheme.secondary,
              context.theme.colorScheme.secondary.withOpacity(0.8),
            ]),
          ),
          SizedBox(
            height: context.height * 0.01,
          ),
          _chartText(LocaleKeys.chart_1)
        ],
      ),
    );
  }

  Widget _chartText(String text) {
    return Expanded(
      child: MyTextBodyLocaleWidget(
        text: text,
        textStyle: context.textStyle.copyWith(fontSize: 11, color: const Color.fromRGBO(130, 130, 130, 1)),
        textAlign: TextAlign.center,
      ),
    );
  }
}
*/