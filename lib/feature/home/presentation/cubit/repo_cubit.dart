import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entitiy/repo_entity.dart';
import '../../domain/repo/repo.dart';
import '../../domain/use_case/fetch_repos_use_case.dart';
import '../../domain/use_case/search_repo_use_case.dart';

part 'repo_state.dart';

class RepoCubit extends Cubit<RepoState> {
  RepoCubit({required this.fetchReposUseCase,required this.searchReposUseCase}) : super(RepoInitial());

  static RepoCubit? get(context) => BlocProvider.of(context);

  FetchReposUseCase fetchReposUseCase;


  Future<void> fetchRepos({int pageNum=0}) async {
    if(pageNum==0){
      emit(RepoLoadingState());
    }else{
      emit(RepoPaginationLoadingState());
    }
    var result = await fetchReposUseCase.call();
    result.fold((failure) {
      if(pageNum==0){
        emit(RepoErrorState(failure.errorMessage));
      }else{
        emit(RepoPaginationError(failure.errorMessage));
      }

    }, (books) {
      emit(RepoSuccessState(books));
    });
  }


  final SearchReposUseCase? searchReposUseCase;


  Future<void> searchRepos({
    String? name
  })async {
    emit(SearchLoadingState());
    var result = await searchReposUseCase!.call(name);
    result.fold((failure) {
      emit(SearchErrorState(failure.errorMessage));
    }, (repos) {
      emit(SearchSuccessState(repos));
    });
  }


}
