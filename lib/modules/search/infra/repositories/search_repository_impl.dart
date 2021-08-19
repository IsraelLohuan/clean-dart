import 'package:github_search_dart_clean/modules/search/domain/errors/errors.dart';
import 'package:github_search_dart_clean/modules/search/domain/entities/result_search.dart';
import 'package:dartz/dartz.dart';
import 'package:github_search_dart_clean/modules/search/domain/repositories/search_repository.dart';
import 'package:github_search_dart_clean/modules/search/infra/datasources/search_datasource.dart';

class SearchRepositoryImpl implements SearchRepository {
  final SearchDatasource datasource;
  
  SearchRepositoryImpl(this.datasource);
  
  @override
  Future<Either<FailureSearch, List<ResultSearch>>> search(String searchText) async {
    try {
      final result = await datasource.getSearch(searchText);
      return Right(result);
    } catch(e) {
      return Left(DatasourceError());
    }
  }
}