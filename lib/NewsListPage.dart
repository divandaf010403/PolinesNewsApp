import 'package:polines_news_app/article.dart';
import 'package:flutter/material.dart';
import 'package:polines_news_app/NewsDetailPage.dart';

class NewsListPage extends StatelessWidget {
  static const routeName = '/article_list';
  const NewsListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Polines News'),
      ),
      body: FutureBuilder<String>(
        future: DefaultAssetBundle.of(context).loadString('newsPage/articles.json'),
        builder: (context, snapshot) {
          final List<Article> articles = parseArticles(snapshot.data);
          return ListView.builder(
            itemCount: articles.length,
            itemBuilder: (context, index) {
              return _buildArticleItem(context, articles[index]);
            },
          );
        },
      ),
    );
  }
}

Widget _buildArticleItem(BuildContext context, Article article) {
  return ListTile(
    contentPadding:  EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
    leading: Image.network(article.urlToImage, width: 100,),
    title: Text(article.title,),
    subtitle: Text(article.author,),
    onTap: (){Navigator.pushNamed(context, NewsDetailPage.routeName, arguments: article);},
  );
}
