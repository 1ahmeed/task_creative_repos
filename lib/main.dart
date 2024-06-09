import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:task_creative_repo/core/utils/constant.dart';
import 'package:task_creative_repo/feature/home/domain/entitiy/repo_entity.dart';
import 'package:task_creative_repo/feature/home/domain/use_case/search_repo_use_case.dart';

import 'bloc_observer.dart';
import 'core/utils/app_routes.dart';
import 'feature/home/domain/use_case/fetch_repos_use_case.dart';
import 'feature/home/presentation/cubit/repo_cubit.dart';
import 'injection_container.dart';

void main()async {
  Bloc.observer = MyBlocObserver();
  setUpServiceLocator();
  await Hive.initFlutter();
  Hive.registerAdapter(RepoEntityAdapter());
  await Hive.openBox<RepoEntity>(kFeaturedRepo);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
        BlocProvider(
        create: (context) => RepoCubit(
          searchReposUseCase:getIt.get<SearchReposUseCase>(),
        fetchReposUseCase:getIt.get<FetchReposUseCase>()
    )..fetchRepos()),

    ],

    child: const MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRoutes.onGenerateRoute,

    ),);


  }
}


