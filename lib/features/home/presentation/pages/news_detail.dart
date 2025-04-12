import 'package:news_app/core/config/page_route/route_name.dart';
import 'package:news_app/core/utils/useful_methods.dart';
import 'package:news_app/features/home/data/model/news_article.dart';
import 'package:news_app/features/home/presentation/pages/webview.dart';
import 'package:news_app/global_widget/export.dart';

class NewsDetailPage extends StatelessWidget {
  final Clusters news;

  const NewsDetailPage({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return AppScaffold(
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
          child: Column(
            children: [
              AppbarWidget(title: news.category ?? ''),
              20.verticalSpace,
              Expanded(
                child: ListView(
                  children: [
                    AppText(
                        text: news.title ?? "",
                        maxLines: 2,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                    const SizedBox(height: 12),
                    AppText(
                        text: news.shortSummary ?? '',
                        maxLines: 1000,
                        fontSize: 12),
                    const Divider(height: 32),
                    AppText(text: "Did You Know", fontWeight: FontWeight.w600),
                    AppText(
                        text: news.didYouKnow ?? '',
                        maxLines: 100,
                        fontSize: 12),
                    const Divider(height: 32),
                    AppText(
                        text: "Talking Points", fontWeight: FontWeight.w600),
                    ...news.talkingPoints.map((point) => ListTile(
                          leading: const Icon(Icons.bolt),
                          title:
                              AppText(text: point, maxLines: 100, fontSize: 12),
                        )),
                    const Divider(height: 32),
                    AppText(text: "Quote", fontWeight: FontWeight.w600),
                    Card(
                      color: Colors.grey.shade100,
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('"${news.quote}"',
                                style: const TextStyle(
                                    fontStyle: FontStyle.italic)),
                            const SizedBox(height: 8),
                            AppText(
                                text: "- ${news.quoteAuthor}",
                                fontSize: 12,
                                maxLines: 3,
                                fontWeight: FontWeight.w600),
                            TextButton(
                              onPressed: () {
                                context.push(RouteName.webview.path,
                                    extra: WebViewModel(
                                        title: '',
                                        url: news.quoteSourceUrl ?? ''));
                              },
                              child: const AppText(
                                  text: "Source", color: Colors.blueAccent),
                            ),
                          ],
                        ),
                      ),
                    ),
                    if (news.location?.toString() != '')
                      const Divider(height: 32),
                    if (news.location?.toString() != '')
                      AppText(text: "Location", fontWeight: FontWeight.w600),
                    AppText(text: news.location ?? '', fontSize: 12),
                    if (news.timeline.isNotEmpty) const Divider(height: 32),
                    if (news.timeline.isNotEmpty)
                      AppText(text: "Timeline", fontWeight: FontWeight.w600),
                    ...news.timeline.map((entry) => ListTile(
                          leading: const Icon(Icons.timeline),
                          title:
                              AppText(text: entry, fontSize: 12, maxLines: 50),
                        )),
                    if (news.perspectives?.isNotEmpty ?? false)
                      const Divider(height: 32),
                    if (news.perspectives?.isNotEmpty ?? false)
                      AppText(
                          text: "Perspectives", fontWeight: FontWeight.w600),
                    if (news.perspectives?.isNotEmpty ?? false)
                      Column(
                          children: List.generate(
                              news.perspectives?.length ?? 0,
                              (index) => Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      AppText(
                                          text:
                                              news.perspectives?[index].text ??
                                                  '',
                                          fontSize: 12,
                                          maxLines: 4),
                                      5.verticalSpace,
                                      Column(
                                          children: List.generate(
                                              news.perspectives?[index].sources
                                                      ?.length ??
                                                  0,
                                              (sourceIndex) => Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        AppText(
                                                            text:
                                                                "sources: ${news.perspectives?[index].sources?[sourceIndex].name ?? ''}",
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize: 12),
                                                        GestureDetector(
                                                          onTap: () {
                                                            context.push(
                                                                RouteName
                                                                    .webview
                                                                    .path,
                                                                extra: WebViewModel(
                                                                    title: news
                                                                            .perspectives?[
                                                                                index]
                                                                            .sources?[
                                                                                sourceIndex]
                                                                            .name ??
                                                                        '',
                                                                    url: news
                                                                            .perspectives?[index]
                                                                            .sources?[sourceIndex]
                                                                            .url ??
                                                                        ''));
                                                          },
                                                          child: AppText(
                                                              text:
                                                                  " ${news.perspectives?[index].sources?[sourceIndex].url ?? ''}",
                                                              maxLines: 3,
                                                              color:
                                                                  Colors.blue,
                                                              fontSize: 12),
                                                        ),
                                                        20.verticalSpace,
                                                      ])))
                                    ],
                                  ))),
                    if (news.perspectives?.isNotEmpty ?? false)
                      const Divider(height: 32),
                    if (news.articles?.isNotEmpty ?? false)
                      AppText(text: "Articles", fontWeight: FontWeight.w600),
                    10.verticalSpace,
                    if (news.articles?.isNotEmpty ?? false)
                      Column(
                          children: List.generate(
                              news.articles?.length ?? 0,
                              (index) => AppshadowContainer(
                                    margin: EdgeInsets.only(
                                        bottom: size.height * 0.04),
                                    padding: EdgeInsets.all(size.height * 0.02),
                                    shadowcolour:
                                        AppColors.textGray0.withAlpha(50),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        AppNetwokImage(
                                            height: size.width * 0.2,
                                            width: size.width * 0.2,
                                            fit: BoxFit.cover,
                                            radius: 10.r,
                                            imageUrl:
                                                news.articles?[index].image ??
                                                    ''),
                                        SizedBox(
                                          width: size.width * 0.61,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              AppText(
                                                  text: news.articles?[index]
                                                          .title ??
                                                      '',
                                                  maxLines: 3,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 12),
                                              if (news.articles?[index]
                                                      .imageCaption
                                                      .toString() !=
                                                  "")
                                                AppText(
                                                    text: news.articles?[index]
                                                            .imageCaption ??
                                                        '',
                                                    maxLines: 10,
                                                    fontSize: 10),
                                              GestureDetector(
                                                onTap: () {
                                                  context.push(
                                                      RouteName.webview.path,
                                                      extra: WebViewModel(
                                                          title: news
                                                                  .articles?[
                                                                      index]
                                                                  .title ??
                                                              '',
                                                          url: news
                                                                  .articles?[
                                                                      index]
                                                                  .link ??
                                                              ''));
                                                },
                                                child: AppText(
                                                    text: news.articles?[index]
                                                            .link ??
                                                        '',
                                                    maxLines: 3,
                                                    color: Colors.blue,
                                                    fontSize: 12),
                                              ),
                                              Align(
                                                alignment:
                                                    Alignment.centerRight,
                                                child: AppText(
                                                    text: UsefulMethods
                                                        .formatDate(
                                                            date: news
                                                                    .articles?[
                                                                        index]
                                                                    .date ??
                                                                DateTime.now()
                                                                    .toString()),
                                                    fontSize: 12),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  )))
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
