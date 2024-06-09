
import 'package:dio/dio.dart';

import '../../../../core/save_books.dart';
import '../../../../core/utils/api_service.dart';

import '../../../../core/utils/constant.dart';
import '../../domain/entitiy/repo_entity.dart';
import '../model/RepoModel.dart';

abstract class RepoRemoteDataSource {
  Future<List<RepoEntity>> fetchRepos({int pageNum=0});
  Future< List<RepoEntity>> searchRepos({String nameOwner});

}

class RepoRemoteDataSourceImpl extends RepoRemoteDataSource {
  final ApiService apiService;

  RepoRemoteDataSourceImpl({required this.apiService});

  @override
  Future<List<RepoEntity>> fetchRepos({int pageNum=0}) async {
    //
    print("remote data source");
    var data = await apiService.get(
        endPoint: 'square/repos?page=$pageNum&per_page=10');
    List<RepoEntity> reposList = getReposList(data);
    saveBox(reposList,kFeaturedRepo);
    return reposList;
  }

  @override
  Future<List<RepoEntity>> searchRepos({String? nameOwner})async {
    var data = await apiService.get(
        endPoint:
        '$nameOwner/repos?page=0&per_page=10'
    );
    print(data);
    List<RepoEntity> books = getReposList(data);

    return books;
  }

}

List<RepoEntity> getReposList(List<dynamic>? data) {
  List<RepoEntity> reposList = [];
  for (var item in data!) {
    reposList.add(RepoModel.fromJson(item));
  }
  return reposList;
}
