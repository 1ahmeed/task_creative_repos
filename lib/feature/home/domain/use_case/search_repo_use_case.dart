import 'package:dartz/dartz.dart';

import '../../../../core/errors/failuer.dart';
import '../../../../core/use_cases/use_case.dart';
import '../entitiy/repo_entity.dart';
import '../repo/repo.dart';


class SearchReposUseCase extends UseCase<List<RepoEntity>,String> {
  final RepositoryRepo repositoryRepo;

  SearchReposUseCase({required this.repositoryRepo});

  @override
  Future<Either<Failures, List<RepoEntity>>> call( [String? param]) async{
    return await repositoryRepo.searchRepos( nameOwner: param!);
  }

}