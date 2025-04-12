import 'package:news_app/core/network/api_helper.dart';
import 'package:news_app/core/network/export_network.dart';

class HomeRepo {
  Future<Response> getCategories() async {
    return await ApiMethods.getMethod(url: ApiConstants.newsCategoryUrl);
  }

  Future<Response> getArticles(String category) async {
    return await ApiMethods.getMethod(url: ApiConstants.articleUrl(category));
  }
}
