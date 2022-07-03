import '../data_provider/data_provider.dart';
import '../model/article_model.dart';

class NewsRepository {
  final DataProvider dataProvider = DataProvider();

  Future<List<Article>> getArticles(String categoryName, String country) async {
    return await dataProvider.getArticles(categoryName, country);
  }
}
