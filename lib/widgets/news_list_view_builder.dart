import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/services/news_service.dart';
import 'package:news_app/widgets/news_list_view.dart';

class NewsListViewBuilder extends StatefulWidget {
  const NewsListViewBuilder({super.key, required this.category});

  final String category;

  @override
  State<NewsListViewBuilder> createState() => _NewsListViewBuilderState();
}

class _NewsListViewBuilderState extends State<NewsListViewBuilder> {
  bool isLoading = true;

  var articles;

  @override
  void initState() {
    super.initState();
    articles = NewsService().getGeneralNews(category: widget.category);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ArticleModel>>(
      future: articles,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return NewsListView(articles: snapshot.data!);
        } else if (snapshot.hasError) {
          return const SliverToBoxAdapter(
              child: Center(child: Text("OPS thers is problem!")));
        } else {
          return const SliverToBoxAdapter(
              child: Center(
                  child: SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator())));
        }
      },
    );
  }
}

// isLoading
//         ? SliverToBoxAdapter(
//             child = const Center(
//                 child: SizedBox(
//                     height: 20, width: 20, child: CircularProgressIndicator())))
//         : articles.isEmpty
//             ? SliverToBoxAdapter(
//                 child = const Center(child: Text("OPS thers is problem!")))
//             : NewsListView(articles = articles);