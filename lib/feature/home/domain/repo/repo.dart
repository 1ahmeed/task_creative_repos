import 'package:dartz/dartz.dart';
import '../../../../core/errors/failuer.dart';
import '../entitiy/repo_entity.dart';

abstract class RepositoryRepo {
  Future<Either<Failures, List<RepoEntity>>> fetchRepos({int pageNum=0});

  Future<Either<Failures, List<RepoEntity>>> searchRepos({String nameOwner});
}
