import 'dart:async';
import 'package:practice/data/ApiProvider.dart';
import 'package:practice/data/model/login_response.dart';
import 'package:rxdart/rxdart.dart';
import '../bloc.dart';

class LoginBloc implements Bloc {
  final _client = ApiProvider();
  final _searchQueryController = StreamController<String?>();
  Sink<String?> get searchQuery => _searchQueryController.sink;
  late Stream<LoginResponse> loginStream;

 /* LoginBloc() {
    loginStream = _searchQueryController.stream
        .startWith(null) // 1
        .debounceTime(const Duration(milliseconds: 100)) // 2
        .switchMap(
          (userName, pwd) => _client
          .userLogin(userName, pwd)
          .asStream() // 4
          .startWith(null), // 5
    );
  }*/

  @override
  void dispose() {
    _searchQueryController.close();
  }
}
