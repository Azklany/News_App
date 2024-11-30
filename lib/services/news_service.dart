import 'package:dio/dio.dart';
import 'package:news_app/models/article_model.dart';

class NewsService {
  Dio dio = Dio();

  Future<List<ArticleModel>> getGeneralNews({required String category}) async {
    try {
      Response respone = await dio.get(
          "https://gnews.io/api/v4/search?q=$category&lang=ar&country=eg&apikey=59ceeb9cf186b50d3ee4b035e9103ac9");
      Map<String, dynamic> jsonData = respone.data;
      List<dynamic> articles = jsonData["articles"];

      List<ArticleModel> listOfArticle = [];
      for (var article in articles) {
        ArticleModel articleModel = ArticleModel.fromJson(article);
        listOfArticle.add(articleModel);
      }
      // List<ArticleModel> listOfArticle = articles
      //     .map(
      //       (e) => ArticleModel(
      //         url: e["url"],
      //         image: e["image"],
      //         title: e["title"],
      //         subTitle: e["description"],
      //       ),
      //     )
      //     .toList();
      return listOfArticle;
    } catch (e) {
      return [];
    }
    // for (var article in articles) {
    //   ArticleModel(
    //       image: article["urlToImage"],
    //       title: article["title"],
    //       subTitle: article["description"]);
    //
    // }
    //
  }
}
