import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:task_creative_repo/feature/home/domain/use_case/search_repo_use_case.dart';

import 'core/utils/api_service.dart';
import 'feature/home/data/data_sources/local_data_source.dart';
import 'feature/home/data/data_sources/repo_remote_data_source.dart';
import 'feature/home/data/repo_impl/repository_repo_impl.dart';
import 'feature/home/domain/use_case/fetch_repos_use_case.dart';

final getIt = GetIt.instance;

void setUpServiceLocator() {
  getIt.registerSingleton<ApiService>(
    ApiService(
      Dio(),
    ),
  );

  getIt.registerSingleton<FetchReposUseCase>(FetchReposUseCase(
      repositoryRepo: RepositoryRepoImpl(
        repoLocalDataSource: HomeLocalDataSourceImpl(),
          repoRemoteDataSource:
              RepoRemoteDataSourceImpl(apiService: getIt.get<ApiService>()))));

  getIt.registerSingleton<SearchReposUseCase>(SearchReposUseCase(
      repositoryRepo: RepositoryRepoImpl(
          repoLocalDataSource: HomeLocalDataSourceImpl(),
          repoRemoteDataSource:
          RepoRemoteDataSourceImpl(apiService: getIt.get<ApiService>()))));
}
