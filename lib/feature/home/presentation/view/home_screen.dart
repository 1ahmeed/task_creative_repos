import 'package:flutter/material.dart';
import 'package:task_creative_repo/feature/home/presentation/cubit/repo_cubit.dart';
import 'package:task_creative_repo/feature/home/presentation/view/widgets/result_body_view.dart';

class HomeScreen extends  StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResultBodyView();
  }
}
