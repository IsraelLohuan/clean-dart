import 'package:github_search_dart_clean/modules/search/domain/entities/result_search.dart';
import 'package:github_search_dart_clean/modules/search/domain/errors/errors.dart';

abstract class SearchState {

}

class SearchSuccess implements SearchState {
  final List<ResultSearch> list;

  SearchSuccess(this.list);
}

class SearchStart implements SearchState {

}

class SearchLoading implements SearchState {

}

class SearchError implements SearchState {
  final FailureSearch error;

  SearchError(this.error);
}
