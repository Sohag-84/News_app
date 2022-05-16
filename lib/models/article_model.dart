// ignore_for_file: prefer_typing_uninitialized_variables

class ArticleModel {
  var author;
  var tittle;
  var description;
  var url;
  var urlToImage;
  var content;
  ArticleModel(
      {required this.author,
        required this.tittle,
        required this.description,
        required this.url,
        required this.urlToImage,
        required this.content,});
}
