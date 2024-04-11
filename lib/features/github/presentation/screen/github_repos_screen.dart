import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:ultimate_flutter_project/features/github/presentation/controller/github_repos/github_repos_bloc.dart';
import 'package:ultimate_flutter_project/features/github/presentation/controller/github_repos/github_repos_ui_event.dart';
import 'package:ultimate_flutter_project/features/github/presentation/controller/github_repos/github_repos_ui_state.dart';

class GithubReposScreen extends StatelessWidget {
  const GithubReposScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.I<GithubReposBloc>()..add(OnInitScreen()),
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<GithubReposBloc, GithubReposUiState>(
            buildWhen: (previous, next) =>
                previous.githubRepoList != next.githubRepoList,
            builder: (context, state) {
              return ListView.separated(
                itemBuilder: (context, index) {
                  final repo = state.githubRepoList[index];
                  return ListTile(
                    title: Text(repo.name),
                    subtitle: Text(repo.description),
                  );
                },
                separatorBuilder: (context, index) {
                  return const Divider();
                },
                itemCount: state.githubRepoList.length,
              );
            },
          ),
        ),
      ),
    );
  }
}
