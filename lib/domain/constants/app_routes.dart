import 'package:ecomm_474/ui/splash/splash_page.dart';
import 'package:ecomm_474/ui/user_on_boarding/login/login_page.dart';
import 'package:ecomm_474/ui/user_on_boarding/sign_up/sign_up_page.dart';
import 'package:flutter/cupertino.dart';

class AppRoutes {

  static const String SPLASH_ROUTE = "/splash";
  static const String LOGIN_ROUTE = "/login";
  static const String SIGNUP_ROUTE = "/signUp";
  static const String DASHBOARD_ROUTE = "/dashboard";


  static Map<String, WidgetBuilder> getRoutes() => {
    SPLASH_ROUTE: (context) => SplashPage(),
    LOGIN_ROUTE: (context) => LoginPage(),
    SIGNUP_ROUTE: (context) => SignUpPage(),
  };


}