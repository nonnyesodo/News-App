import 'package:news_app/core/config/page_route/route_name.dart';
import 'package:news_app/features/home/data/model/news_article.dart';
import 'package:news_app/features/home/presentation/pages/bottom_nav.dart';
import 'package:news_app/features/home/presentation/pages/news_detail.dart';
import 'package:news_app/features/home/presentation/pages/webview.dart';
import 'package:news_app/global_widget/export.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class AppRoute {
  // GoRouter configuration
  static final router = GoRouter(
    navigatorKey: navigatorKey,
    initialLocation: '/',
    routes: [
      GoRoute(
          path: RouteName.botomNav.path,
          builder: (context, state) {
            return BottomNav();
          }),
      GoRoute(
          path: RouteName.bookDetail.path,
          builder: (context, state) {
            final Clusters news = state.extra as Clusters;
            return NewsDetailPage(news: news);
          }),
      GoRoute(
          path: RouteName.webview.path,
          builder: (context, state) {
            final WebViewModel details = state.extra as WebViewModel;
            return AppWebviewPage(details: details);
          }),
    ],
  );
}
