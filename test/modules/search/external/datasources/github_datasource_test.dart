import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:github_search_dart_clean/modules/search/domain/errors/errors.dart';
import 'package:github_search_dart_clean/modules/search/external/datasources/github_datasource.dart';
import 'package:mockito/mockito.dart';

import '../../utils/github_response.dart';

class DioMock extends Mock implements Dio {

}

main() {

  final dio = DioMock();
  
  final datasource = GithubDatasource(dio);

  test('deve retornar uma lista de ResultSearchModel', () async {
    
    when(dio.get(any)).thenAnswer((_) async => Response(data: jsonDecode(githubResult), statusCode: 200));

    final future = datasource.getSearch("searchText");
    expect(future, completes);
  });

  test('deve retornar um DatasourceError se o código não for 200', () async {
    
    when(dio.get(any)).thenAnswer((_) async => Response(data: null, statusCode: 401));

    final future = datasource.getSearch("searchText");
    expect(future, throwsA(isA<DatasourceError>()));
  });
}

