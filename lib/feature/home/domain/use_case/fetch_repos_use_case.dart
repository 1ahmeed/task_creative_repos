import 'package:dartz/dartz.dart';

import '../../../../core/errors/failuer.dart';
import '../../../../core/use_cases/use_case.dart';
import '../entitiy/repo_entity.dart';
import '../repo/repo.dart';


class FetchReposUseCase extends UseCase<List<RepoEntity>,int> {
  final RepositoryRepo repositoryRepo;

  FetchReposUseCase({required this.repositoryRepo});

  @override
  Future<Either<Failures, List<RepoEntity>>> call([int? param = 0]) async {
    return await repositoryRepo.fetchRepos(pageNum: param!);
  }

}

