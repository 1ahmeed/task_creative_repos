import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';


import '../../../../core/errors/failuer.dart';
import '../../domain/entitiy/repo_entity.dart';
import '../../domain/repo/repo.dart';
import '../data_sources/local_data_source.dart';
import '../data_sources/repo_remote_data_source.dart';

class RepositoryRepoImpl implements RepositoryRepo {
  final RepoRemoteDataSource repoRemoteDataSource;
  final HomeLocalDataSource repoLocalDataSource;

  RepositoryRepoImpl( {
    required this.repoRemoteDataSource,
    required this.repoLocalDataSource,
  });

  @override
  Future<Either<Failures, List<RepoEntity>>> fetchRepos({int pageNum = 0}) async {
    try {
      List<RepoEntity> books;
      books = repoLocalDataSource.fetchRepos(pageNum: pageNum);
      if (books.isNotEmpty) {
        return right(books);
      }
      List<RepoEntity> reposList = await repoRemoteDataSource.fetchRepos(pageNum: pageNum);
      return right(reposList);


    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failures, List<RepoEntity>>> searchRepos({String? nameOwner})async {

    try {
      List<RepoEntity> books;
       books = await repoRemoteDataSource.searchRepos(nameOwner: nameOwner!,);
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }


}
