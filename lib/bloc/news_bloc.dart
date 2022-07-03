import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/news_event.dart';
import '../bloc/news_state.dart';
import 'package:news_apps_bloc_rest_api/model/article_model.dart';
import 'package:news_apps_bloc_rest_api/repository/news_repository.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  // static String countryName = 'tr';
  NewsBloc() : super(NewsInitialState()) {
    on<NewsEvent>((event, emit) async {
      if (event is GetArticlesEvent) {
        emit(NewsLoadingState());
        try {
          String categoryName = event.categoryName;
          String countryName = event.countryName;
          final NewsRepository newsRepository = NewsRepository();
          List<Article> articles =
              await newsRepository.getArticles(categoryName, countryName);
          emit(NewsSuccessState(articles));
        } catch (e) {
          emit(NewsErrorState());
          throw ("Couldn't fetch data! BLOC Error!");
        }
      }
    });
  }
}
