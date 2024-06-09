part of 'repo_cubit.dart';

@immutable
abstract class RepoState {}

class RepoInitial extends RepoState {}

class RepoLoadingState extends RepoState {}
class RepoPaginationLoadingState extends RepoState {}

class RepoSuccessState extends RepoState {
  final List<RepoEntity> reposList;

  RepoSuccessState(this.reposList);
}

class RepoErrorState extends RepoState {
  final String errorMessage;

  RepoErrorState(this.errorMessage);
}
class RepoPaginationError extends RepoState {
  final String errorMessage;

  RepoPaginationError(this.errorMessage);
}


class SearchLoadingState extends RepoState {}

class SearchSuccessState extends RepoState {
  final List<RepoEntity> reposList;

  SearchSuccessState(this.reposList);
}

class SearchErrorState extends RepoState {
  final String errorMessage;

  SearchErrorState(this.errorMessage);
}
