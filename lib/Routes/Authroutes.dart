
import 'package:firebasedemo/config/import.dart';

Map<String, RouteType> authRoutes = {
  AppRoutes.login: (context, settings) =>  LoginScreen(),
  AppRoutes.signup: (context, settings) =>  SignupScreen(),
  AppRoutes.home: (context, settings) =>  Homescreen(),
};
