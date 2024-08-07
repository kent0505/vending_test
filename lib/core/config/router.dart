import 'package:go_router/go_router.dart';

import '../../features/home/pages/home_page.dart';
import '../../features/home/pages/settings_page.dart';
import '../../features/machine/pages/add_machine_page.dart';
import '../../features/news/pages/news_page.dart';
import '../../features/news/pages/news_read_page.dart';
import '../../features/splash/onboard_page.dart';
import '../../features/splash/splash_page.dart';
import '../models/news.dart';

final routerConfig = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      path: '/onboard',
      builder: (context, state) => const OnboardPage(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: '/settings',
      builder: (context, state) => const SettingsPage(),
    ),
    GoRoute(
      path: '/news',
      builder: (context, state) => const NewsPage(),
    ),
    GoRoute(
      path: '/news-read',
      builder: (context, state) => NewsReadPage(
        news: state.extra as News,
      ),
    ),
    GoRoute(
      path: '/add',
      builder: (context, state) => const AddMachinePage(),
    ),
  ],
);
