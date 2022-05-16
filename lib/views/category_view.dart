import 'package:flutter/material.dart';

import '../controllers/news.dart';
import '../models/article_model.dart';
import 'home_screen.dart';

class CategoryNews extends StatefulWidget {
  final String category;
  const CategoryNews({Key? key, required this.category}) : super(key: key);

  @override
  _CategoryNewsState createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {
  List<ArticleModel> articles = <ArticleModel>[];
  bool _loading = true;

  getCategoryNews() async {
    CatergoryNews newsClass = CatergoryNews();
    await newsClass.fetchCategoryNews(widget.category); //this is from api operation
    articles = newsClass.news;

    setState(() {
      _loading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getCategoryNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              "Flutter",
              style: TextStyle(color: Colors.black),
            ),
            Text(
              "News",
              style: TextStyle(color: Colors.blue),
            )
          ],
        ),
        actions: [
          Opacity(
            opacity: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: const Icon(Icons.save),
            ),
          )
        ],
      ),
      body: _loading
          ? const Center(
        child: CircularProgressIndicator(),
      )
          : Container(
        child: Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15,top: 10, bottom: 10),
          child: Column(
            children: [
              Container(
                child: Expanded(
                  child: Container(
                    child: ListView.builder(
                        shrinkWrap: true,
                        physics: const ClampingScrollPhysics(),
                        itemCount: articles.length,
                        itemBuilder: ((context, index) {
                          return BlogTile(
                            imageUrl: articles[index].urlToImage,
                            title: articles[index].tittle,
                            description: articles[index].description,
                            newsUrl: articles[index].url,
                          );
                        })),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
