import 'package:flutter/material.dart';
import '../../../view/home/home_view.dart';
import '../../../view/machines/view/machines_view.dart';
import '../../../view/statitistics/view/statistics_view.dart';
import '../../../product/_view/not_found/not_found_page.dart';
import '../../constants/navigation/navigation_constants.dart';

class NavigationRoute {
  NavigationRoute._init();
  static final NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;

  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      case NavigationConstants.MACHINES:
        return normalNavigate(
          const MachinesView(),
          NavigationConstants.MACHINES,
        );

      case NavigationConstants.STATISTICS:
        return normalNavigate(
          const StatisticsView(),
          NavigationConstants.STATISTICS,
        );

      case NavigationConstants.HOME:
        return normalNavigate(const HomeView(), NavigationConstants.HOME);

      case NavigationConstants.DEFAULT:
        return normalNavigate(const HomeView(), NavigationConstants.DEFAULT);

      // case NavigationConstants.SETTINGS_WEB_VIEW:
      //   if (args.arguments is SettingsDynamicModel) {
      //     return normalNavigate(
      //       SettingsDynamicView(model: args.arguments as SettingsDynamicModel),
      //       NavigationConstants.SETTINGS_WEB_VIEW,
      //     );
      //   }
      //   throw NavigateException<SettingsDynamicModel>(args.arguments);

      default:
        return MaterialPageRoute(
          builder: (context) => NotFoundPage(onPressed: null),
        );
    }
  }

  MaterialPageRoute normalNavigate(Widget widget, String pageName) {
    return MaterialPageRoute(
      builder: (context) => widget,
      //analytciste görülecek olan sayfa ismi için pageName veriyoruz
      settings: RouteSettings(name: pageName),
    );
  }
}
