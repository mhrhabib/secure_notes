import 'package:secure_notes/presentation/auth/signup_screen.dart';
import 'package:secure_notes/presentation/splash_screen/splash_screen.dart';
import 'package:secure_notes/presentation/splash_screen/binding/splash_binding.dart';
import 'package:secure_notes/presentation/getstarted_screen/getstarted_screen.dart';
import 'package:secure_notes/presentation/getstarted_screen/binding/getstarted_binding.dart';
import 'package:secure_notes/presentation/auth/login_screen.dart';
import 'package:secure_notes/presentation/auth/binding/login_binding.dart';
import 'package:secure_notes/presentation/main_page_screen/main_page_screen.dart';
import 'package:secure_notes/presentation/main_page_screen/binding/main_page_binding.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const String splashScreen = '/splash_screen';

  static const String getstartedScreen = '/getstarted_screen';

  static const String loginScreen = '/login_screen';
  static const String signUpScreen = '/signUp_screen';

  static const String mainPageScreen = '/main_page_screen';

  static const String taskSwipePage = '/task_swipe_page';

  static const String taskSwipeContainerScreen = '/task_swipe_container_screen';

  static const String addTodoScreen = '/add_todo_screen';

  static const String editTodoScreen = '/edit_todo_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String initialRoute = '/initialRoute';

  static List<GetPage> pages = [
    GetPage(
      name: splashScreen,
      page: () => SplashScreen(),
      bindings: [
        SplashBinding(),
      ],
    ),
    GetPage(
      name: getstartedScreen,
      page: () => GetstartedScreen(),
      bindings: [
        GetstartedBinding(),
      ],
    ),
    GetPage(
      name: loginScreen,
      page: () => LoginScreen(),
      bindings: [
        LoginBinding(),
      ],
    ),
    GetPage(
      name: signUpScreen,
      page: () => SignupScreen(),
      bindings: [
        LoginBinding(),
      ],
    ),
    GetPage(
      name: mainPageScreen,
      page: () => MainPageScreen(),
      bindings: [
        MainPageBinding(),
      ],
    ),
    GetPage(
      name: initialRoute,
      page: () => SplashScreen(),
      bindings: [
        SplashBinding(),
      ],
    )
  ];
}
