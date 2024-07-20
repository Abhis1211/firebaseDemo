import '../config/import.dart';

typedef RouteType = Widget Function(BuildContext, RouteSettings);

class Routes {
  static Map<String, RouteType> _resolveRoutes() {
    return {
      AppRoutes.login: (context, settings) => LoginScreen(),
      ...authRoutes,
    };
  }

  static Route onGenerateRoutes(RouteSettings settings) {
    var routes = _resolveRoutes();
    try {
      final child = routes[settings.name];

      return SlideRoute(builder: (c) => child!(c, settings));
    } catch (e) {
      throw const FormatException("--- Route doesn't exist");
    }
  }
}
