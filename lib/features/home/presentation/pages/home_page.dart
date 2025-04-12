import 'package:http/http.dart';
import 'package:news_app/core/config/page_route/route_name.dart';
import 'package:news_app/features/home/presentation/bloc/cubit/home_cubit.dart';
import 'package:news_app/global_widget/export.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final watchHome = context.watch<HomeCubit>();
    final readHome = context.read<HomeCubit>();
    return Scaffold(
        backgroundColor: AppColors.white,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              70.verticalSpace,
              Row(
                children: [
                  AppNetwokImage(
                      height: size.width * 0.14,
                      width: size.width * 0.14,
                      radius: 200.r,
                      imageUrl: ""),
                  5.horizontalSpace,
                  SizedBox(
                    width: size.width * 0.5,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              AppText(
                                  text: 'Hi ',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600),
                              AppText(
                                  text: "User",
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600),
                            ],
                          ),
                          AppText(text: "email@gmail.com", fontSize: 12),
                        ]),
                  ),
                  Spacer(),
                  GestureDetector(
                      onTap: () {},
                      child: Icon(Icons.notifications_outlined, size: 25.sp))
                ],
              ),
              10.verticalSpace,
              AppText(
                  text: 'Let\'s Find \nYour Best News!',
                  fontWeight: FontWeight.w600,
                  fontSize: 20),
              ApptextField(hintText: 'search'),
              20.verticalSpace,
              if (watchHome.newsCategories.categories?.isEmpty ?? true)
                Column(
                  children: [
                    120.verticalSpace,
                    Icon(Icons.newspaper, size: 80, color: Colors.grey),
                    10.verticalSpace,
                    AppText(
                      text: "No news available",
                      fontSize: 16,
                    ),
                    10.verticalSpace,
                    Appbutton(
                        label: "Refresh",
                        onTap: () => readHome.fetchNewsCategory())
                  ],
                ),
              SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                      children: List.generate(
                          watchHome.newsCategories.categories?.length ?? 0,
                          (index) => Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: size.width * 0.04),
                                child: GestureDetector(
                                  onTap: () {
                                    readHome.selectNewsCategory(
                                        category: watchHome.newsCategories
                                                .categories?[index].file ??
                                            "");
                                  },
                                  child: AppText(
                                      text: watchHome.newsCategories
                                              .categories?[index].name ??
                                          "",
                                      fontSize: watchHome.selectedCategory ==
                                              watchHome.newsCategories
                                                  .categories?[index].file
                                          ? 18
                                          : 14,
                                      fontWeight: watchHome.selectedCategory ==
                                              watchHome.newsCategories
                                                  .categories?[index].file
                                          ? FontWeight.w700
                                          : FontWeight.w400),
                                ),
                              )))),
              20.verticalSpace,
              Expanded(
                  child: watchHome.state is FetchingArticle ||
                          watchHome.state is FetchingCategory
                      ? ListView(
                          padding: EdgeInsets.zero,
                          children: List.generate(
                              4,
                              (index) => AppshadowContainer(
                                    height: size.height * 0.2,
                                    width: size.width,
                                    color: AppColors.textGray0,
                                    shadowcolour: AppColors.black.withAlpha(10),
                                    margin: EdgeInsets.only(
                                        bottom: size.width * 0.04),
                                    padding: EdgeInsets.all(size.width * 0.04),
                                  )))
                      : ListView(
                          padding: EdgeInsets.zero,
                          children: List.generate(
                              watchHome.newsArticle.clusters?.length ?? 0,
                              (index) => AppshadowContainer(
                                    onTap: () {
                                      context.push(RouteName.bookDetail.path,
                                          extra: watchHome
                                              .newsArticle.clusters?[index]);
                                    },
                                    shadowcolour: AppColors.black.withAlpha(10),
                                    margin: EdgeInsets.only(
                                        bottom: size.width * 0.04),
                                    padding: EdgeInsets.all(size.width * 0.04),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          AppText(
                                              text: watchHome.newsArticle
                                                      .clusters?[index].title ??
                                                  "",
                                              maxLines: 3,
                                              fontWeight: FontWeight.w600),
                                          5.verticalSpace,
                                          AppText(
                                              text: watchHome
                                                      .newsArticle
                                                      .clusters?[index]
                                                      .shortSummary ??
                                                  "",
                                              fontSize: 12,
                                              maxLines: 5),
                                          8.verticalSpace,
                                          if (watchHome.newsArticle
                                                  .clusters?[index].location
                                                  .toString() !=
                                              '')
                                            Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Icon(Icons.place_outlined,
                                                      color: Colors.blue,
                                                      size: 15.sp),
                                                  AppText(
                                                      text: watchHome
                                                              .newsArticle
                                                              .clusters?[index]
                                                              .location ??
                                                          "",
                                                      color: Colors.blue,
                                                      fontSize: 10)
                                                ])
                                        ]),
                                  ))))
            ],
          ),
        ));
  }
}
