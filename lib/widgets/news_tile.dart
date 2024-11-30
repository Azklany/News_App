import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsTile extends StatelessWidget {
  const NewsTile({super.key, required this.article});

  final ArticleModel article;

  @override
  Widget build(BuildContext context) {
    WebViewController webViewController = WebViewController();
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return WebViewWidget(
                  controller: webViewController
                    ..loadRequest(Uri.parse(article.url)));
            },
          ));
        },
        child: Column(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: CachedNetworkImage(
                  imageUrl: article.image!,
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                  errorWidget: (context, url, error) => const SizedBox(
                      height: 180,
                      width: double.infinity,
                      child: Icon(
                        Icons.error,
                        size: 100,
                        color: Colors.red,
                      )),
                )),
            Text(
              article.title,
              style: const TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.black),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              article.subTitle ?? "",
              style: const TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.grey),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
