import 'dart:async';
import 'package:practice/data/ApiProvider.dart';
import 'package:rxdart/rxdart.dart';

import '../data/model/article.dart';
import 'bloc.dart';

class ArticleListBloc implements Bloc {
  final _client = ApiProvider();
  final _searchQueryController = StreamController<String?>();
  Sink<String?> get searchQuery => _searchQueryController.sink;
  late Stream<List<Article>?> articlesStream;

  ArticleListBloc() {
    articlesStream = _searchQueryController.stream
        .startWith(null) // 1
        .debounceTime(const Duration(milliseconds: 100)) // 2
        .switchMap(
      // 3
          (query) => _client
          .fetchArticleData(query)
          .asStream() // 4
          .startWith(null), // 5
    );
  }

  @override
  void dispose() {
    _searchQueryController.close();
  }
}
