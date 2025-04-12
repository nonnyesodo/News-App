import 'dart:convert';
import 'dart:developer';

import 'package:news_app/features/home/data/model/news_article.dart';
import 'package:news_app/features/home/data/model/news_category_model.dart';
import 'package:news_app/features/home/data/remote/home_repo.dart';
import 'package:news_app/global_widget/export.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeRepo homeRepo;
  HomeCubit(this.homeRepo) : super(HomeInitial()) {
    fetchNewsCategory();
  }

  NewsCategoryModel newsCategories = NewsCategoryModel();
  fetchNewsCategory() async {
    emit(FetchingCategory());
    try {
      final response = await homeRepo.getCategories();
      final body = jsonDecode(response.body);
      if (response.statusCode == 200) {
        newsCategories = NewsCategoryModel.fromJson(body);
        selectNewsCategory(
            category: newsCategories.categories?.first.file ?? '');
        emit(HomeLoaded());
      } else {
        ToastMessage.showErrorToast(message: body['message']);
        emit(HomeError());
      }
      log(body.toString());
    } catch (e) {
      log("news Category: $e");

      emit(HomeError());
    }
  }

  String selectedCategory = '';

  selectNewsCategory({required String category}) async {
    emit(HomeLoading());
    selectedCategory = category;
    emit(HomeLoaded());
    fetchArticleByCategory();
  }

  NewsArticleModel newsArticle = NewsArticleModel();
  fetchArticleByCategory() async {
    emit(FetchingArticle());
    try {
      final response = await homeRepo.getArticles(selectedCategory);
      final body = jsonDecode(response.body);
      if (response.statusCode == 200) {
        newsArticle = NewsArticleModel.fromJson(body);
        emit(HomeLoaded());
      } else {
        ToastMessage.showErrorToast(message: body['message']);
        emit(HomeError());
      }
    } catch (e) {
      log("news Article: $e");

      emit(HomeError());
    }
  }
}
