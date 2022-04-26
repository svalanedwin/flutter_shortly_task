import 'package:flutter_shorlty_task/routes/app_routes.dart';
import 'package:flutter_shorlty_task/utils/bindings/introduction_view_binding.dart';
import 'package:flutter_shorlty_task/utils/bindings/shorten_view_binding.dart';
import 'package:flutter_shorlty_task/utils/bindings/welcome_view_binding.dart';
import 'package:flutter_shorlty_task/views/indroduction_view/introduction_view.dart';
import 'package:flutter_shorlty_task/views/shorten_view/shorten_view.dart';
import 'package:flutter_shorlty_task/views/welcome_view.dart';
import 'package:get/get.dart';

class AppViews{
  static final List<GetPage> appViews = <GetPage>[
     GetPage(name: AppRoutes.welcomeView,
      page: ()=>const WelcomeView(),
      binding: WelcomeViewBinding(),
     ),
    GetPage(name: AppRoutes.introductionView,
      page: ()=>const IntroductionView(),
      binding: IntroductionViewBinding(),
    ),
    GetPage(name: AppRoutes.shortenView,
      page: ()=>const ShortenView(),
      binding: ShortenViewBinding(),
    ),
  ];
}