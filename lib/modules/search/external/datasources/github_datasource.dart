import 'package:dio/dio.dart';
import 'package:github_search_dart_clean/modules/search/domain/errors/errors.dart';
import 'package:github_search_dart_clean/modules/search/domain/entities/result_search.dart';
import 'package:dartz/dartz.dart';
import 'package:github_search_dart_clean/modules/search/domain/repositories/search_repository.dart';
import 'package:github_search_dart_clean/modules/search/infra/datasources/search_datasource.dart';
import 'package:github_search_dart_clean/modules/search/infra/models/result_search_model.dart';

extension on String {
  normalize() {
    return this.replaceAll(" ", "+");
  }
}

class GithubDatasource implements SearchDatasource {
  final Dio dio;

  GithubDatasource(this.dio);
  
  @override
  Future<List<ResultSearchModel>> getSearch(String searchText) async {
    final response = await dio.get('https://api.github.com/search/users?q=${searchText.normalize()}');

    if(response.statusCode == 200) {
      final list = (response.data['items'] as List).map((item) => ResultSearchModel.fromMap(item)).toList();

      return list;
    }

    throw DatasourceError();
  }
}