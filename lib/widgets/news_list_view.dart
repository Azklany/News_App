import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/widgets/news_tile.dart';


class NewsListView extends StatelessWidget {
  const NewsListView({super.key, required this.articles});

  final List<ArticleModel> articles ;

  @override
  Widget build(BuildContext context) {
    return  SliverList(
                delegate: SliverChildBuilderDelegate(
                childCount: articles.length,
                (context, index) {
                  return NewsTile(article: articles[index]);
                },
              ));
  }
}

// ListView.builder(
//       shrinkWrap: true,
//       physics: const NeverScrollableScrollPhysics(),
//       itemCount: 5,
//       itemBuilder: (context, index) {
//         return const NewsTile();
//       },
//     )
