import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_creative_repo/feature/home/presentation/view/widgets/repository_item.dart';

import '../../../../../core/function/custom_snackbar.dart';
import '../../../../../core/widgets/custom_error_widget.dart';
import '../../../domain/entitiy/repo_entity.dart';
import '../../../domain/repo/repo.dart';
import '../../cubit/repo_cubit.dart';
import 'custom_search_screen.dart';

class ResultBodyView extends StatefulWidget {
  ResultBodyView({
    Key? key,
  }) : super(key: key);

  @override
  State<ResultBodyView> createState() => _ResultBodyViewState();
}

class _ResultBodyViewState extends State<ResultBodyView> {
  late final ScrollController _scrollController;

  var nextPage = 1;

  var isLoading = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() async {
    var currentPositions = _scrollController.position.pixels;
    var maxScrollLength = _scrollController.position.maxScrollExtent;
    if (currentPositions >= 0.7 * maxScrollLength) {
      if (!isLoading) {
        isLoading = true;
        await RepoCubit.get(context)?.fetchRepos(pageNum: nextPage++);
        isLoading = false;
      }
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  List<RepoEntity> repos = [];
  List<RepoEntity> searchResult = [];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RepoCubit, RepoState>(
        listener: (context, state) {
          if(state is SearchSuccessState){
            searchResult.addAll(state.reposList);
          }
          if (state is RepoSuccessState) {
            repos.addAll(state.reposList);
          }
          if (state is RepoPaginationError) {
            customSnackBar(context, state.errorMessage);
          }
        },
        builder: (context, state) {
            if (state is RepoSuccessState ||
                state is RepoPaginationError ||
                state is RepoPaginationLoadingState) {
              return Scaffold(
                body: SafeArea(
                  child: RefreshIndicator(
                    onRefresh:() => RepoCubit.get(context)!.fetchRepos(),
                    child: Column(
                      children: [
                        CustomSearchScreen(),
                        Expanded(
                          child: ListView.builder(
                              controller: _scrollController,
                              physics: const BouncingScrollPhysics(),
                              itemCount: repos.length,
                              itemBuilder: (context, index) =>
                                  Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: RepositoryItem(
                                        reposList: repos[index]),
                                  )),
                        ),

                      ],
                    ),
                  ),
                ),
              );
            }
          else if (state is RepoErrorState) {
              return Scaffold(
                body: CustomErrorWidget(errorMessage: state.errorMessage),
              );
            }
            else if(state is SearchSuccessState){
              return  Scaffold(
                body: SafeArea(
                  child: Column(
                    children: [
                      CustomSearchScreen(),
                      const SizedBox(height: 10,),
                      Expanded(
                        child: ListView.builder(
                          // controller: _scrollController,
                            physics: const BouncingScrollPhysics(),
                            itemCount:state.reposList.length,
                            itemBuilder: (context, index) => Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: RepositoryItem(
                                  reposList:state.reposList[index]),
                            )),
                      )
                    ],
                  ),
                ),
              );
            }
            else if(state is SearchErrorState) {
             return Scaffold(
                body: SafeArea(
                  child: Column(
                    children: [

                      CustomSearchScreen(),
                      const SizedBox(height: 10,),
                      Center(child: Text(state.errorMessage),)
                    ],
                  ),
                ),
              );
            }else  if(state is SearchLoadingState) {
              return Scaffold(
                body: SafeArea(
                  child: Column(
                    children: [
                      CustomSearchScreen(),
                      const SizedBox(height: 10,),
                      const Center(child: CircularProgressIndicator(),)
                    ],
                  ),
                ),
              );
            } else{
              return const Scaffold(
                body: Center(
                  child: CircularProgressIndicator()
                ),
              );
            }

        });
  }
}
