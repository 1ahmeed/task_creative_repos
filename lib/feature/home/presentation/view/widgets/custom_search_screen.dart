import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_creative_repo/feature/home/presentation/cubit/repo_cubit.dart';

import '../../../../../core/widgets/custom_text_form_field.dart';


class CustomSearchScreen extends StatelessWidget {
  CustomSearchScreen({Key? key}) : super(key: key);
  final formKey = GlobalKey<FormState>();
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RepoCubit, RepoState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Column(
          children: [
            Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: CustomTextFormField(
                  controller: searchController,
                  prefixIcon: Icons.search,
                  onSubmit: (value) {
                    if (formKey.currentState!.validate()) {
                      RepoCubit.get(context)
                          ?.searchRepos(name:searchController.text);
                      searchController.clear();
                    }
                  },
                  validate: (value) {
                    if (value!.isEmpty) {
                      return "please enter the name";
                    } else {
                      return null;
                    }
                  },
                  hintText: "Enter The name",
                ),
              ),
            ),
            // if(state is SearchSuccessState)
            //   Expanded(
            //     child: ListView.builder(
            //       // controller: _scrollController,
            //         physics: const BouncingScrollPhysics(),
            //         itemCount: state.reposList.length,
            //         itemBuilder: (context, index) =>
            //             Padding(
            //               padding: const EdgeInsets.all(15.0),
            //               child: RepositoryItem(
            //                   reposList: state.reposList[index]),
            //             )),
            //   ),
            // if(state is SearchErrorState)
            //   Center(child: Text(state.errorMessage),),
            // if(state is SearchLoadingState)
            //   const Center(child: CircularProgressIndicator(),),
            const SizedBox(height: 10,),
          ],
        );
      },
    );
  }
}
